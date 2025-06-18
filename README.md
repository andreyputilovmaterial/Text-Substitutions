# Text-Substitutions
Super simple script that helps with text replacements.

You provide a string with specifications of what text should be substituted with wchich replacement.
Super simple.

The --wordmatch option (see BAT file) adds \b regex at word boundaries so that, if pattern is "BundleSubs", "BundleSubsDisney" is not getting changed. So the pattern only matches whole words.

WARNING: it does not create backups. Do it before you go!

Usage: see build.bat

## How to start it
Download run_textsubstitutions.bat and textsubstitutions.py from
[Releases](../../releases/latest).

Edit the BAT file and update paths to your files and the pattern.
