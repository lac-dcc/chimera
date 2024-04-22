-- data channel controller

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity dcc is
 port
 (
  -- synchronous logic
  rst: in std_logic;
  clk: in std_logic;

  -- block transfer descriptor
  btd_en: out std_logic;
  btd_size: out std_logic_vector(32 - 1 downto 0);
  btd_flags: out std_logic_vector(32 - 1 downto 0);
  btd_data: out std_logic_vector(128 - 1 downto 0);
  btd_daddr: out std_logic_vector(64 - 1 downto 0);

  -- btd ack from dca
  btd_ack: in std_logic
 );
end dcc;

architecture dcc_arch of dcc is

 signal en: std_logic;
 signal saddr: std_logic_vector(64 - 1 downto 0);
 signal daddr: std_logic_vector(64 - 1 downto 0);
 signal size: std_logic_vector(32 - 1 downto 0);

begin

 -- TODO
 -- dcc_dsc: work.rashpa.dsc
 -- port map
 -- (
 --  rst => rst;
 --  clk => clk
 -- );

 -- TODO
 -- dcc_ddc: work.rashpa.ddc
 -- port map
 -- (
 --  rst => rst;
 --  clk => clk
 -- );

 process(rst, clk)
 begin
  if rst = '1' then
   btd_en_o <= '0';
  elsif rising_edge(clk) then
   btd_en_o <= '0';
  end if;
 end process;

 -- finite state

 btd_en_o <= btd_en;
 
end dcc_arch;
