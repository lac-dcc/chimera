----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:28:56 07/06/2014 
-- Design Name: 
-- Module Name:    wishbone_led_matrix_ctrl - Behavioral 
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

----------------------------------------------------------------------------------
-- This controller is based on Glen Atkins work (http://bikerglen.com/projects/lighting/led-panel-1up/)
-- Minor modification on controller behavior to adapt to wishbone bus
-- Major modification on coding style to meet XST guidelines
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
library work;
use work.logi_utils_pack.all ;
use work.control_pack.all ;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity wishbone_led_matrix_ctrl is
generic(wb_size : positive := 16;
		  clk_div : positive := 10;
		  -- TODO: nb_panels is untested, still need to be validated
		  nb_panels : positive := 1 ;
		  bits_per_color : INTEGER RANGE 1 TO 4 := 4 ;
		  expose_step_cycle : positive := 1910
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
		  wbs_ack       : out std_logic;
		  
		  
		  SCLK_OUT : out std_logic ;
		  BLANK_OUT : out std_logic ;
		  LATCH_OUT : out std_logic ;
		  A_OUT : out std_logic_vector(3 downto 0);
		  R_out : out std_logic_vector(1 downto 0);
		  G_out : out std_logic_vector(1 downto 0);
		  B_out : out std_logic_vector(1 downto 0)

);
end wishbone_led_matrix_ctrl;

architecture Behavioral of wishbone_led_matrix_ctrl is


signal read_ack : std_logic ;
signal write_ack, write_pixel: std_logic ;

signal pixel_addr : std_logic_vector((nbit(32*32*nb_panels))-1 downto 0);

begin


-- wishbone related logic

wbs_ack <= read_ack or write_ack;

write_bloc : process(gls_clk,gls_reset)
begin
    if gls_reset = '1' then 
        write_ack <= '0';
    elsif rising_edge(gls_clk) then
        if ((wbs_strobe and wbs_write and wbs_cycle) = '1' ) then
            write_ack <= '1';
        else
            write_ack <= '0';
        end if;
    end if;
end process write_bloc;


read_bloc : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
        
    elsif rising_edge(gls_clk) then
        if (wbs_strobe = '1' and wbs_write = '0'  and wbs_cycle = '1' ) then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
    end if;
end process read_bloc;


-- ram buffer instanciation

write_pixel  <= wbs_strobe and wbs_write and wbs_cycle  ;

pixel_addr <= wbs_address(pixel_addr'high downto 0);


matrix_ctrl0 : rgb_32_32_matrix_ctrl
generic map(
		  clk_div => clk_div,
		  nb_panels => nb_panels,
		  expose_step_cycle => expose_step_cycle,
		  bits_per_color => bits_per_color
)
port map(

		  clk => gls_clk, reset => gls_reset,
		  pixel_addr => pixel_addr,
		  pixel_value_in => wbs_writedata((bits_per_color*3)-1 downto 0),
		  pixel_value_out => wbs_readdata((bits_per_color*3)-1 downto 0),
		  write_pixel => write_pixel,
		  SCLK_OUT => SCLK_OUT,
		  BLANK_OUT => BLANK_OUT,
		  LATCH_OUT => LATCH_OUT,
		  A_OUT => A_OUT,
		  R_out => R_OUT,
		  G_out => G_OUT,
		  B_out => B_OUT
);
wbs_readdata (15 downto (bits_per_color*3)) <= (others => '0');
	

end Behavioral;


