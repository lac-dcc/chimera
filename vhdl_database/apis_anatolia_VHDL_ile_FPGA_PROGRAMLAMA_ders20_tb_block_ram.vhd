-- library ieee;
-- use ieee.std_logic_1164.all;

-- package ram_pkg is
    -- function clogb2 (depth: in natural) return integer;
-- end ram_pkg;

-- package body ram_pkg is

-- function clogb2( depth : natural) return integer is
-- variable temp    : integer := depth;
-- variable ret_val : integer := 0;
-- begin
    -- while temp > 1 loop
        -- ret_val := ret_val + 1;
        -- temp    := temp / 2;
    -- end loop;
  	-- return ret_val;
-- end function;

-- end package body ram_pkg;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ram_pkg.all;

entity tb_block_ram is
generic (
RAM_WIDTH 		: integer 	:= 16;				-- Specify RAM data width
RAM_DEPTH 		: integer 	:= 128;				-- Specify RAM depth (number of entries)
RAM_PERFORMANCE : string 	:= "LOW_LATENCY"    -- Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
-- RAM_PERFORMANCE : string 	:= "HIGH_PERFORMANCE"    -- Select "HIGH_PERFORMANCE" or "LOW_LATENCY"
);
end tb_block_ram;

architecture Behavioral of tb_block_ram is

component block_ram is
generic (
RAM_WIDTH 		: integer 	:= 16;				-- Specify RAM data width
RAM_DEPTH 		: integer 	:= 128;				-- Specify RAM depth (number of entries)
RAM_PERFORMANCE : string 	:= "LOW_LATENCY"    -- Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
);
port (
addra : in std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);    -- Address bus, width determined from RAM_DEPTH
dina  : in std_logic_vector(RAM_WIDTH-1 downto 0);		  		-- RAM input data
clka  : in std_logic;                       			  		-- Clock
wea   : in std_logic;                       			  		-- Write enable
douta : out std_logic_vector(RAM_WIDTH-1 downto 0)   			-- RAM output data
);
end component;

signal addra : std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0)	:= (others => '0');
signal dina  : std_logic_vector(RAM_WIDTH-1 downto 0) 			:= (others => '0');
signal clka  : std_logic 										:= '0';            
signal wea   : std_logic 										:= '0';                      
signal douta : std_logic_vector(RAM_WIDTH-1 downto 0);

constant c_clkperiod	: time := 10 ns;

begin

DUT : block_ram
generic map(
RAM_WIDTH 		=> 	RAM_WIDTH 		   ,
RAM_DEPTH 		=> 	RAM_DEPTH 		   ,
RAM_PERFORMANCE =>  RAM_PERFORMANCE    
)
port map(
addra => addra  ,
dina  => dina   ,
clka  => clka   ,
wea   => wea    ,
douta => douta
);

P_CLKGEN : process begin

clka	<= '0';
wait for c_clkperiod/2;
clka	<= '1';
wait for c_clkperiod/2;

end process P_CLKGEN;

P_STIMULI : process begin

wait for c_clkperiod*10;

addra 	<= "0000010";
dina	<= x"ABCD";
wea		<= '1';
wait for c_clkperiod;
addra 	<= "0000011";
dina	<= x"1234";
wea		<= '1';
wait for c_clkperiod;
addra 	<= "0000100";
dina	<= x"9876";
wea		<= '1';
wait for c_clkperiod;
wea		<= '0';
wait for c_clkperiod;
addra 	<= "0000010";
wait for c_clkperiod*3;
addra 	<= "0000011";
wait for c_clkperiod*3;
addra 	<= "0000100";
wait for c_clkperiod*3;

wait for c_clkperiod*10;

assert false 
report "SIM DONE"
severity failure;

end process P_STIMULI;

end Behavioral;