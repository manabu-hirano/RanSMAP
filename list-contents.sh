#!/usr/bin/bash

DATA_REPO_DIR_MEMORY=.

checkNumberOfCsvDir() {
  dir_path=$1
  if [ ! -d ${dir_path} ]; then
	return
  fi
  echo "NUMBER OF CSV DIRECTORIES:" `echo $1` 
  dirs=`find $dir_path -mindepth 1 -maxdepth 1 -type d | sort`
  for dir in $dirs;
  do
     echo -e "\t " `find $dir -name "ata_write.*" | wc -l` `basename $dir`
  done
}

memory_types_celeron=("ddr4-2133-16g" "ddr4-2133-8g" "ddr4-1866-16g" "ddr4-1866-8g" "ddr4-1600-16g" "ddr4-1600-8g")
memory_types_i3=("ddr4-2666-16g" "ddr4-2666-8g" "ddr4-3200-16g" "ddr4-3200-8g" "ddr4-2133-16g" "ddr4-2133-8g")

echo "============"
echo "  ORIGINAL  "
echo "============"
echo "========"
echo "Celeron"
echo "========"
for (( i=0; i < ${#memory_types_celeron[@]}; i++)) {
  checkNumberOfCsvDir "${DATA_REPO_DIR_MEMORY}/dataset/original/celeron-gen6/${memory_types_celeron[$i]}"
}
echo "============"
echo "i3"
echo "============"
for (( i=0; i < ${#memory_types_i3[@]}; i++)) {
  checkNumberOfCsvDir "${DATA_REPO_DIR_MEMORY}/dataset/original/i3-gen12/${memory_types_i3[$i]}"
}
echo "==================="
echo "TOTAL OF ORIGINAL:"
echo "==================="
checkNumberOfCsvDir "${DATA_REPO_DIR_MEMORY}/dataset/original/"

echo "==========="
echo "EXTRA "
echo "==========="
types=("i3-gen12/ddr5-4800-16g" "i5-gen12/ddr4-2133-16g" "i7-gen12/ddr4-2133-16g")
for (( i=0; i < ${#types[@]}; i++)) {
  checkNumberOfCsvDir "${DATA_REPO_DIR_MEMORY}/dataset/extra/${types[$i]}"
}
echo "==================="
echo "TOTAL OF EXTRA:"
echo "==================="
checkNumberOfCsvDir "${DATA_REPO_DIR_MEMORY}/dataset/extra/"

echo "==========="
echo "MIX "
echo "==========="
types=("i3-gen12/ddr4-2133-16g")
for (( i=0; i < ${#types[@]}; i++)) {
  checkNumberOfCsvDir "${DATA_REPO_DIR_MEMORY}/dataset/mix/${types[$i]}"
}
echo "==================="
echo "TOTAL OF MIX:"
echo "==================="
checkNumberOfCsvDir "${DATA_REPO_DIR_MEMORY}/dataset/mix/"

echo "==========="
echo "VARIANTS"
echo "==========="
types=("i3-gen12/ddr4-2133-16g")
for (( i=0; i < ${#types[@]}; i++)) {
  checkNumberOfCsvDir "${DATA_REPO_DIR_MEMORY}/dataset/variants/${types[$i]}"
}
echo "==================="
echo "TOTAL OF VARIANTS:"
echo "==================="
checkNumberOfCsvDir "${DATA_REPO_DIR_MEMORY}/dataset/variants/"

echo "==================="
echo "TOTAL:"
echo "==================="
checkNumberOfCsvDir "${DATA_REPO_DIR_MEMORY}/dataset/"

