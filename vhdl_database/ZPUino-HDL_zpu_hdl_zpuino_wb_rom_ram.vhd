library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.zpuino_config.all;
use work.wishbonepkg.all;

entity wb_rom_ram is
  generic (
    maxbit: integer := maxAddrBit
  );
  port (
    ram_wb_clk_i:       in std_logic;
    ram_wb_rst_i:       in std_logic;
    ram_wb_ack_o:       out std_logic;
    ram_wb_dat_i:       in std_logic_vector(wordSize-1 downto 0);
    ram_wb_dat_o:       out std_logic_vector(wordSize-1 downto 0);
    ram_wb_adr_i:       in std_logic_vector(maxAddrBitIncIO downto 0);
    ram_wb_cyc_i:       in std_logic;
    ram_wb_stb_i:       in std_logic;
    ram_wb_we_i:        in std_logic;
    ram_wb_stall_o:     out std_logic;

    rom_wb_clk_i:       in std_logic;
    rom_wb_rst_i:       in std_logic;
    rom_wb_ack_o:       out std_logic;
    rom_wb_dat_o:       out std_logic_vector(wordSize-1 downto 0);
    rom_wb_adr_i:       in std_logic_vector(maxAddrBitIncIO downto 0);
    rom_wb_cyc_i:       in std_logic;
    rom_wb_cti_i:       in std_logic_vector(2 downto 0);
    rom_wb_stb_i:       in std_logic;
    rom_wb_stall_o:     out std_logic
  );
end entity wb_rom_ram;


architecture behave of wb_rom_ram is

  component dualport_ram is
  generic (
    maxbit: integer
  );
  port (
    clk:              in std_logic;
    memAWriteEnable:  in std_logic;
    memAWriteMask:    in std_logic_vector(3 downto 0);
    memAAddr:         in std_logic_vector(maxbit downto 2);
    memAWrite:        in std_logic_vector(31 downto 0);
    memARead:         out std_logic_vector(31 downto 0);
    memAEnable:       in std_logic;
    memBWriteEnable:  in std_logic;
    memBWriteMask:    in std_logic_vector(3 downto 0);
    memBAddr:         in std_logic_vector(maxbit downto 2);
    memBWrite:        in std_logic_vector(31 downto 0);
    memBRead:         out std_logic_vector(31 downto 0);
    memBEnable:       in std_logic;
    memErr:           out std_logic
  );
  end component dualport_ram;

  constant i_maxAddrBit: integer := maxbit; -- maxAddrBit

  signal memAWriteEnable:  std_logic;
  signal memAWriteMask:    std_logic_vector(3 downto 0);
  signal memAAddr:         std_logic_vector(i_maxAddrBit downto 2);
  signal memAWrite:        std_logic_vector(31 downto 0);
  signal memARead:         std_logic_vector(31 downto 0);
  signal memAEnable:       std_logic;
  signal memBWriteEnable:  std_logic;
  signal memBWriteMask:    std_logic_vector(3 downto 0);
  signal memBAddr:         std_logic_vector(i_maxAddrBit downto 2);
  signal memBWrite:        std_logic_vector(31 downto 0);
  signal memBRead:         std_logic_vector(31 downto 0);
  signal memBEnable:       std_logic;

  --signal rom_burst: std_logic;
  signal rom_do_wait: std_logic;

  type ramregs_type is record
    do_wait: std_logic;
  end record;
  signal ramregs: ramregs_type;
  signal rom_ack: std_logic;
begin

  rom_wb_ack_o <= rom_ack;
  rom_wb_stall_o <= '0';-- when rom_wb_cyc_i='0' else not rom_ack;
  ram_wb_stall_o <= '0';
  -- System ROM/RAM

  ramrom: dualport_ram
  generic map (
    maxbit => maxbit --13--maxAddrBit
  )
  port map (
    clk               => ram_wb_clk_i,
    memAWriteEnable   => memAWriteEnable,
    memAWriteMask     => memAWriteMask,
    memAAddr          => memAAddr,
    memAWrite         => memAWrite,
    memARead          => memARead,
    memAEnable        => memAEnable,
    memBWriteEnable   => memBWriteEnable,
    memBWriteMask     => memBWriteMask,
    memBAddr          => memBAddr,
    memBWrite         => memBWrite,
    memBRead          => memBRead,
    memBEnable        => memBEnable
  );

  memBWrite       <= (others => DontCareValue);
  memBWriteMask   <= (others => DontCareValue);
  memBWriteEnable <= '0';

  rom_wb_dat_o    <= memBRead;
  memBAddr        <= rom_wb_adr_i(i_maxAddrBit downto 2);
  memBEnable      <= rom_wb_cyc_i and rom_wb_stb_i;

  -- ROM ack

  process(rom_wb_clk_i)
  begin
    if rising_edge(rom_wb_clk_i) then
      if rom_wb_rst_i='1' then
        rom_ack <= '0';
        --rom_burst <= '0';
        rom_do_wait<='0';
      else
        if rom_do_wait='1' then
          if true then--rom_wb_cti_i=CTI_CYCLE_INCRADDR then
              --rom_burst<='1';
              rom_do_wait<='0';
              rom_ack<='1';
            else
            
              rom_ack<='0';
              rom_do_wait<='0';
          end if;
        else

          if rom_wb_cyc_i='1' and rom_wb_stb_i='1' then
            if true then --rom_wb_cti_i=CTI_CYCLE_INCRADDR then
              --rom_burst<='1';
              rom_do_wait<='0';
              rom_ack<='1';
            else
              --rom_burst<='0';
              rom_do_wait<='1';
              rom_ack<='1';
            end if;
          elsif rom_wb_cyc_i='0' then
            rom_ack<='0';
          end if;
        end if;
      end if;
    end if;
  end process;

  -- RAM

  memAWrite       <= ram_wb_dat_i;
  memAWriteMask   <= (others => '1');

  ram_wb_dat_o    <= memARead;
  memAAddr        <= ram_wb_adr_i(i_maxAddrBit downto 2);
  memAEnable      <= ram_wb_cyc_i and ram_wb_stb_i;

  -- RAM ack

  process(ram_wb_clk_i, ramregs, ram_wb_rst_i,
          ram_wb_stb_i, ram_wb_cyc_i, ram_wb_we_i)
    variable w: ramregs_type;
  begin

    w:=ramregs;
    --ram_wb_ack_o<='0';
    --memAWriteEnable <= '0';


      ram_wb_ack_o<='0';
      memAWriteEnable <= '0';

      if ramregs.do_wait='1' then
        w.do_wait:='0';
        ram_wb_ack_o<='1';
        if ram_wb_we_i='1' then
          memAWriteEnable <= '1';
        end if;
      else

      if ram_wb_stb_i='1' and ram_wb_cyc_i='1' then
--        if ram_wb_we_i='1' then
--          memAWriteEnable <= '1';
--          ram_wb_ack_o<='1';
--        else
          w.do_wait:='1';
--        end if;
      end if;
      end if;

    if ram_wb_rst_i='1' then
      w.do_wait:='0';
    end if;

    if rising_edge(ram_wb_clk_i) then
      ramregs<=w;
    end if;

  end process;
  
  --ram_wb_ack_o <= '1' when ram_wb_cyc_i='1' and ram_wb_stb_i='1' and ram_wb_we_i='1' else ram_wb_ack_o_i;

end behave;

