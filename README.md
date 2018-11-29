### Wonder Trade

This adds Wonder Trades to Fire Red.

The NPC trainers are used as the source of these Pokemon; you might end up with Blaine's Rapidash, for example, complete with Blaine's OTID and OT Name and custom moveset.

#### How do I insert this?

First, you need to insert [dtan](https://github.com/Sagiri/dtan) to your ROM. Then, copy the output rom `test.gba` to this project's root directory, renaming it `rom.gba`.

Open up `config.ini` and modify `free-space` so that the build system knows where to start looking for free space in your ROM.

Once you've configured everything, you can check [here](scripts/makinoa/README.md) for build instructions.

#### How do I use this?

Once it has been inserted, it won't actually /do/ anything. You'll have to execute the associated script to actually do a Wonder Trade.

First, you need to find out where the script was inserted. If you're in a Unix-like environment, you can just do `cat test.sym | grep wonder_trade_script`. Otherwise, just open `test.sym` in a text editor and look for `wonder_trade_script`; the offset beside it was where it was inserted to.

Then, you can assign it to a person/signpost event or even an item, just like any other script.