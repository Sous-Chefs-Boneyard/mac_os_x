## v1.4.7:
* Support for `-currentHost` flag
* Changing double-quoted strings to single-quoted (FoodCritic's `CINK002` rule)

## v1.4.4:

* Booleans should be correctly recognized in userdefaults (#13)
* Make it possible to set user in attributes (#14)
* Add support for arrays (#15)
* Put key in quotes while running defaults read command (#16)
* Don't add '-g' to defaults read command for NSGlobalDomain (#17)
* Complex array values break unless quoted. (#18)

## v1.4.2:

* Fix typo in `load_current_resource`

## v1.4.0:

* Add settings attribute and recipe to process it (great idea from Ben
  Bleything's bootstrap)
* Use integers instead of strings for plain numbers
* Set resource as updated
* Support floating point numbers

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
