library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library work;
use work.zpu_config.all;

entity wb_bootloader is
  port (
    wb_clk_i:   in std_logic;
    wb_rst_i:   in std_logic;

    wb_dat_o:   out std_logic_vector(31 downto 0);
    wb_adr_i:   in std_logic_vector(11 downto 2);
    wb_cyc_i:   in std_logic;
    wb_stb_i:   in std_logic;
    wb_ack_o:   out std_logic;
    wb_stall_o: out std_logic;

    wb2_dat_o:   out std_logic_vector(31 downto 0);
    wb2_adr_i:   in std_logic_vector(11 downto 2);
    wb2_cyc_i:   in std_logic;
    wb2_stb_i:   in std_logic;
    wb2_ack_o:   out std_logic;
    wb2_stall_o: out std_logic
  );
end wb_bootloader;


architecture behave of wb_bootloader is

  component bootloader_dp_32 is
  port (
    CLK:              in std_logic;
    WEA:  in std_logic;
    ENA:  in std_logic;
    MASKA:    in std_logic_vector(3 downto 0);
    ADDRA:         in std_logic_vector(11 downto 2);
    DIA:        in std_logic_vector(31 downto 0);
    DOA:         out std_logic_vector(31 downto 0);
    WEB:  in std_logic;
    ENB:  in std_logic;
    ADDRB:         in std_logic_vector(11 downto 2);
    DIB:        in std_logic_vector(31 downto 0);
    MASKB:    in std_logic_vector(3 downto 0);
    DOB:         out std_logic_vector(31 downto 0)
  );
  end component bootloader_dp_32;

  signal ack: std_logic;
  signal en:  std_logic;
  signal ack2: std_logic;
  signal en2:  std_logic;

begin

  wb_stall_o <= '0';
  wb2_stall_o <= '0';
  wb_ack_o <= ack;
  wb2_ack_o <= ack2;

  en <= wb_cyc_i and wb_stb_i;
  en2 <= wb2_cyc_i and wb2_stb_i;

  process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
        ack <= '0';
        ack2 <= '0';
      else
        ack <= en;
        ack2 <= en2 and not ack2;
      end if;
    end if;
  end process;


  rom: bootloader_dp_32
  port map (
    CLK         => wb_clk_i,
    WEA         => '0',
    ENA         => en,
    MASKA       => (others => '1'),
    ADDRA       => wb_adr_i,
    DIA         => (others => DontCareValue),
    DOA         => wb_dat_o,
    WEB         => '0',
    ENB         => en2,
    ADDRB       => wb2_adr_i,
    DIB         => (others => DontCareValue),
    MASKB       => (others => '1'),
    DOB         => wb2_dat_o
  );

end behave;
