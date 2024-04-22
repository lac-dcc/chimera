package init_message_pkg is

    constant core_name    : string := "Z1013.01";
    constant version      : string := "v2018.02";
    constant compile_time : string := "2018-02-05 21:51";
    constant init_message : string := " " & core_name & "  " & version & ", " & compile_time;

end package init_message_pkg;
