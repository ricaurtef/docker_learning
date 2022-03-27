#!/usr/bin/env bash
# script_name: Description of the script purpose.

# Author: Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    local mailer_cid web_cid agent_cid mailer_image agent_image

    mailer_image='dockerinaction/ch2_mailer'
    agent_image='dockerinaction/ch2_agent'

    mailer_cid=$(docker container run --detach "$mailer_image")
    web_cid=$(docker container run --detach nginx)
	agent_cid=$(docker container create --detach \
        --link "$web_cid":insideweb \
        --link "$mailer_cid":insidemailer \
        "$agent_image")

    # Start the monitoring system.
    docker container start "$agent_cid"
}


main
