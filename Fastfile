# This file contains the fastlane.tools configuration
# You can find the documentation at https://docs.fastlane.tools
#
# For a list of all available actions, check out
#
#     https://docs.fastlane.tools/actions
#
# For a list of all available plugins, check out
#
#     https://docs.fastlane.tools/plugins/available-plugins
#

# Uncomment the line if you want fastlane to automatically update itself
# update_fastlane

default_platform(:ios)

platform :ios do

  desc "Install all libraries"
  lane :setup do
    sh("npm install -g apollo") # install apollo
    cocoapods # install pods
  end

  desc "Update all tools and pods"
  lane :update do
    sh("bundle update") # update node
    sh("npm update -g apollo") # update apollo
    sh("pod update") # update pods
  end

  desc "Runs all the tests"
  lane :test do
    scan
  end

  desc "Submit a new beta build to apple TestFlight"
  lane :beta do
    build_app(scheme: "TransactionsLogs",
              workspace: "TransactionsLogs.xcworkspace",
              include_bitcode: true,
              xcargs: "-allowProvisioningUpdates")

    pilot
  end

  desc "Deploy a new version to the App Store"
  lane :release do
    build_app(scheme: "TransactionsLogs",
              workspace: "TransactionsLogs.xcworkspace",
              include_bitcode: true,
              xcargs: "-allowProvisioningUpdates")

    deliver
  end

  lane :increment_build do
    increment_build_number
    commit_version_bump
  end

  lane :increment_version_patch do
    increment_version_number(
      bump_type: "patch"
    )
    increment_build
  end

  lane :increment_version_minor do
    increment_version_number(
      bump_type: "minor"
    )
    increment_build
  end

  lane :increment_version_major do
    increment_version_number(
      bump_type: "major"
    )
    increment_build
  end
end

