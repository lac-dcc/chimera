configuration icache_ram_sim of icache_ram is
  use work.memory_pack.all;
  for beh
    for all : ram_1rw
      use configuration work.ram_1rw_sim;
    end for;
    for ram
      for all : ram_2rw
        use configuration work.ram_2rw_sim;
      end for;
    end for;
  end for;
end configuration;

configuration icache_adapter_sim of icache_adapter is
  for arch
    for all : icache_ram
      use configuration work.icache_ram_sim;
    end for;
  end for;
end configuration;

configuration dcache_ram_sim of dcache_ram is
  use work.memory_pack.all;
  for beh
    for all : ram_1rw
      use configuration work.ram_1rw_sim;
    end for;
    for ram
      for all : ram_2rw
        use configuration work.ram_2rw_sim;
      end for;
    end for;
  end for;
end configuration;

configuration dcache_adapter_sim of dcache_adapter is
  for arch
    for all : dcache_ram
      use configuration work.dcache_ram_sim;
    end for;
  end for;
end configuration;
