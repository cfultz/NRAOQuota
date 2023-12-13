#/bin/bash

mainmenu () {

echo
echo $'    _   ______  ___   ____ '
echo $'   / | / / __ \/   | / __ \ '
echo $'  /  |/ / /_/ / /| |/ / / /'
echo $' / /|  / _, _/ ___ / /_/ / '
echo $'/_/ |_/_/ |_/_/  |_\____/ ' 
echo        User Home Quota Script  
echo
echo        by cfultz@nrao.edu
echo
echo "Press 1 to see your quota"
echo "Press 2 to see 20 largest files"
echo "Press 3 to find latest modified files (24h)"
echo 
echo 
echo "Press x to exit the script"
read -n 1 -s -r -p "Input Selection:" mainmenuinput
  if [ "$mainmenuinput" = "1" ]; then
            echo 
            echo 
            quota -s -u --show-mntpoint
            echo
            read -n 1 -s -r -p "Press any key to continue"
            echo
            mainmenu
        elif [ "$mainmenuinput" = "2" ]; then
            echo This will take a bit...
            echo "Even if it doesn't look like it's working, it is!"
            echo
            echo "There may be 'Permision denied' errors if files/directories aren't owned by" $USER
            find $HOME -type f -printf '%s %p\n' | sort -nr | head -10 | numfmt --to=iec
            echo
            read -n 1 -s -r -p "Press any key to continue"
            echo
            mainmenu
        elif [ "$mainmenuinput" = "3" ]; then
            echo This will take a bit...
            echo "Even if it doesn't look like it's working, it is!"
            echo
            echo If you dont see anything, nothing has changed!
            find $HOME -mtime 1 -not -path '/.*'
            echo
            echo 
            read -n 1 -s -r -p "Press any key to continue"
            echo
            mainmenu
        elif [ "$mainmenuinput" = "x" ];then
            clear
            return
        elif [ "$mainmenuinput" = "X" ];then
            clear
            return
        else
            echo "You have entered an invallid selection!"
            echo "Please try again!"
            echo ""
            echo "Press any key to continue..."
            read -n -s -r -p 1
            clear
            mainmenu
        fi
}

mainmenu