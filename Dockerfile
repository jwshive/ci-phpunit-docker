FROM bitnami/codeigniter
FROM composer
ARG GIT_REPO_URL
ARG CI_TOP_DIR
WORKDIR /app
RUN git clone $GIT_REPO_URL
COPY . .
WORKDIR /app/$CI_TOP_DIR
RUN composer require kenjis/ci-phpunit-test:^3.0 --dev
RUN composer require phpunit/phpunit --dev -W
RUN php vendor/kenjis/ci-phpunit-test/install.php 
ENTRYPOINT ["vendor/bin/phpunit", "-c", "application/tests"]
