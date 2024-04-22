library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.wishbonepkg.all;

entity ocram_dp is
  generic (
    address_bits: natural := 11
  );
  port (
    syscon:     in wb_syscon_type;
    syscon2:    in wb_syscon_type;
    wbi:        in wb_mosi_type;
    wbo:        out wb_p_miso_type;
    wbi2:       in wb_mosi_type;
    wbo2:       out wb_p_miso_type
  );
end entity ocram_dp;

architecture behave of ocram_dp is

  signal ack:   std_logic;
  signal ack2:  std_logic;
  signal en:    std_logic;
  signal en2:   std_logic;
  signal ramwe: std_logic_vector(3 downto 0);
  signal ramwe2:std_logic_vector(3 downto 0);
begin

  wbo.int<='0';
  wbo.err<='0';
  wbo.ack<=ack;
  wbo.stall<='0';

  en<=wbi.cyc and wbi.stb;

  process(syscon.clk)
  begin
    if rising_edge(syscon.clk) then
      wbo.tag <= wbi.tag;
      if syscon.rst='1' then
        ack<='0';
      else
        ack<='0';
        if en='1' then
          ack<='1';
        end if;
      end if;
    end if;
  end process;

  wbo2.int<='0';
  wbo2.err<='0';
  wbo2.ack<=ack2;
  wbo2.stall<='0';

  en2<=wbi2.cyc and wbi2.stb;

  process(syscon2.clk)
  begin
    if rising_edge(syscon2.clk) then
      wbo2.tag <= wbi2.tag;
      if syscon2.rst='1' then
        ack2<='0';
      else
        ack2<='0';
        if en2='1' then
          ack2<='1';
        end if;
      end if;
    end if;
  end process;

  rams: for i in 0 to 3 generate

    ramwe(i) <= wbi.we and wbi.sel(i);
    ramwe2(i) <= wbi2.we and wbi2.sel(i);

    raminst: entity work.generic_dp_ram
    generic map (
      address_bits => address_bits,
      data_bits    => 8
    )
    port map (
      clka    => syscon.clk,
      ena     => en,
      wea     => ramwe(i),
      addra   => wbi.adr(address_bits+1 downto 2),
      dia     => wbi.dat(((i+1)*8)-1 downto (i*8)),
      doa     => wbo.dat(((i+1)*8)-1 downto (i*8)),

      clkb    => syscon2.clk,
      enb     => en2,
      web     => ramwe2(i),
      addrb   => wbi2.adr(address_bits+1 downto 2),
      dib     => wbi2.dat(((i+1)*8)-1 downto (i*8)),
      dob     => wbo2.dat(((i+1)*8)-1 downto (i*8))
    );

  end generate;

end behave;
