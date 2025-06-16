[![CircleCI](https://circleci.com/gh/IamMrCupp/mrcupp-project/tree/master.svg?style=svg)](https://circleci.com/gh/IamMrCupp/mrcupp-project/tree/master)

# MrCupp Website Project

This is my personal website.  

This site is utilizing Hugo static pages for generation.  Pages are defined via Markdown.
I am using custom shortcode generators in various places on the site.  There are likely some other custom hacks that I have done to the system to get what I need done in the framework.


Local Development:
- You can work on things without having to build the local image. It requires just running a few commands:
```
# checkout the repo
gh repo clone iammrcupp/mrcupp-project
# ensure the module are up-to-date
cd mrcupp-project/sitecode
hugo mod get -u ./...
# run the local server
cd ..
hugo server -D --minify --gc --enableGitInfo --source ./sitecode/
```

Production:
- Container image generation is performed via CircleCI workflow
- Package lives in ghcr.io
- Rollout is managed via GitOps process using flux-cd for k8s