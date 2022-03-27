#!/usr/bin/env bash
# docker_wordpress.sh: Example of how to build a dockerized solution.
set -o errexit


# Global definitions.
readonly mysql_pass='ch2demo'
readonly mysql_image='mysql:5.7'
readonly wp_volume='/run/apache2'
readonly wp_tmpfs='/tmp'
readonly wp_image='wordpress:5.0.0-php7.2-apache'
readonly mailer_image='dockerinaction/ch2_mailer'
readonly agent_image='dockerinaction/ch2_agent'


main() {
    db_cid=$(
        docker container create \
            -e MYSQL_ROOT_PASSWORD=$mysql_pass \
            "$mysql_image"
    )

    mailer_cid=$(docker container create "$mailer_image")

    wp_cid=$(
        docker container create \
            --link "$db_cid":mysql \
            -p 80 \
            --read-only \
            -v "$wp_volume" \
            --tmpfs "$wp_tmpfs" \
            "$wp_image"
    )

    agent_cid=$(
        docker container create \
            --link "$mailer_cid":insidemailer \
            "$agent_image"
    )

    # Start containers in order to prevent dependency issues.
    for cid in {$db_cid,$mailer_cid,$wp_cid,$agent_cid}; do
        docker container start "$cid"
    done

}


main
