configuration cpu_asic of cpu is
  for stru
    for u_decode : decode
      use configuration work.cpu_decode_direct;
    end for;
    for u_datapath : datapath
      use entity work.datapath(stru);
      for stru
        for u_regfile : register_file
          use entity work.register_file(flops);
        end for;
      end for;
    end for;
  end for;
end configuration;
