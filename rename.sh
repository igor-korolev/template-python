if [ -z "$1" ]
  then
    echo "Error: No project name was provided to rename the boilerplate staff"
    exit 1
fi

OLD_PROJECT_NAME="templ_app"
NEW_PROJECT_NAME=$1

CYAN='\033[0;36m'
NOCOLOR='\033[0m'

printf "%bRenaming project from %s to %s...%b\n" "${CYAN}" "$OLD_PROJECT_NAME"
"$NEW_PROJECT_NAME" "${NOCOLOR}"
#mv "$OLD_PROJECT_NAME" "$NEW_PROJECT_NAME"
#find . -type f -not -path "./.*" | xargs perl -p -i -e "s/$OLD_PROJECT_NAME/$NEW_PROJECT_NAME/g"


printf "%bRun simple test...%b\n" "${CYAN}" "${NOCOLOR}"

printf "%bTest: make run%b\n" "${CYAN}" "${NOCOLOR}"
make run
printf "%bTest: make test\n" "${CYAN}" "${NOCOLOR}"
make test

