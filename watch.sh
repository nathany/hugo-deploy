SASSC_COMMAND='sassc sass/all.sass static/all.css --style compressed'

# execute SassC at startup
eval $SASSC_COMMAND
# watch Sass and Hugo files during development
notify -c ${SASSC_COMMAND} sass/** &
hugo server -v -D --watch && fg
