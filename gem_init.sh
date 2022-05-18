#!/bin/bash

gem_init() {
    find ~/.gem/ruby/ -name one_gadget -exec sh -c 'dirname {} | grep -v "/gem"' \;
}

gem_init