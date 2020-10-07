#!/bin/bash
echo "deleting files"
for i in {0..9}
do
	echo "deleting file day_${i}.md"
	git rm day_${i}.md
done
