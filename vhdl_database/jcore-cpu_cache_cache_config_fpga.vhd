configuration icache_ram_infer of icache_ram is
  use work.memory_pack.all;
  for beh
    for all : ram_1rw
      use entity work.ram_1rw(inferred);
    end for;
    for ram
      for all : ram_2rw
        use entity work.ram_2rw(inferred);
      end for;
    end for;
  end for;
end configuration;

configuration icache_adapter_fpga of icache_adapter is
  for arch
    for all : icache_ram
      use configuration work.icache_ram_infer;
    end for;
  end for;
end configuration;

configuration dcache_ram_infer of dcache_ram is
  use work.memory_pack.all;
  for beh
    for all : ram_1rw
      use entity work.ram_1rw(inferred);
    end for;
    for ram
      for all : ram_2rw
        use entity work.ram_2rw(inferred);
      end for;
    end for;
  end for;
end configuration;

configuration dcache_adapter_fpga of dcache_adapter is
  for arch
    for all : dcache_ram
      use configuration work.dcache_ram_infer;
    end for;
  end for;
end configuration;
