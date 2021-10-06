# Installing Plugins
TBD
# Installing Plugins Without Infinite Store
## Windows
To install a plugin without Infinite Store, simply click on a plugin [here](https://github.com/Infinite-Store/Infinite-Store/tree/main/plugins) and click the raw button. Then, press `CTRL` + `S` to save it to your executor's `workspace` folder. Where it says "Save as type:" click the dropdown and select `All Files (*.*)` then save. Add the plugin by doing `;addplugin` then the plugin name without `.iy`. 

Alternatively, you can use [`addallplugins`](https://raw.githubusercontent.com/Infinite-Store/Infinite-Store/main/plugins/addallplugins.iy) to add all the plugins in your `workspace` folder. You must have an executor that supports the `listfiles()` function (Currently only Synapse X, Script-Ware, and KRNL).
## Mac
On Mac, click on any plugin [here](https://github.com/Infinite-Store/Infinite-Store/tree/main/plugins) and click the raw button. Then, press `CMD` + `S` to save it to your executor's `workspace` folder. Where it says "Format:" click the dropdown and select `All Files` then save. Add the plugin by doing `;addplugin` then the plugin name without `.iy`. 
## Linux
TBD
# Creating Plugins
Refer to the [official wiki](https://github.com/EdgeIY/infiniteyield/wiki/Adding-Commands-To-A-Plugin). Observing existing plugins and using [`example.iy`](https://raw.githubusercontent.com/Infinite-Store/Infinite-Store/main/plugins/example.iy) is a great way to get started.
