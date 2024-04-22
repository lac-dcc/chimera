configuration cpu_decode_simple of decode is
  for arch
    for core : decode_core
      use entity work.decode_core(arch)
        generic map (
          decode_type => SIMPLE,
          reset_vector => DEC_CORE_RESET);
    end for;
    for table : decode_table
      use entity work.decode_table(simple_logic);
    end for;
  end for;
end configuration;
