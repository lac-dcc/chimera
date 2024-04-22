library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- synthesis tool should recognize this as 8-bit RAM
-- and optimally synthesize it using FPGA on-chip 
-- single port block RAM (BRAM)

entity bram_1port is
    generic(
	C_mem_size: integer := 8 -- size in KB
    );
    port(
	clock: in std_logic;
	-- read-write port
	rw_port_write: in std_logic;
	rw_port_addr: in std_logic_vector(15 downto 0);
	rw_port_data_in: in std_logic_vector(7 downto 0);
	rw_port_data_out: out std_logic_vector(7 downto 0)
    );
end bram_1port;

architecture x of bram_1port is
    type bram_type is array(0 to (C_mem_size * 1024 - 1))
      of std_logic_vector(7 downto 0);
    
    signal bram: bram_type;

    attribute ramstyle: string;
    attribute ramstyle of bram: signal is "no_rw_check";

begin

    process(clock)
    begin
	if falling_edge(clock) then
	    if rw_port_write = '1' then
		bram(conv_integer(rw_port_addr)) <= rw_port_data_in;
	    end if;
            rw_port_data_out <= bram(conv_integer(rw_port_addr));
	end if;
    end process;

end x;
