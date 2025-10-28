#
# Cookbook:: my_app_deploy
# Recipe:: default
#

# 1️⃣ Ensure Node.js is installed
# The `package` resource works only for known Windows packages (like MSI/exe installers in PATH).
# We'll instead check and install Node.js using Chocolatey (Windows package manager).
# You can skip this if Node is already installed manually.
powershell_script 'Install Node.js' do
  code <<-EOH
    if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
      Set-ExecutionPolicy Bypass -Scope Process -Force
      [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
      iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
      choco install nodejs -y
    }
  EOH
end

# 2️⃣ Create deployment directory
directory 'C:/cd_app' do
  recursive true
  action :create
end

# 3️⃣ Copy app files
# remote_directory expects files packaged inside the cookbook.
# Since your app is outside (in the workspace), we’ll use Ruby’s file copy.
ruby_block 'Copy app files' do
  block do
    require 'fileutils'
    FileUtils.cp_r('E:/my-app-repo/app/.', 'C:/cd_app', remove_destination: true)
  end
end

# 4️⃣ Stop any running Node process and start the new one
powershell_script 'Restart Node.js app' do
  code <<-EOH
    Stop-Process -Name node -ErrorAction SilentlyContinue
    Start-Process -NoNewWindow -FilePath "node" -ArgumentList "C:/cd_app/server.js"
  EOH
end
