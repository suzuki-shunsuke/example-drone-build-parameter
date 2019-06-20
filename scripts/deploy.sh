# shell script to deploy
# Usage:
# $ bash scripts/deploy.sh

PARAMS_DIR=build_params
PARAMS_FILENAME=params.sh
PARAMS_TPL=$PARAMS_DIR/params.sh.tpl

REMOTE=https://github.com/suzuki-shunsuke/example-drone-build-parameter

# create build parameters template
d=$(date +%Y-%m-%dT%H-%M-%S%Z)
mkdir -p $PARAMS_DIR/$d || exit 1
PARAMS_FILE=$PARAMS_DIR/$d/$PARAMS_FILENAME
cp $PARAMS_TPL $PARAMS_FILE || exit 1
# edit the build paramters
${EDITOR:-"vi"} $PARAMS_FILE || exit 1

read -p "do you deploy really? (y/n)" YN
if [ "${YN}" != "y" ]; then
  echo "cancel to deploy"
  rm -R $PARAMS_DIR/$d
  exit 0
fi

# commit the build parameters file
git add $PARAMS_FILE || exit 1
git commit -m "deploy" || exit 1

# create and push the commit and tag
TAG=deploy/$d
echo "+ git tag $TAG"
git tag $TAG || exit 1
git push $REMOTE
git push $REMOTE $TAG || exit 1
