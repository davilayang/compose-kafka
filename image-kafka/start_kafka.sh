#!/bin/bash

# N.B. update_config.sh
# script to update server.properties when starting up a service of Apache Kafka
# code snippets from wurstmeister/kafka-docker on Github
# source: https://github.com/wurstmeister/kafka-docker/blob/master/start-kafka.sh

# update broker configurarions in /app/server.properties

echo "" >> "/app/server.properties"

(
    function updateConfig() {
        key=$1
        value=$2
        file=$3

        # Omit $value here, in case there is sensitive information
        echo "[Configuring] '$key' in '$file'"

        # If config exists in file, replace it. Otherwise, append to file.
        if grep -E -q "^#?$key=" "$file"; then
            sed -r -i "s@^#?$key=.*@$key=$value@g" "$file" #note that no config values may contain an '@' char
        else
            echo "$key=$value" >> "$file"
        fi
    }

    # exlude these environment variables
    EXCLUSIONS="|KAFKA_VERSION|KAFKA_HOME|KAFKA_DEBUG|"

    # Read in env as a new-line separated array. 
    # This handles the case of env variables have spaces and/or carriage returns. See #313
    for VAR in $(env)
    do
        env_var=$(echo "$VAR" | cut -d= -f1)
        if [[ "$EXCLUSIONS" = *"|$env_var|"* ]]; then
            echo "Excluding $env_var from broker config"
            continue
        fi

        # if name of environment variable starts with KAFKA_...
        if [[ $env_var =~ ^KAFKA_ ]]; then
            kafka_name=$(echo "$env_var" | cut -d_ -f2- | tr '[:upper:]' '[:lower:]' | tr _ .)
            updateConfig "$kafka_name" "${!env_var}" "/app/server.properties"
        fi

    done
)

# start the broker
/app/apache-kafka/bin/kafka-server-start.sh /app/server.properties

