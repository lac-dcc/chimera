-------------------------------------------------------------------------------
--
-- Title       : Test Bench for secd_ram_controller
-- Design      : secd
-- Author      : Hans Hübner
-- Company     : .
--
-------------------------------------------------------------------------------
--
-- File        : H:\fpga\secd\fep\secd_ram_controller_TB.vhd
-- Generated   : 21.06.2006, 18:16
-- From        : h:\fpga\secd\fep\secd_ram_controller.vhd
-- By          : Active-HDL Built-in Test Bench Generator ver. 1.2s
--
-------------------------------------------------------------------------------
--
-- Description : Automatically generated Test Bench for secd_ram_controller_tb
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity secd_ram_controller_tb is
end secd_ram_controller_tb;

architecture TB_ARCHITECTURE of secd_ram_controller_tb is
  -- Component declaration of the tested unit
  component secd_ram_controller
    port(
      clk : in std_logic;
      reset : in std_logic;
      secd_stopped : in std_logic;
      din32 : in std_logic_vector(31 downto 0);
      dout32 : out std_logic_vector(31 downto 0);
      addr32 : in std_logic_vector(13 downto 0);
      read32_enable : in std_logic;
      write32_enable : in std_logic;
      busy : out std_logic;
      din8 : in std_logic_vector(7 downto 0);
      dout8 : out std_logic_vector(7 downto 0);
      addr8 : in std_logic_vector(15 downto 0);
      cs8 : in std_logic;
      rw8 : in std_logic;
      ram_oen : out std_logic;
      ram_cen : out std_logic;
      ram_wen : out std_logic;
      ram_io : inout std_logic_vector(15 downto 0);
      ram_a : out std_logic_vector(20 downto 0);
      ram_bhen : out std_logic;
      ram_blen : out std_logic );
  end component;

  -- Stimulus signals - signals mapped to the input and inout ports of tested entity
  signal clk : std_logic;
  signal reset : std_logic;
  signal secd_stopped : std_logic;
  signal din32 : std_logic_vector(31 downto 0);
  signal addr32 : std_logic_vector(13 downto 0);
  signal read32_enable : std_logic;
  signal write32_enable : std_logic;
  signal busy : std_logic;
  signal din8 : std_logic_vector(7 downto 0);
  signal addr8 : std_logic_vector(15 downto 0);
  signal rw8 : std_logic;
  signal cs8 : std_logic;
  signal ram_io : std_logic_vector(15 downto 0);
  signal cpu_hold : std_logic;
  -- Observed signals - signals mapped to the output ports of tested entity
  signal dout32 : std_logic_vector(31 downto 0);
  signal dout8 : std_logic_vector(7 downto 0);
  signal ram_oen : std_logic;
  signal ram_cen : std_logic;
  signal ram_wen : std_logic;
  signal ram_a : std_logic_vector(20 downto 0);
  signal ram_bhen : std_logic;
  signal ram_blen : std_logic;
  -- Add your code here ...

begin
  
  ram : entity idt71V416 port map (
    a0 => ram_a(0),
    a1 => ram_a(1),
    a2 => ram_a(2),
    a3 => ram_a(3),
    a4 => ram_a(4),
    a5 => ram_a(5),
    a6 => ram_a(6),
    a7 => ram_a(7),
    a8 => ram_a(8),
    a9 => ram_a(9),
    a10 => ram_a(10),
    a11 => ram_a(11),
    a12 => ram_a(12),
    a13 => ram_a(13),
    a14 => ram_a(14),
    a15 => ram_a(15),
    a16 => ram_a(16),
    a17 => ram_a(17),
    d0 => ram_io(0),
    d1 => ram_io(1),
    d2 => ram_io(2),
    d3 => ram_io(3),
    d4 => ram_io(4),
    d5 => ram_io(5),
    d6 => ram_io(6),
    d7 => ram_io(7),
    d8 => ram_io(8),
    d9 => ram_io(9),
    d10 => ram_io(10),
    d11 => ram_io(11),
    d12 => ram_io(12),
    d13 => ram_io(13),
    d14 => ram_io(14),
    d15 => ram_io(15),
    bheneg => ram_bhen,
    bleneg => ram_blen,
    oeneg => ram_oen,
    weneg => ram_wen,
    ceneg => ram_cen);
  
  -- Unit Under Test port map
  UUT : secd_ram_controller
    port map (
      clk => clk,
      reset => reset,
      secd_stopped => secd_stopped,
      busy => busy,
      din32 => din32,
      dout32 => dout32,
      addr32 => addr32,
      read32_enable => read32_enable,
      write32_enable => write32_enable,
      din8 => din8,
      dout8 => dout8,
      addr8 => addr8,
      rw8 => rw8,
      cs8 => cs8,
      ram_oen => ram_oen,
      ram_cen => ram_cen,
      ram_wen => ram_wen,
      ram_io => ram_io,
      ram_a => ram_a,
      ram_bhen => ram_bhen,
      ram_blen => ram_blen
      );

  -- Add your stimulus here ...

  clock_stimulus : process
  begin
    clk <= '1';
    wait for 20 ns;
    clk <= '0';
    wait for 20 ns;
  end process;

  stimulus : process

    procedure read8(addr : in std_logic_vector(15 downto 0)) is
      variable result : std_logic_vector(7 downto 0);
    begin
      addr8 <= addr;
      wait for 10 ns;
      cs8 <= '1';
      wait for 20 ns;
      result := din8;
      cs8 <= '0';
      wait for 40 ns;
      report "read8 " & integer'image(to_integer(unsigned(addr))) & ": " & integer'image(to_integer(unsigned(result)));
    end procedure;

    procedure write8(addr : in std_logic_vector(15 downto 0);
                     data : in std_logic_vector(7 downto 0)) is
    begin
      addr8 <= addr;
      din8 <= data;
      rw8 <= '0';
      wait for 10 ns;
      cs8 <= '1';
      wait for 40 ns;
      cs8 <= '0';
      rw8 <= '1';
      wait for 40 ns;
    end procedure;

    procedure read32(addr : in std_logic_vector(15 downto 0)) is
      variable result : std_logic_vector(31 downto 0);
    begin
      assert addr(15 downto 14) = "00" report "invalid address for 32 bit access";
      addr32 <= addr(13 downto 0);
      wait for 10 ns;
      read32_enable <= '1';
      wait for 100 ns;
      read32_enable <= '0';
      wait until busy = '0';
      result := din32;
      report "read32 " & integer'image(to_integer(unsigned(addr))) & ": " & integer'image(to_integer(unsigned(result)));
    end procedure;

    procedure write32(addr : in std_logic_vector(15 downto 0);
                      data : in std_logic_vector(31 downto 0)) is
    begin
      assert addr(15 downto 14) = "00" report "invalid address for 32 bit access";
      addr32 <= addr(13 downto 0);
      din32 <= data;
      wait for 10 ns;
      write32_enable <= '1';
      wait for 100 ns;
      write32_enable <= '0';
      wait until busy = '0';
    end procedure;

  begin
    reset <= '1';
    read32_enable <= '0';
    write32_enable <= '0';
    rw8 <= '1';
    cs8 <= '0';

    addr8 <= (others => '0');
    din8 <= (others => '0');
    addr32 <= (others => '0');
    din32 <= (others => '0');

    secd_stopped <= '1';

    wait for 70 ns;
    reset <= '0';
    wait for 70 ns;

    write8(X"FFFF", X"FF");
    read8(X"FFFF");

    secd_stopped <= '0';

    write32(X"0000", X"F0A5739C");

    secd_stopped <= '1';

    read8(X"0000");
    read8(X"0001");
    read8(X"0002");
    read8(X"0003");

    write8(X"0004", X"11");
    write8(X"0005", X"22");
    write8(X"0006", X"33");
    write8(X"0007", X"44");

    read8(X"0004");
    read8(X"0005");
    read8(X"0006");
    read8(X"0007");

    secd_stopped <= '0';

    read32(X"0000");
    read32(X"0001");

    wait for 300 ns;
    assert (0 = 1) report "done";
  end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_secd_ram_controller of secd_ram_controller_tb is
  for TB_ARCHITECTURE
    for UUT : secd_ram_controller
      use entity work.secd_ram_controller(external_ram);
    end for;
  end for;
end TESTBENCH_FOR_secd_ram_controller;

