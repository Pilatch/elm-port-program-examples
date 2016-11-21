#!/bin/bash
elm-make Main.elm --output elm.js && \
node input-mangler.js