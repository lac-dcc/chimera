library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

-- Frame synchronizer for version without shift.
-- This version performs alignment with the input stream by 
-- unlocking the demux chip and checking for alignment.
-- Depends on statistical behavior of demux PLL.

-- Used in EVLA DTS receiver.
-- After reset starts in search mode.
-- When 6 of 7 received frames have sync word goes to run mode.
-- I more than 1 of 8 received frames do not have sync word
--   goes back to search.

entity synchronizer is
  port(
    input       : in  std_logic_vector( 9 downto 0 );
    clock       : in  std_logic;
    lockdet     : in  std_logic;
    rx_locked   : in  std_logic;
    init        : in  std_logic;
    wrstb       : in  std_logic;
    sel         : in  std_logic;
    synced      : out std_logic;
    shift       : out std_logic
  );
end synchronizer;

architecture behavioral of synchronizer is
  signal en        : std_logic;
  signal sync      : std_logic;
  signal syncs     : std_logic_vector( 6 downto 0 );
  signal twobad    : std_logic;
  signal sixgood   : std_logic;
  signal reset     : std_logic;
  signal nextst    : std_logic;
  signal state     : std_logic;
  signal count     : std_logic_vector( 2 downto 0 );
  signal got7      : std_logic;
  signal enablectr : std_logic;
  signal enable1   : std_logic;
  signal shifti    : std_logic;
  signal makeshift : std_logic;
  signal startover : std_logic;
  signal endpulse  : std_logic;
  signal resetcmd  : std_logic;

component pulser
  generic(
    mode : std_logic_vector( 0 downto 0 )
    );
  port(
    strobe  : in  std_logic;
    d       : in  std_logic;
    en      : in  std_logic;
    clock   : in  std_logic;
    q       : out std_logic
    );
end component;

begin

reset <= resetcmd or not en or twobad;

u1: pulser generic map( mode => "1" )
  port map( strobe => wrstb, d => init, en => sel, clock => clock, q => resetcmd );

  en <= lockdet and rx_locked;
  sync <= input(0) and not input(1) and not input(2) and input(3) and not input(4) 
      and input(5) and not input(6) and     input(7) and input(8) and not input(9);

-- state flip flop.

nextst <= sixgood and got7;

process( clock, reset, nextst, en )
begin
  if reset = '1' then
    state <= '0';
  elsif clock'event and clock = '1' then
    if en = '1' then
      state <= nextst;
    end if;
  end if;
end process;

with enable1 select
  makeshift <= not sync  when '0',
               startover when '1';

startover <= ( not sixgood and got7 );

process( clock, en, makeshift, endpulse )
begin
  if  endpulse = '1' then
    shifti <= '0';
  elsif clock'event and clock = '1' then
    if en = '1' or shifti = '1' then
      shifti <= makeshift;
    end if;
  end if;
end process;

process( clock, shifti )
begin
  if clock'event and clock = '1' then
    endpulse <= shifti;
  end if;
end process;

enablectr <= enable1 and not got7;

with count select
  got7 <= '1' when "111",
          '0' when others;

process( clock, enable1, enablectr )
  variable countval : unsigned( 2 downto 0 );
begin
  if enable1 = '0' then
    countval := "000";
  elsif clock'event and clock = '1' then
    if enablectr = '1' then
      countval := countval + 1;
    end if;
  end if;
  count <= std_logic_vector( countval );
end process;

process( sync, clock, en, shifti, reset )
begin
  if shifti = '1' or reset = '1' then
    enable1 <= '0';
  elsif clock'event and clock = '1' then
    if sync = '1' and en = '1' then
      enable1 <= '1';
    end if;
  end if;
end process;

shift <= shifti;
synced <= state;


process( clock, en, sync, reset )
begin
  if reset = '1' then
    syncs <= "0000000";
  elsif clock'event and clock = '1' then
    if en = '1' then
      syncs <= sync & syncs( 6 downto 1 );
    end if;
  end if;
end process;

twobad <= (
          ( not syncs( 5 ) and not sync )
       or ( not syncs( 4 ) and not sync )
       or ( not syncs( 3 ) and not sync )
       or ( not syncs( 2 ) and not sync )
       or ( not syncs( 1 ) and not sync )
       or ( not syncs( 0 ) and not sync ) );

sixgood <= not(
          ( not syncs( 6 ) and not sync )
       or ( not syncs( 5 ) and not sync )
       or ( not syncs( 4 ) and not sync )
       or ( not syncs( 3 ) and not sync )
       or ( not syncs( 2 ) and not sync )
       or ( not syncs( 1 ) and not sync )
       or ( not syncs( 0 ) and not sync ) );
  
end behavioral;
