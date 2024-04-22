----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:44:52 03/24/2015 
-- Design Name: 
-- Module Name:    I2C_MASTER - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity I2C_MASTER is

port(
clk,reset : in std_logic;
scl : inout std_logic;
sda : inout std_logic;
address_akt : in std_logic_vector(7 downto 0);
address_reg : in std_logic_vector(7 downto 0);
data_reg : in std_logic_vector(7 downto 0);
tik_boad : in std_logic;
max_tik : in std_logic;
start_send : in std_logic;
akt_send : out std_logic;
falt : out std_logic;
busy : out std_logic;
free : out std_logic);

end I2C_MASTER;

architecture Behavioral of I2C_MASTER is
type state_type is (idle,start,add_akt,akt_1,add_reg,akt_2,da_reg,akt_3,delay,stop);
signal state_reg,state_next: state_type;
signal dir,sda_in,sda_out : std_logic;
signal sda_out_reg , sda_out_next : std_logic;
signal scl_reg , scl_next : std_logic;
signal dir_reg , dir_next : std_logic;
signal s_reg , s_next : unsigned (1 downto 0);
signal n_reg , n_next : unsigned (2 downto 0);
signal b_reg_1 , b_next_1 : std_logic_vector(7 downto 0);
signal b_reg_2 , b_next_2 : std_logic_vector(7 downto 0);
signal b_reg_3 , b_next_3 : std_logic_vector(7 downto 0);
begin

bof_sda:entity work.bof
port map(bi => sda ,dir => dir , sig_out => sda_out ,sig_in => sda_in);

process(clk,reset)
begin
if reset='0' then
state_reg <= idle;
dir_reg <= '1';
scl_reg <= '1'; 
sda_out_reg <= '1';
s_reg <= (others => '0');
n_reg <= (others => '0');
b_reg_1 <= (others => '0');
b_reg_2 <= (others => '0');
b_reg_3 <= (others => '0');
-------
elsif (clk'event and clk = '1') then
state_reg <= state_next;
dir_reg <= dir_next ;
scl_reg <= scl_next ; 
sda_out_reg <= sda_out_next ;
s_reg <= s_next;
n_reg <= n_next;
b_reg_1 <= b_next_1;
b_reg_2 <= b_next_2;
b_reg_3 <= b_next_3;
end if;
end process;

process (state_reg,dir_reg,scl_reg,sda_out_reg,address_akt,address_reg,data_reg,tik_boad,max_tik,start_send,s_reg,n_reg,b_reg_1,b_reg_2,b_reg_3,sda_in)
begin
state_next <= state_reg;
dir_next <= dir_reg;
scl_next <= scl_reg; 
sda_out_next <= sda_out_reg;
akt_send <= '0';
falt <= '0';
busy <= '0';
free <= '1';
s_next <= s_reg;
n_next <= n_reg;
b_next_1 <= b_reg_1;
b_next_2 <= b_reg_2;
b_next_3 <= b_reg_3;
case state_reg is
-------------------------------------------------------------------
when idle =>
dir_next <= '1';
scl_next <= '1'; 
sda_out_next <= '1';
if start_send = '0' then 
state_next <= start;
s_next <= (others => '0');
b_next_1 <= address_akt;
b_next_2 <= address_reg;
b_next_3 <= data_reg ;
end if;
------------------------------------------------------------------
when start => 

busy <= '1';
free <= '0';
sda_out_next <= '0';
dir_next <= '1';
scl_next <= '1';
if ( tik_boad = '1' ) then 
if ( s_reg = 1 ) then
state_next <= add_akt;
s_next <= (others => '0');
n_next <= (others => '0');
else
s_next <= s_reg + 1;
end if;
end if;
------------------------------------------------------------------
when add_akt =>
busy <= '1';
free <= '0';
dir_next <= '1';
scl_next <= max_tik ; 
sda_out_next <= b_reg_1(7);
if( tik_boad = '1' ) then 
s_next <= (others => '0');
b_next_1 <= b_reg_1(6 downto 0) & '1'; 
if n_reg = 7 then 
state_next <= akt_1;
n_next <= (others => '0');
else
n_next <= n_reg + 1;
end if;
end if;
-------------------------------------------------------------------
when akt_1 =>
busy <= '1';
free <= '0';
dir_next <= '0';
scl_next <= max_tik; 
if( tik_boad = '1' ) then 
if ( sda_in = '0' ) then 
state_next <= add_reg;
else
falt <= '1';
state_next <= idle;
end if;
end if;
--------------------------------------------------------------------

when add_reg =>
busy <= '1';
free <= '0';
dir_next <= '1';
scl_next <= max_tik ; 
sda_out_next <= b_reg_2(7);
if( tik_boad = '1' ) then 
s_next <= (others => '0');
b_next_2 <=b_reg_2(6 downto 0) & '1'; 
if n_reg = 7 then 
state_next <= akt_2;
n_next <= (others => '0');
else
n_next <= n_reg + 1;
end if;
end if;

-------------------------------------------------------------------
when akt_2 =>
busy <= '1';
free <= '0';
dir_next <= '0';
scl_next <= max_tik; 
if( tik_boad = '1' ) then 
if ( sda_in = '0' ) then 
state_next <= da_reg;
else
falt <= '1';
state_next <= idle;
end if;
end if;

------------------------------------------------------------------
when da_reg =>
busy <= '1';
free <= '0';
dir_next <= '1';
scl_next <= max_tik ; 
sda_out_next <= b_reg_3(7);
if( tik_boad = '1' ) then 
s_next <= (others => '0');
b_next_3 <= b_reg_3(6 downto 0) & '1'; 
if n_reg = 7 then 
state_next <= akt_3;
n_next <= (others => '0');
else
n_next <= n_reg + 1;
end if;
end if;

------------------------------------------------------------------
when akt_3 =>
busy <= '1';
free <= '0';
dir_next <= '0';
scl_next <= max_tik; 
if( tik_boad = '1' ) then 
if ( sda_in = '0' ) then 
state_next <= delay;
else
falt <= '1';
state_next <= idle;
end if;
end if;

------------------------------------------------------------------
when delay =>
busy <= '1';
free <= '0';
dir_next <= '1';
scl_next <= '0'; 
sda_out_next <= '0';
if( tik_boad = '1' ) then  
if n_reg = 7 then 
scl_next <= '1'; 
state_next <= stop;
n_next <= (others => '0');
else
n_next <= n_reg + 1;
end if;
end if;

------------------------------------------------------------------

when stop =>
busy <= '1';
free <= '0';
akt_send <= '1';
dir_next <= '1';
scl_next <= '1'; 
sda_out_next <= '1';
state_next <= idle;
------------------------------------------------------------------
end case;

end process;
sda_out <= sda_out_reg ;
scl <= scl_reg ;
dir <= dir_reg ;

end Behavioral;

