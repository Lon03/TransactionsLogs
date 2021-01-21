<h2 align="center">
    TransactionsLogs
</h2>

## Building and Running

You'll need a few things before we get started. 
Make sure you have Xcode installed from the App Store. 
Then run the following command to install Xcode's command line tools, if you don't have that yet
```sh
xcode-select --install
```

Install [`Bundler`](https://bundler.io) for managing Ruby gem dependencies
```sh
[sudo] gem install bundler
```

Install [Brew](https://github.com/Homebrew/brew) package manager for macOS:

For MacOS Catalina, macOS Mojave, and MacOS Big Sur:
```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

For macOS High Sierra, Sierra, El Capitan, and earlier:
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

The following commands will set up TransactionsLogs
```sh
cd TransactionsLogs
bundle install
bundle exec fastlane setup
```

To update all tools and pods
```sh
bundle exec fastlane update
```

Alrighty! We're ready to go!

## License
MIT License. See [LICENSE]().

