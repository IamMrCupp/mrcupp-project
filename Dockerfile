# dockerfile for making the TNS site container
#####################################################################
#                            Build Stage                            #
#####################################################################
FROM hugomods/hugo:exts as builder
# Base URL
ARG HUGO_BASEURL=
ENV HUGO_BASEURL=${HUGO_BASEURL}
# Build site
COPY ./sitecode/ /src
RUN hugo --minify --gc --enableGitInfo
# Set the fallback 404 page if defaultContentLanguageInSubdir is enabled, please replace the `en` with your default language code.
# RUN cp ./public/en/404.html ./public/404.html

#####################################################################
#                            Final Stage                            #
#####################################################################
# [testing image build]
FROM hugomods/hugo:nginx AS test
COPY --from=builder /src/public /site


# [production image build]
FROM hugomods/hugo:nginx AS prod
LABEL org.opencontainers.image.description "Website Container for IamMrCupp website"
LABEL org.opencontainers.image.title "mrcupp-website"
LABEL org.opencontainers.image.revision "4"
LABEL org.opencontainers.image.created "2023-09-26"
LABEL org.opencontainers.image.author "IamMrCupp [mrcupp@tech-noid.net]"
LABEL org.opencontainers.image.homepage "https://tech-noid.net"
LABEL org.opencontainers.image.source "https://github.com/IamMrCupp/mrcupp-project"
COPY --from=builder /src/public /site
