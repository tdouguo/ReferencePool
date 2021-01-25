cat Assets/ReferencePool/package.json | jq 'del(.version)' | jq '. + { "version": "sdkver" }'>>tmp
mv tmp Assets/ReferencePool/package.json
sed -i '' 's/sdkver/'"$1"'/'  Assets/ReferencePool/package.json
git add -A
git commit -m "update version"
git pull
git push

git subtree split --prefix=Assets/ReferencePool --branch upm
git tag $1 upm
git push origin upm --tags

# set upm version
# git subtree split --prefix=Assets/ReferencePool --branch upm$1
# git tag $1 upm$1

# delete tab
# git tag -d $1
# git push origin :refs/tags/$1