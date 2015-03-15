
# device_samsung_degaswifiue
device tree for the sm-t230nu

a wip
android_device_samsung_degaswifi

This is a ASOP based device tree (designed to build 'MoKee', but should work for 'cyanogenmod', or any other ASOP based rom , with a few changes) for the Galaxy Tab 4 7.0 (degaswifi). 
Notable things about it:

* You can find out [here](http://forum.xda-developers.com/showthread.php?t=2785612) how the boot image header is different from the standard Android header which is why standard tools fail to unpack its boot images. Therefore you'd have to use this [custom mkbootimg](https://github.com/kumajaya/degas-mkbootimg) by [Ketut P. Kumajaya](http://forum.xda-developers.com/member.php?u=4021423) to create the recovery image.
In BoardConfig.mk it's set by `BOARD_CUSTOM_MKBOOTIMG := degas-mkbootimg`
Change that to point to the correct path

This is a total Work in progress; I have HEAVILY relied on gr8nole's tab 3 7" device repos...


Feel free to fork and submit any changes
