set target_dir "../database/invalid_programs"
file mkdir $target_dir

foreach v_file [glob ../database/*.v] { 
  if { [catch {analyze -sv $v_file}] } {
    set file_name [file tail $v_file]
    puts "Invalid Verilog program detected: $file_name"
    file rename $v_file [file join $target_dir $file_name]
  }

  analyze -clear
}

exit
