library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.Common.all;

entity Memory_sim is
end Memory_sim;

architecture behav of Memory_sim is

  component MemoryVirtual
    port (
      clk:          in      std_logic;
      rst:          in      std_logic;
      rw:           in      RwType;
      length:       in      LenType;
      addr:         in      std_logic_vector (31 downto 0);
      data_in:      in      std_logic_vector (31 downto 0);
      data_out:     out     std_logic_vector (31 downto 0)
      );
  end component;

  -- component ports
  signal clk      : std_logic := '0';
  signal rst      : std_logic := '1';
  signal rw       : RwType := R;
  signal length   : LenType;
  signal addr     : std_logic_vector (31 downto 0);
  signal data_in  : std_logic_vector (31 downto 0);
  signal data_out : std_logic_vector (31 downto 0);

begin  -- behav

  -- component instantiation
  DUT : MemoryVirtual
    port map (
      clk      => clk,
      rst      => rst,
      rw       => rw,
      length   => length,
      addr     => addr,
      data_in  => data_in,
      data_out => data_out);

  WaveGen_Proc : process
    variable L : line;
  begin

    -- reset
    rst <= '0', '1' after 10 ns;
    wait for 10 ns;

    -- read tests
    write(L, string'("read tests :"));
    writeline(output, L);

    clk    <= '1', '0' after 10 ns;
    addr   <= x"00000000";
    length <= Lword;
    rw     <= R;
    wait for 10 ns;
    write(L, string'("     word at 0x00 :"));
    write(L, to_bitvector(data_out));
    writeline(output, L);

    clk    <= '1', '0' after 10 ns;
    addr   <= x"00000004";
    length <= Lhalf;
    rw     <= R;
    wait for 10 ns;
    write(L, string'("half-word at 0x04 :"));
    write(L, to_bitvector(data_out));
    writeline(output, L);

    clk    <= '1', '0' after 10 ns;
    addr   <= x"0000000a";
    length <= Lbyte;
    rw     <= R;
    wait for 10 ns;
    write(L, string'("     byte at 0x0a :"));
    write(L, to_bitvector(data_out));
    writeline(output, L);

    clk    <= '1', '0' after 10 ns;
    addr   <= x"0000000c";
    length <= Lword;
    rw     <= R;
    wait for 10 ns;
    write(L, string'("     word at 0x0c :"));
    write(L, to_bitvector(data_out));
    writeline(output, L);

    clk    <= '1', '0' after 10 ns;
    addr   <= x"00000012";
    length <= Lhalf;
    rw     <= R;
    wait for 10 ns;
    write(L, string'("half-word at 0x12 :"));
    write(L, to_bitvector(data_out));
    writeline(output, L);

    clk    <= '1', '0' after 10 ns;
    addr   <= x"00000017";
    length <= Lbyte;
    rw     <= R;
    wait for 10 ns;
    write(L, string'("     byte at 0x17 :"));
    write(L, to_bitvector(data_out));
    writeline(output, L);

    -- write tests
    write(L, string'("write tests :"));
    writeline(output, L);

    clk     <= '1', '0' after 10 ns;
    addr    <= x"00000000";
    length  <= Lword;
    rw      <= W;
    data_in <= x"01010101";
    wait for 10 ns;
    write(L, string'("write      word to 0x00: 0x01010101"));
    writeline(output, L);

    clk     <= '1', '0' after 10 ns;
    addr    <= x"00000004";
    length  <= Lhalf;
    rw      <= W;
    data_in <= x"0000aaaa";
    wait for 10 ns;
    write(L, string'("write half-word to 0x04: 0xaaaa"));
    writeline(output, L);

    clk     <= '1', '0' after 10 ns;
    addr    <= x"00000009";
    length  <= Lbyte;
    rw      <= W;
    data_in <= x"000000ff";
    wait for 10 ns;
    write(L, string'("write      byte to 0x09: 0xff"));
    writeline(output, L);

    -- read out
    write(L, string'("read out :"));
    writeline(output, L);

    clk    <= '1', '0' after 10 ns;
    addr   <= x"00000000";
    length <= Lword;
    rw     <= R;
    wait for 10 ns;
    write(L, string'("word at 0x00 :"));
    write(L, to_bitvector(data_out));
    writeline(output, L);

    clk    <= '1', '0' after 10 ns;
    addr   <= x"00000004";
    length <= Lword;
    rw     <= R;
    wait for 10 ns;
    write(L, string'("word at 0x04 :"));
    write(L, to_bitvector(data_out));
    writeline(output, L);

    clk    <= '1', '0' after 10 ns;
    addr   <= x"00000008";
    length <= Lword;
    rw     <= R;
    wait for 10 ns;
    write(L, string'("word at 0x08 :"));
    write(L, to_bitvector(data_out));
    writeline(output, L);

    wait;
    
  end process WaveGen_Proc;

end behav;

