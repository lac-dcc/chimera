set target_dir "./invalid_programs"
set database_dir "."

file mkdir $target_dir

set glob_path [file join $database_dir *.v]

foreach v_file [glob $glob_path] {
  clear -all

  set exit_code [catch {analyze -sv $v_file}]
  if { $exit_code != 0 } {
    puts "analyzed failed with code $exit_code"
    set file_name [file tail $v_file]
    file rename -force $v_file [file join $target_dir $file_name]
    continue
  }

  set exit_code [catch {elaborate -bbox 1}]
  if { $exit_code != 0 } {
    puts "Elaborete for $v_file failed with exit code $exit_code"
  }
}

# -batch
exit
