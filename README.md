# Chrome Dependencies Dev Container Feature

This repository provides a Dev Container Feature that installs common Chrome-related dependencies required for browser automation and testing.

## Usage

```jsonc
{
    "name": "Your Dev Container",
    "features": {
        "ghcr.io/yourusername/chrome-deps:1": {}
    }
}
```

## Included Dependencies

This feature installs the following packages:
- chromium-common
- libasound2
- libgbm1
- libnss3
- sudo
- jq
- dbus
- dbus-x11
- mesa-utils
- etc.


These dependencies are commonly required for running Chrome/Chromium in headless mode, particularly useful for:
- Browser automation testing
- Puppeteer scripts
- Other headless browser operations
- Electron supported configurations

## Options

| Option | Default | Description |
|--------|---------|-------------|
| version | "latest" | Version of Chrome dependencies to install |

## Development

1. Fork and clone this repository
2. Make your changes
3. Test using `devcontainer features test`
4. Push changes and create a PR

## License

MIT

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
