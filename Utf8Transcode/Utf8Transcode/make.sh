#!/bin/bash

swiftc main.swift
chmod 700 main
cp main /usr/local/bin/utf
echo "Run transcoder anywhere by typing utf"
