[![CircleCI](https://circleci.com/gh/IamMrCupp/mrcupp-project/tree/master.svg?style=svg)](https://circleci.com/gh/IamMrCupp/mrcupp-project/tree/master)

# IamMrCupp - Website Project

This is my personal and professional website. My career and hobbies almost always overlap in many areas.

The site is currently utilizing Hugo for page generation  All the pages are defined via Markdown.
There are many custom shortcode generators in various places on the site. There are likely some other custom hacks that I have done to the system to get what I need done in the framework.


### Local Development:
- You can work on things without having to build the local image. It requires just running a few commands:
```
# checkout the repo
gh repo clone iammrcupp/mrcupp-project

# ensure the module are up-to-date - runs in sitecode directory
cd mrcupp-project/sitecode
hugo mod get -u ./...

# run the local server
cd ..
hugo server -D --minify --gc --enableGitInfo --source ./sitecode/
```

### Production:
- PRs are REQUIRED for all changes
- Container image generation is performed via CircleCI workflow
- Package lives in ghcr.io
- Rollout is managed via GitOps process using flux-cd for k8s