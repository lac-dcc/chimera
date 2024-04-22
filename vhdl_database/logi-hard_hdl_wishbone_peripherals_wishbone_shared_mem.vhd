----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:37:39 04/01/2014 
-- Design Name: 
-- Module Name:    wishbone_shared_mem - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work ;
use work.logi_utils_pack.all ;

entity wishbone_shared_mem is
generic( mem_size : positive := 256;
			wb_size : natural := 16 ; -- Data port size for wishbone
			wb_addr_size : natural := 16 ;  -- Data port size for wishbone
			logic_addr_size : natural := 10 ;
			logic_data_size : natural := 16
		  );
port(
		  -- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(wb_addr_size-1 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic;
		  
		  
		  -- Logic signals
		  write_in : in std_logic ;
		  addr_in : in std_logic_vector(logic_addr_size-1 downto 0);
		  data_in : in std_logic_vector(logic_data_size-1 downto 0);
		  data_out : out std_logic_vector(logic_data_size-1 downto 0)
		  );
end wishbone_shared_mem;

architecture Behavioral of wishbone_shared_mem is

component tdp_bram is
generic (
    DATA_A    : integer := 16;
    ADDR_A    : integer := 10;
	 DATA_B    : integer := 16;
    ADDR_B    : integer := 10
);
port (
    -- Port A
    a_clk   : in  std_logic;
    a_wr    : in  std_logic;
    a_addr  : in  std_logic_vector(ADDR_A-1 downto 0);
    a_din   : in  std_logic_vector(DATA_A-1 downto 0);
    a_dout  : out std_logic_vector(DATA_A-1 downto 0);
     
    -- Port B
    b_clk   : in  std_logic;
    b_wr    : in  std_logic;
    b_addr  : in  std_logic_vector(ADDR_B-1 downto 0);
    b_din   : in  std_logic_vector(DATA_B-1 downto 0);
    b_dout  : out std_logic_vector(DATA_B-1 downto 0)
);
end component;


signal read_ack : std_logic ;
signal write_ack : std_logic ;
signal write_mem : std_logic ;

begin

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

write_mem  <= wbs_strobe and wbs_write and wbs_cycle  ;

ram0 : tdp_bram 
generic map (
    DATA_A => 16,
    ADDR_A => nbit(mem_size),
	 DATA_B => logic_data_size,
    ADDR_B => logic_addr_size
)
port map(
    -- Port A
    a_clk => gls_clk,
    a_wr  => write_mem,
    a_addr  => wbs_address(nbit(mem_size)-1 downto 0),
    a_din   => wbs_writedata,
    a_dout  => wbs_readdata,
     
    -- Port B
    b_clk   => gls_clk,
    b_wr    => write_in,
    b_addr  => addr_in,
    b_din   => data_in,
    b_dout  => data_out
);


end Behavioral;

