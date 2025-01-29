PATH_CHIMERA="../../build/Chimera"
PATH_SCRIPTS="../../scripts/"
PATH_JSON="../../json/"
NAME_JSON="gram_size_test.json"
TARGET_SIZE="100"

mkdir generated_programs -p
cd generated_programs
rm -rf *
for i in 1 2 3 4 5 6; do
    mkdir "${i}gram"
    cd "${i}gram"
    echo "Running for ${i}gram"
    eval "${PATH_SCRIPTS}generate_programs.sh . ${PATH_CHIMERA} ${PATH_JSON}${i}${NAME_JSON} ${i} 1000 ${PATH_SCRIPTS}verible-verilog-format ${TARGET_SIZE} 2>output.txt"
    jg -allow_unsupported_OS -batch ../../scripts/attempt_synthesis.tcl -define target_dir "./invalid_programs" -define target_elaborate_dir "./invalid_elaborate_programs" -define database_dir "." 1>/dev/null 2>&1
    cd ..
done
cd ../scripts
python3 ngram_experiments.py result.csv ./verible-verilog-syntax
