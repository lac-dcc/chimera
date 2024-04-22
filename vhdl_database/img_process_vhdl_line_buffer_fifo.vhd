----------------------------------------------------------------------------------
-- company: 
-- engineer: 
-- 
-- create date:    13:21:27 10/22/2013 
-- design name: 
-- module name:    fifo - behavioral 
-- project name: 
-- target devices: 
-- tool versions: 
-- description: 
--
-- dependencies: 
--
-- revision: 
-- revision 0.01 - file created
-- additional comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

-- uncomment the following library declaration if using
-- arithmetic functions with signed or unsigned values
--use ieee.numeric_std.all;

-- uncomment the following library declaration if instantiating
-- any xilinx primitives in this code.
--library unisim;
--use unisim.vcomponents.all;

entity fifo is
generic(
	constant data_width	:integer := 8;
	constant addr_cnt	:integer := 20;
	constant fifo_depth	:integer := 320
);
	port (	clk	: in std_logic;
			rst	: in std_logic;
			we  : in std_logic;
			re	: in std_logic;
			addr_head  : out std_logic_vector(addr_cnt - 1 downto 0);
			addr_tail  : out std_logic_vector(addr_cnt - 1 downto 0);
			din : in std_logic_vector(data_width -1 downto 0);
			dout  : out std_logic_vector(data_width -1 downto 0);
			empty	: out std_logic;
			full	: out std_logic
	);
end fifo;

architecture behavioral of fifo is
	type ram_type is array (fifo_depth - 1 downto 0) of std_logic_vector (data_width -1 downto 0);
    signal fifo : ram_type;
	signal s_empty	: std_logic := '0';
	signal s_full	: std_logic := '0';
	
begin
	
	empty <= s_empty;
	full <= s_full;
	
    process (clk)	
		variable head : natural range 0 to fifo_depth - 1 := 0;
		variable tail : natural range 0 to fifo_depth - 1 := 0;
		variable looped : boolean;
		
		
    begin
		addr_head <= conv_std_logic_vector(head, addr_cnt);
		addr_tail <= conv_std_logic_vector(tail, addr_cnt);
		
		if rising_edge(clk) then
			if rst = '0' then
				head := 0;
				tail := 0;
				looped := false;
				s_full <= '0';
				s_empty <= '1';
				dout <= (others => '0');
			else
				if(re = '1') then
					if(looped = true) or (head /= tail) then
						dout <= fifo(tail);
						if(tail = fifo_depth - 1) then
							tail := 0;
							looped := false;
						else
							tail := tail + 1;
						end if;
					end if;
				end if;
				
				if(we = '1') then
					if(looped = false) or (head /= tail) then
						fifo(head) <= din;
						if(head = fifo_depth -1) then
							head := 0;
							looped := true;
						else
							head := head + 1;
						end if;
					end if;				
				end if;
				
				if(head = tail) then
					if  looped then
						s_full <= '1';
					else
						s_empty <= '1';
					end if;
				else
					s_empty <= '0';
					s_full <= '0';
				end if;
			end if;
		end if; 
    end process;
end behavioral;

