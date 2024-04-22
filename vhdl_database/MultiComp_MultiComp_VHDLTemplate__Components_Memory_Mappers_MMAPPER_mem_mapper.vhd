-- VHDL Memory mapper.
-- Acts as a combinational path between the processor address bus and the external RAM
-- for high-order address lines. Also generates an output to gate in to the internal ROM CS
-- (in order to disable the ROM) and an output to gate in to the external RAM's write enable,
-- in order to allow regions of the RAM to be write-protected.
--
-- Internal state comprises 3 write-only registers. This device shares address space with the
-- SDCARD and uses the register space that is unused in that device.
--
-- The operation is fully synchronous on the master clock; a clock enable determines when the
-- state changes. (Obviously) the state can only be allowed to change at the same time as the
-- CPU address bus else the address or control for a cycle will glitch.
--
-- Designed by Neal Crook foofoobedoo@gmail.com May2015.
--
-- You are free to use this file in your own projects but must never charge for it nor use
-- it without acknowledgement.
--
-- SDCARD addresses 5,6,7 are available and used here.
--
-- address 0xffdd provides RAM write-protect in resolution of 8Kbyte
-- address 0xffde provides ROM disable (bit0. Other bits unused)
-- address 0xffdf provides region selects for C0000-DFFF (the CD select)
--                    and for E000-FFFF (the EF select). Each
--                    region select maps the upper 3 address lines
--                    to one of 16 regions of the RAM (allows
--                    double mapping for simplicity, not because
--                    it seems useful)
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem_mapper is
port (
        n_reset : in std_logic;
        clk     : in std_logic;
        hold    : in std_logic;
        -- conditioned with chip select externally
        n_wr    : in std_logic;
        dataIn  : in std_logic_vector(7 downto 0);
        -- select internal control register
        regAddr : in std_logic_vector(2 downto 0);
        -- incoming CPU address to decode
        cpuAddr : in std_logic_vector(15 downto 13);
        -- high-order lines to external RAM
        ramAddr : out std_logic_vector(16 downto 13);
        ramWrInhib : out std_logic;
        romInhib   : out std_logic
);

end mem_mapper;

architecture rtl of mem_mapper is

  signal wr_protect : std_logic_vector(7 downto 0);
  signal rom_dis : std_logic;
  signal regions : std_logic_vector(7 downto 0);

begin

  romInhib <= rom_dis;

  -- write protection is in 8, 8Kbyte regions based on incoming
  -- (3) high-order CPU addresses. Each bit is 0 to enable write
  -- and 0 to disable write. This protection only affects the
  -- external RAM device and so does not impact the I/O devices
  -- in high-order memory.
  proc_protect: process(wr_protect, cpuAddr)
    begin
      case cpuAddr(15 downto 13) is
        when "000" => ramWrInhib <= wr_protect(0);
        when "001" => ramWrInhib <= wr_protect(1);
        when "010" => ramWrInhib <= wr_protect(2);
        when "011" => ramWrInhib <= wr_protect(3);
        when "100" => ramWrInhib <= wr_protect(4);
        when "101" => ramWrInhib <= wr_protect(5);
        when "110" => ramWrInhib <= wr_protect(6);
        when "111" => ramWrInhib <= wr_protect(7);
        when others => ramWrInhib <= '0';
      end case;
    end process;

  -- address mapping takes the two upper 8Kbyte regions of
  -- the CPU address space and allows them to be mapped to
  -- any 8K region of the 128Kbyte external RAM.
  -- the upper nibble is the "EF select" and the lower
  -- nibble is the "CD select".
  proc_regions: process(regions, cpuAddr)
    begin
      case cpuAddr(15 downto 13) is
        -- the CD region
        when "110"  => ramAddr(16 downto 13) <= regions(3 downto 0);
        -- the EF region
        when "111"  => ramAddr(16 downto 13) <= regions(7 downto 4);
        when others => ramAddr(16) <= '0';
                       ramAddr(15 downto 13) <= cpuAddr;
      end case;
    end process;

  -- state
  proc_reg: process(clk, n_reset)
    begin
      if n_reset='0' then
        wr_protect <= "00000000";
        rom_dis <= '0';
        regions <= "01110110"; -- default to linear address
      elsif rising_edge(clk) then
        -- writes
        if hold = '0' and n_wr = '0' and regAddr = "101" then wr_protect <= dataIn;    end if;
        if hold = '0' and n_wr = '0' and regAddr = "110" then rom_dis    <= dataIn(0); end if;
        if hold = '0' and n_wr = '0' and regAddr = "111" then regions    <= dataIn;    end if;
      end if;
    end process;

end rtl;
