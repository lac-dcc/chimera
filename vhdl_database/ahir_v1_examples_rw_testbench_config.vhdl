
configuration testbench_config of testbench is
  for default_arch

    for system_1 : system
      use configuration work.system_config;
    end for;

  end for;
end testbench_config;
