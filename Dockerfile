# dockerfile for making the TNS site container
#####################################################################
#                            Build Stage                            #
#####################################################################
FROM hugomods/hugo:exts AS builder
# Base URL
ARG HUGO_BASEURL='https://mrcupp.com/'
ENV HUGO_BASEURL=${HUGO_BASEURL}
# Build site
COPY . /src 
RUN cd /src/sitecode/ && hugo mod get -u 
RUN hugo --minify --gc --enableGitInfo --source ./sitecode/

# Set the fallback 404 page if defaultContentLanguageInSubdir is enabled, please replace the `en` with your default language code.
# RUN cp ./sitecode/public/en/404.html ./sitecode/public/404.html

#####################################################################
#                            Final Stage                            #
#####################################################################
# [testing image build]
FROM hugomods/hugo:nginx AS test
COPY --from=builder /src/sitecode/public /site


# [production image build]
FROM hugomods/hugo:nginx AS prod
COPY --from=builder /src/sitecode/public /site
