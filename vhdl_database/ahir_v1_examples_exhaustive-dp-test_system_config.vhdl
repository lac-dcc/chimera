
configuration system_config of system is
  for default_arch

    for start_dp_inst : start_dp
      use configuration work.start_dp_config;
    end for;

    for test_floats_dp_inst : test_floats_dp
      use configuration work.test_floats_dp_config;
    end for;

    for test_ints_dp_inst : test_ints_dp
      use configuration work.test_ints_dp_config;
    end for;

    for test_shorts_dp_inst : test_shorts_dp
      use configuration work.test_shorts_dp_config;
    end for;

  end for;
end system_config;
