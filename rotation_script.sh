#!/bin/bash

FILE=$1

logrotate $FILE --state logrotate-state --verbose
