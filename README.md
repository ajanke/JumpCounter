# JumpCounter
Counts the number of jumps each of your World of Warcraft: Forever characters make. Now with support for Data Broker visualizers (such as Chocolate Bar)

# Install
1. Download the latest `JumpCounter-x.x.zip` from https://github.com/ajanke/JumpCounter/releases/latest
2. Find your WoW Forever AddOns folder. By default this is:

   `C:\Program Files (x86)\World of Warcraft\_forever_\Interface\AddOns`

   If you installed WoW somewhere else, open the Battle.net launcher, select WoW Forever, click the gear icon next to Play and choose **Show in Explorer**. Then open `Interface\AddOns` (create the `AddOns` folder if it doesn't exist).
3. Unzip the file into that folder. You should end up with `Interface\AddOns\JumpCounter\JumpCounter.toc`. If you get an extra folder level (for example `AddOns\JumpCounter-2.0\JumpCounter`), move the inner `JumpCounter` folder up into `AddOns`.
4. Restart WoW (or type `/reload` if you are already logged in) and make sure JumpCounter is enabled in the **AddOns** list on the character select screen.

To upgrade, delete the old `JumpCounter` folder and repeat the steps above. Your jump counts are kept.

# Usage
For the character you are logged into WoW with, type any of the following commands to display your jump count

- `/jc`
- `/jumpcount`
- `/jumpcounter`

To reset your jump count to zero, type any of the following commands. You'll be asked to confirm before the count is cleared.

- `/jc clear`
- `/jumpcount clear`
- `/jumpcounter clear`


# Bugs
If you encounter any bugs feel free to create a new issue and I will try to address it as quickly as possible: https://github.com/ajanke/JumpCounter/issues
