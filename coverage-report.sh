#!/bin/sh

HPC_DIR=dist/hpc
HPC_MIX_DIR=${HPC_DIR}/mix/unit-tests
HPC_TIX_FILE=${HPC_DIR}/tix/unit-tests/unit-tests.tix
HPC_REPORT_DIR=${HPC_DIR}/report

TEST_DIR=src/UnitTest
TEST_MODULES=(`find ${TEST_DIR} -name "*.hs" | sed -e "s/\.hs$//g" | sed -e "s/^src\///g" | sed -e "s/\//\./g"`)

EXCLUDES="--exclude Main"
for ITEM in ${TEST_MODULES[@]}
do
  EXCLUDES="${EXCLUDES} --exclude ${ITEM}"
done

hpc report ${HPC_TIX_FILE} ${EXCLUDES} --hpcdir=${HPC_MIX_DIR} > ${HPC_REPORT_DIR}/results.xml
hpc markup ${HPC_TIX_FILE} ${EXCLUDES} --hpcdir=${HPC_MIX_DIR} --destdir=${HPC_REPORT_DIR}

open ${HPC_REPORT_DIR}/hpc_index.html
