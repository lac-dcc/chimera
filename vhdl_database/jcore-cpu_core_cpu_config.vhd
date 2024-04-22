configuration cpu_decode_direct_fpga of cpu is
  for stru
    for u_decode : decode
      use configuration work.cpu_decode_direct;
    end for;
    for u_datapath : datapath
      use entity work.datapath(stru);
      for stru
        for u_regfile : register_file
          use entity work.register_file(two_bank);
        end for;
      end for;
    end for;
  end for;
end configuration;

configuration cpu_decode_rom_fpga of cpu is
  for stru
    for u_decode : decode
      use configuration work.cpu_decode_rom;
    end for;
    for u_datapath : datapath
      use entity work.datapath(stru);
      for stru
        for u_regfile : register_file
          use entity work.register_file(two_bank);
        end for;
      end for;
    end for;
  end for;
end configuration;

configuration cpu_sim of cpu is
  for stru
    for u_decode : decode
      use configuration work.cpu_decode_direct;
    end for;
    for u_datapath : datapath
      use entity work.datapath(stru);
      for stru
        for u_regfile : register_file
          use entity work.register_file(two_bank);
        end for;
      end for;
    end for;
  end for;
end configuration;
