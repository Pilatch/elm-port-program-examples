#!/bin/bash
elm-make Greet.elm --output elm.js && \
node greeter.js