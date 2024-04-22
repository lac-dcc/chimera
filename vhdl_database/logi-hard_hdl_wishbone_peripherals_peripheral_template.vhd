
-- add you license code here

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.logi_utils_pack.all ;


entity <component_name> is
generic(wb_size : positive := 16 ;
		  memory_size : positive := <your component size in memory>
		 -- add your component generic parameters starting from here
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
		  
		  
		  -- add your component interfaces starting from here

);
end <component_name>;

architecture RTL of <component_name>
signal read_ack : std_logic ;
signal write_ack: std_logic ;

signal component_write, component_read : std_logic ;
signal component_addr : std_logic_vector(nbit(memory_size)-1 downto 0);
signal component_write_data,  component_read_data: std_logic_vector(wb_size-1 downto 0);

--declare your component signals here

begin


wbs_ack <= read_ack or write_ack;


component_write <= wbs_strobe and wbs_write and wbs_cycle ;
write_bloc : process(gls_clk,gls_reset)
begin
    if gls_reset = '1' then 
        write_ack <= '0';
    elsif rising_edge(gls_clk) then
        if (component_write = '1' ) then
            write_ack <= '1';
        else
            write_ack <= '0';
        end if;
    end if;
end process write_bloc;

component_read <= (wbs_strobe and (not wbs_write)  and wbs_cycle) ;
read_bloc : process(gls_clk, gls_reset)
begin
    if gls_reset = '1' then
        read_ack <= '0' ;
		  wbs_readdata <= (others => '0');
    elsif rising_edge(gls_clk) then
		  wbs_readdata <= component_read_data ;
        if component_read = '1' then
            read_ack <= '1';
        else
            read_ack <= '0';
        end if;
    end if;
end process read_bloc;

component_addr <= wbs_address(nbit(memory_size)-1 downto 0);
component_write_data <= wbs_writedata;

-- insert your component code starting from here
-- use the signal component to control your logic

-- here is an example of a 32bit counter that is controlled by the wishbone bus
-- writing at address 0 will change the value of the 16 lower bits while writing to address
-- will change the 16 upper bits
--counter_bloc : process(gls_clk, gls_reset)
--begin
--    if gls_reset = '1' then
--		  component_count_low <= (others => '0');
--		  component_count_high <= (others => '0');
--    elsif rising_edge(gls_clk) then
--		  if write_component = '1' and component_addr = 0 then
--			component_count_high <= component_write_data ;
--		  else
--			component_count_high <= component_count_high + 1 ;
--		  end if ;
--		  if write_component = '1' and component_addr = 1 then
--			component_count_high <= component_write_data ;
--		  elsif component_count_high = X"FFFF" then
--			component_count_high <= component_count_high + 1 ;
--		  end if ;
--    end if;
--end process counter_bloc;
--component_read_data <= component_count ;


end RTL ;