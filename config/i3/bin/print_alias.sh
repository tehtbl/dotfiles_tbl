#!/bin/bash
#By tarnold

alias | awk -F'[=]' '{print $1}'
