#!/bin/bash

apiBaseUrl="https://api.github.com/"


if [ ! "$(type bjGithubInit)" ]; then
    githubUser=''
    githubPassword=''
else
    bjGithubInit
fi


function bjGithubAddUser()
{
    curl -v --basic -u ${githubUser}:${githubPassword} -X POST -H "Content-Type: application/json"
        --data-binary '{"value":"30","type":"Tip 3","targetModule":"Target 3","configurationGroup":null,"name":"Configuration Deneme 3","description":null,"identity":"Configuration Deneme 3","version":0,"systemId":3,"active":true}'
        https://api.github.com/

}

function bjGithubSendCurlGetRequest()
{
    path="$1"
    curl -v --basic -u ${githubUser}:${githubPassword} -X GET \
        -H "Content-Type: application/json" \
        https://api.github.com/$path
}

function bjGithubSendCurlPostRequest()
{
    path="$1"
    data=$2
    curl -v --basic -u ${githubUser}:${githubPassword} -X POST \
        -H "Content-Type: application/json" \
        --data-binary "'${data}'" \
        https://api.github.com/$path
    curl -v --basic -u bijayrungta:n0thing -X POST -H "Content-Type: application/json" \
        --data-binary '{"value":"30","type":"Tip 3","targetModule":"Target 3","configurationGroup":null,"name":"Configuration Deneme 3","description":null,"identity":"Configuration Deneme 3","version":0,"systemId":3,"active":true}'
        https://api.github.com/$path
}

function bjGithubChangePullRequest()
{
    prepareDate="$(date +%Y-%m-%d)"
    pullRequestId="$1"
    branchName="$2"
    prepareBranch="rel-${prepareDate}-n1"
    if [ "$2" ]; then
        prepareBranch="$2"
    fi
    title="Updating Pull Request Base Branch to ${prepareBranch}"
    curl --user "${githubUser}":"${githubPassword}" \
     --request PATCH \
     --data "{'title': '${title}','head': '${githubRepoOwner}:${prepareBranch}', 'base': '${prepareBranch}'}" \
     https://api.github.com/repos/${githubRepoOwner}/${githubRepo}/pulls
}

function bjGitResetGithubAlias()
{
    sed -i '' 's/github.com-\w+:/github.com/g' .git/config
}

function bjGitAddGithubAlias()
{
    aliasName=$1
    sed -i '' 's/github.com:/github.com-${aliasName}:/g' .git/config
}
