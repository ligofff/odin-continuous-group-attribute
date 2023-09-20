#!/usr/bin/env bash

# Check that the script is running in correct director by checking that .git and Runtime folders exist
if [ ! -f "RUNME.sh" ] || [ ! -d "Runtime" ]
then
    echo 'ERR: You must be in the repository root to run this script.'
	echo '(no Runtime folder or RUNME.sh found)'
    exit 1
fi

# For reading variable from either command line argument or from user input
setvar() {
  local varname argument default prompt
  varname=$1; argument=$2; prompt=$3; default=$4
  if [[ $argument ]]; then
    declare -g "$varname"="$argument"
  elif read -r -e -p "$prompt (${default}):" "${varname?}" && [[ -n ${!varname} ]]; then
    return 0
  else
    declare -g "$varname"="$default"
  fi
}

COMPANY_FRIENDLY_NAME=$(echo "Ligofff" | sed -e 's/[]\/$*.^[]/\\&/g');
COMPANY=$(echo "ligofff" | sed -e 's/[]\/$*.^[]/\\&/g');
REPORT_EMAIL=$(echo "support@ligofff.com" | sed -e 's/[]\/$*.^[]/\\&/g');
COMPANY_WEBSITE=$(echo "https://ligofff.com" | sed -e 's/[]\/$*.^[]/\\&/g');

setvar REPOSITORY_NAME "$5" "Repository name" "unity-simple-notifications"
setvar FRIENDLY_NAME "$6" "Friendly name for project" "Notifications"
setvar DESCRIPTION "$7" "Description" "Package for Unity game engine."
setvar UNITY_VERSION "$8" "Unity version" "2021.3.11f1"
setvar INCLUDE_SAMPLES_TESTS "$9" "Include samples and tests? (y/n)" "n"

REPOSITORY_NAME=$(echo "$REPOSITORY_NAME" | sed -e 's/[]\/$*.^[]/\\&/g');
FRIENDLY_NAME=$(echo "$FRIENDLY_NAME" | sed -e 's/[]\/$*.^[]/\\&/g');
DESCRIPTION=$(echo "$DESCRIPTION" | sed -e 's/[]\/$*.^[]/\\&/g');
UNITY_VERSION=$(echo "$UNITY_VERSION" | sed -e 's/[]\/$*.^[]/\\&/g');

echo 'Replacing template strings...'

# Get current year for license, etc. 2021
YEAR="$(date +'%Y')"

# Form sed command and store it into a file. Ran into problems with white spaces when trying to pass this as parameter. 
echo "s/{{REPOSITORY_NAME}}/""${REPOSITORY_NAME}""/g;s/{{FRIENDLY_NAME}}/""${FRIENDLY_NAME}""/g;s/{{DESCRIPTION}}/""${DESCRIPTION}""/g;s/{{UNITY_VERSION}}/""${UNITY_VERSION}""/g;s/{{COMPANY}}/""${COMPANY}""/g;s/{{COMPANY_FRIENDLY_NAME}}/""${COMPANY_FRIENDLY_NAME}""/g;s/{{YEAR}}/""${YEAR}""/g;s/{{COMPANY_WEBSITE}}/""${COMPANY_WEBSITE}""/g;s/{{REPORT_EMAIL}}/""${REPORT_EMAIL}""/g" > temp.txt

( shopt -s globstar dotglob;
    for file in **; do
        if [[ -f $file ]] && [[ -w $file ]] && [[ $file != 'RUNME.sh' ]] && [[ $file != 'temp.txt' ]] && [[ $file != Samples/** ]] && [[ $file != .git/** ]]; then
		    echo "Altering file ${file}"

			# Replace template strings inside files
			sed -i '' -f temp.txt "$file"
			
			# Replace template strings on file names
			newfile="$(echo ${file} |sed -f temp.txt)"
			mv "${file}" "${newfile}"
        fi
    done
)

rm temp.txt
echo 'done.'
echo 'Removing template repository specific files...'

# Remove template repository specific files
rm README.md
rm CONTRIBUTING.md
rm LICENSE
rm package.json
rm .github/CODEOWNERS
rm -rf .github
mv -f templates/README.md README.md
mv -f templates/CONTRIBUTING.md CONTRIBUTING.md
mv -f templates/LICENSE LICENSE
mv -f templates/package.json package.json
mv -f templates/.github .github
rm -rf .git
git init
git add .
git commit -a -m "Initial setup"

rm -rf templates

# Remove template repository specific files

if [[ $INCLUDE_SAMPLES_TESTS == "n" ]]; then
  rm -rf Tests
  rm -rf Samples
  rm -rf .github/workflows
fi

echo 'done.'
rm RUNME.sh

exit 0

