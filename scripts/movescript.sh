#!/bin/bash

for i in {1..9}
do
	if [[ -f "day_${i}.md" ]]; then
		echo "Renaming file day_${i}.md to day_0${i}.md"
		mv day_${i}.md day_0${i}.md
	fi
done

