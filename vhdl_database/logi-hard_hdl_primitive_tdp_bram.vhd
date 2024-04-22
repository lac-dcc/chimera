
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;
 
entity tdp_bram is
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
end tdp_bram;


 
architecture rtl of tdp_bram is
		function log2 (val: INTEGER) return natural is
			variable res : natural;
		begin
		  for i in 0 to 31 loop
				if (val <= (2**i)) then
					 res := i;
					 exit;
				end if;
		  end loop;
		  return res;
		end function Log2;
		
	function max(val1: INTEGER; val2: INTEGER) return natural is
		variable res : natural;
		begin
			if val1 > val2 then
				return val1 ;
			end if ;
			return val2 ;
		end function MAX;
		
	function min(val1: INTEGER; val2: INTEGER) return natural is
		variable res : natural;
		begin
			if val1 < val2 then
				return val1 ;
			end if ;
			return val2 ;
		end function min;



	 constant minWidth : integer := min(DATA_A, DATA_B);
	 constant maxWidth : integer := max(DATA_A, DATA_B);
	 constant RATIO : integer := maxWidth / minWidth;
    -- Shared memory
    type mem_type is array ( 2**(max(ADDR_A,ADDR_B))-1 downto 0 ) of std_logic_vector(minWidth-1 downto 0);
    shared variable mem : mem_type;
begin
assert (DATA_B>=DATA_A) report "Port B must be the larger of the two" severity ERROR; 
 
-- Port A
process(a_clk)
begin
    if(a_clk'event and a_clk='1') then
        if(a_wr='1') then
            mem(conv_integer(a_addr)) := a_din;
        end if;
        a_dout <= mem(conv_integer(a_addr));
    end if;
end process;
 
-- Port B
process(b_clk)
begin
    if(b_clk'event and b_clk='1') then
	 for i in 0 to RATIO-1 loop
		  if(b_wr='1') then
				mem(conv_integer(b_addr & std_logic_vector(to_unsigned(i,log2(RATIO))))):= b_din((i+1)*minWidth-1 downto i*minWidth);
        end if;
        b_dout(((i+1)*minWidth)-1 downto i*minWidth) <= mem(conv_integer(b_addr & std_logic_vector(to_unsigned(i,log2(RATIO)))));
	 end loop ;
    end if;
end process;
 
end rtl;
