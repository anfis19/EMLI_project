#!/bin/bash
free | grep Mem | awk '{ORS=", "};{print 100-($3/$2 * 100.0)}'
