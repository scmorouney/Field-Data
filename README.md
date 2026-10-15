created to backup code used for field data analysis 

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



