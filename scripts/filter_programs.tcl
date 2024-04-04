# This script uses Jasper's `analyze` command to analyze all Verilog programs
# in a given directory. The script will move all invalid programs to a separate
# directory and keep the valid ones.

set target_dir "../database/invalid_programs"
set database_dir "../database"

file mkdir $target_dir

set glob_path [file join $database_dir *.v]
foreach v_file [glob $glob_path] { 
  if { [catch {analyze -sv $v_file}] } {
    set file_name [file tail $v_file]
    puts "Invalid Verilog program detected: $file_name"
    file rename -force $v_file [file join $target_dir $file_name]
  }

  analyze -clear
}

exit
