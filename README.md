created to backup code used for field data analysis and work across devices

includes data, scripts, and plots from field data
* data -- copies of raw data files saved here as CSVs
* scripts -- scripts for different analyses saved here individually
* plots -- output figures saved here (ensure labelled with versions) 
        
____________________________________________________

process for setting up git and github link to R:

1. download git on device
2. open RStudio
3. load package 'usethis' and allow file sync
4. start repository with use_git() - git tab should appear in top right
6. link to git account with gitcreds_set()
7. link to github with use_github() and personal access token

to commit changes to git and github:
1. save file in R to desktop location (ctrl+S)
2. press 'commit' - on initial commit select all files, after this only altered files should appear
3. press 'push' to sync to github - when local commits are ahead of pushes 'your branch is ahead of origin' message will display

to add new device/person to workflow: 
1. open RStudio
2. go to New Project>Version Control>Git
3. enter Git repository URL (found under Code button in main repo)
4. this will clone the repository on to new device and allow you to push changes to Git 

____________________________________________________

