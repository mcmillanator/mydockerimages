docker run -p 12101:12101 \
      --name rhasspy \
			--rm \
      -v "./data:/profiles" \
      -v "/etc/localtime:/etc/localtime:ro" \
      --device /dev/snd:/dev/snd \
      rhasspy/rhasspy \
      --user-profiles /profiles \
      --profile en
