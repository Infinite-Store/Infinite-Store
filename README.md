<head>
	<link rel="icon" type="image/x-icon" href="favicon.ico">
</head>

<h1 align="center">
	Infinite Store
</h1>

<p align="center">
	The <em>cool</em> way to add plugins and themes to Infinite Yield!
</p>

<p align="center">
	<a href="https://github.com/Infinite-Store/Infinite-Store/releases/latest">
		<img alt="Release" src="https://img.shields.io/github/release-date-pre/Infinite-Store/Infinite-Store?label=latest%20release&style=flat-square">
	</a>
	<a href="https://discord.gg/dubhsUGcZe">
		<img alt="Discord" src="https://img.shields.io/discord/897257702126936075?color=%235865F2&logo=discord&logoColor=%23DCDDDE&style=flat-square">
	</a>
	<a href="https://github.com/Infinite-Store/Infinite-Store/issues">
		<img alt="Issues" src="https://img.shields.io/github/issues/Infinite-Store/Infinite-Store?color=0088ff&style=flat-square"/>
	</a>
	<a href="https://github.com/Infinite-Store/Infinite-Store/pulls">
		<img alt="Pulls" src="https://img.shields.io/github/issues-pr/Infinite-Store/Infinite-Store?color=0088ff&style=flat-square"/>
	</a>
	<a href="https://www.jsdelivr.com/package/gh/Infinite-Store/Infinite-Store">
		<img alt="jsDelivr" src="https://data.jsdelivr.com/v1/package/gh/Infinite-Store/Infinite-Store/badge"/>
	</a>
	<a href="./LICENSE.md">
		<img alt="License" src="https://img.shields.io/badge/license-ISL--1.0.2-red?style=flat-square"/>
	</a>
</p>

## Usage

The loader allows Infinite Store to always be kept up-to-date without re-downloading it every time you want to use it.\
You can download the Infinite Store loader directly [here](https://github.com/Infinite-Store/Infinite-Store/releases/latest/download/is.luau), or use one of these `loadstring()` loaders:

### For users

These loaders are for the latest stable version:

```lua
loadstring(game:HttpGetAsync("https://load.epik.ml/store.lua"))()
```

```lua
loadstring(game:HttpGetAsync("https://infinite-store.ml/main.luau"))()
```

```lua
loadstring(game:HttpGetAsync("https://cdn.jsdelivr.net/gh/Infinite-Store/Infinite-Store@main/main.luau"))()
```

### For developers

These loaders are for the latest development version:

```lua
getgenv().dev = true
loadstring(game:HttpGetAsync("https://load.epik.ml/store.lua"))()
```

```lua
loadstring(game:HttpGetAsync("https://cdn.jsdelivr.net/gh/Infinite-Store/Infinite-Store@development/main.luau"))()
```

## Important Information

If you are looking for tutorials and how-tos, check out the [Infinite Store Wiki](https://github.com/Infinite-Store/Infinite-Store/wiki).\
For even more help, join our [Discord](https://discord.gg/dubhsUGcZe) server!

## Contributions

Do you have your own plugin or want to update existing ones? You can do it by creating a fork and committing your files. Open a [pull request](https://github.com/Infinite-Store/Infinite-Store/compare) to get your changes accepted (compare across forks to select your fork).\
You may also open a pull request to add your plugin URLs from a source repository other than this one.

## Features

| Feature                                                                                  | Status |
| ---------------------------------------------------------------------------------------- | ------ |
| Home Page                                                                                | ✅      |
| Plugins Page                                                                             | ✅      |
| Settings                                                                                 | ✅      |
| Animations                                                                               | ✅      |
| [Wiki](https://github.com/Infinite-Store/Infinite-Store/wiki)                            | ✅      |
| [Loader](https://github.com/Infinite-Store/Infinite-Store/wiki/Usage)                    | ✅      |
| [Themes](https://github.com/Infinite-Store/Infinite-Store/tree/development)              | ⏳      |
| [Plugins](plugins)                                                                       | ♾      |
| [Affiliation](https://discord.gg/78ZuWSq)                                                | ✅      |
| [Discord Server](https://discord.gg/dubhsUGcZe)                                          | ✅      |

## License

Please read the [license](https://github.com/Infinite-Store/Infinite-Store/blob/main/LICENSE.md) before asking to use Infinite Store in your project.
