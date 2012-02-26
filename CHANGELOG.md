## v1.3.6:

* teach userdefaults how to cope with hashes (via Ben Bleything)
* move changes from README.md to CHANGELOG.md

## v1.3.4:

* delete the *lockfile* not the *plist*

## v1.3.2:

* typo in `updated_by_last_action` - http://troll.me?p=32 :)

## v1.3.0:

* Issue 4 - action create should set `updated_by_last_action`
* Issue 5 - remove lockfile before updating plist

## v1.2.2:

* tweaks to userdefaults provider by Ben Bleything. Thanks Ben!
* ensure lion tweaks only runs on lion
* use strings not integers
* move mail tweaks to their own recipe
* add mail archive hotkey

## v1.2.0:

* add `plist_file` LWRP
* add recipes for managing various useful user defaults
