# prepare filename 
blogroot="$BLOGROOT"
postsdirectory="$blogroot/content/posts"

# ask for title
title=$(gum input --prompt.foreground "#04B575" --prompt "Title: ")

# choose language
lang=$(gum choose "en" "pl")

# generate directory name for blog entry
date=$(date -I)
titlenospace=$(echo "$title"|tr ' ' '_')
entrydirname="$postsdirectory"/"$date"_"$titlenospace"

# generate full name based on language
fname="index.md"
[ "$lang" == "en" ] &&  fname="index.en.md"
[ "$lang" == "pl" ] &&  fname="index.md"
fullname="$entrydirname"/"$fname"

# allow to edit filename
edited=$(gum input  --prompt.foreground "#04B575" --prompt "Your blog filename: " --placeholder "$fullname" --value="$fullname")

# extract tags, allow to choose max 4
tags=$("$blogroot"/tools/tags -p $blogroot --only-names | gum choose --limit 4)
echo "tags: " $tags

# prepare textual tags comma separated
tagssplit=$(for i in "$tags"; do echo $i; done | awk '{for(i=1;i<=NF;i++) printf "\"%s\"%s", $i, (i==NF?"":",")}')
echo "tagssplit: " "$tagssplit"

# ask for description
description=$(gum input --prompt "Description: " --prompt.foreground "#04B575")
echo "description: " "$description"

# prepare content
# add support to series = ["Dart"] (tool/tag option extension is needed)

# full date for frontmatter
datetime=$(date --iso-8601=seconds)

# write frontmatter to temp file
for i in "+++" "title = \"$title\"" "date = \"$datetime\"" "tags = [$tagssplit]" "featuredImagePreview=\"image.png\"" "featuredImage=\"image.png\"" "description=\"$description\"" "+++"; do echo $i; done > /tmp/foo

# confirm and go create it!
echo "Will create file: " $edited
gum confirm && mkdir -p $(dirname "$edited") && touch "$edited" && echo $edited && (cat /tmp/foo > $edited) || echo "No files created"

