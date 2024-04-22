----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:06:21 03/22/2014 
-- Design Name: 
-- Module Name:    wishbone_uart - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work ;
use work.logi_utils_pack.all ;

entity wishbone_pmic is
generic(
			wb_size : natural := 16 ; -- Data port size for wishbone
			sample_rate : positive := 48_000;
			sclk_period_ns : positive := 80
		  );
port(
-- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(15 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic ;
		  ss, sck : out std_logic ;
		  miso : in std_logic 
);
end wishbone_pmic;

architecture Behavioral of wishbone_pmic is

component ADCS7476_ctrl is
generic(clk_period_ns : positive := 10;
		  sclk_period_ns : positive := 40;
		  time_between_sample_ns : positive :=20_833
);
port(
	clk, resetn : in std_logic;
	sclk, ss : out std_logic ;
	miso : in std_logic ;
	sample_out : out std_logic_vector(11 downto 0);
	sample_valid : out std_logic 
);
end component;


component small_fifo is
generic( WIDTH : positive := 8 ; DEPTH : positive := 8; THRESHOLD : positive := 4);
port(clk, resetn : in std_logic ;
	  push, pop : in std_logic ;
	  full, empty, limit : out std_logic ;
	  data_in : in std_logic_vector( WIDTH-1 downto 0);
	  data_out : out std_logic_vector(WIDTH-1 downto 0)
	  );
end component;

constant time_between_sample_ns : positive := (1_000_000_000/sample_rate);

signal read_ack : std_logic ;
signal write_ack : std_logic ;


-- fifo signals
signal reset_fifo : std_logic ;
signal fifo_empty, fifo_full, pop_fifo, push_fifo : std_logic ;
signal fifo_out : std_logic_vector(15 downto 0);
signal fifo_in : std_logic_vector(15 downto 0);
signal enable_fifo, sample_valid : std_logic ;
signal read_ack_old : std_logic ;
begin

wbs_ack <= read_ack or write_ack;

write_bloc : process(gls_clk,gls_reset)
begin
    if gls_reset = '1' then 
        write_ack <= '0';
    elsif rising_edge(gls_clk) then
        if ((wbs_strobe and wbs_write and wbs_cycle) = '1' ) then
            write_ack <= '1';
				reset_fifo <= wbs_writedata(0);
				enable_fifo <= wbs_writedata(1);
        else
            write_ack <= '0';
        end if;
    end if;
end process write_bloc;

read_bloc : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
		  read_ack <= '0' ;
    elsif rising_edge(gls_clk) then

        if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1') then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
		  read_ack_old <= read_ack ;
    end if;
end process read_bloc;

wbs_readdata <= (NOT fifo_empty)  & fifo_full & "00" & fifo_out(11 downto 0);
pop_fifo <= '1' when read_ack = '0' and read_ack_old = '1' else
				'0' ;

mi_0 : ADCS7476_ctrl
generic map(clk_period_ns => 10,
		  sclk_period_ns => sclk_period_ns,
		  time_between_sample_ns => time_between_sample_ns
)
port map(
	clk => gls_clk,
	resetn => reset_fifo,
	sclk => sck, 
	ss => ss,
	miso => miso,
	sample_out => fifo_in(11 downto 0),
	sample_valid => sample_valid
);

push_fifo <= enable_fifo and sample_valid ;

fifo0 : small_fifo 
generic map( WIDTH => 16, DEPTH => 512)
port map(clk => gls_clk,
		resetn => reset_fifo,
	  empty => fifo_empty,
	  full => fifo_full,
	  push => push_fifo, pop => pop_fifo,
	  data_in => fifo_in,
	  data_out => fifo_out
	  );

end Behavioral;

