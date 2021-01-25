#!/bin/bash

case $1 in
    deltag)
        echo 'delete tag '${2}
        # delete tab
		git tag -d $2
		git push origin :refs/tags/$2
        ;;
    help)
        echo 'input arg ( deltag | {version} build upm and tag )'
        ;;
    *)
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
        ;;
esac
