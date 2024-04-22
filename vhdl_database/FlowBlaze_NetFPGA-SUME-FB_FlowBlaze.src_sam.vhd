----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2015 10:45:46 AM
-- Design Name: 
-- Module Name: sam - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sam32 is
    Port ( --header : in STD_LOGIC_VECTOR (367 downto 0);
           header : in STD_LOGIC_VECTOR;
           offset : in STD_LOGIC_VECTOR (6 downto 0);
           size : in STD_LOGIC_VECTOR (1 downto 0);
           field : out STD_LOGIC_VECTOR (31 downto 0)
           );
           
--attribute max_fanout : integer;
--attribute max_fanout of all: entity is 100;
end sam32;

architecture Behavioral of sam32 is

--nf_datapath_0/openstate156_i/openstate_core_i2/SAM3/offset[1]
-- phys_opt_design -force_replication_on_nets [get_nets net_name]
-- phys_opt_design -fanout_opt_nets [get_nets <list of nets>] 
-- phys_opt_design -fanout_opt
--xcf: set_property MAX_FANOUT 10 [get_nets ena]

signal extended:STD_LOGIC_VECTOR (1023 downto 0);
--signal shifted:STD_LOGIC_VECTOR (31 downto 0);
signal shifted:STD_LOGIC_VECTOR (field'LENGTH-1 downto 0);
signal i:integer:=0;

begin

field    <=  x"000000" & shifted(7 downto 0) when size="00" else
             x"0000" & shifted(15 downto 0) when size="01" else
             x"00" & shifted(23 downto 0) when size="10" else
             shifted; -- when size="11";


extended<=std_logic_vector(resize(unsigned(header),1024));
i<=8*to_integer(unsigned(offset));
--shifted  <= extended(31+i downto i);
shifted  <= extended(field'LENGTH-1+i downto i);

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity sam32_c is
    Port ( 
           clock : in std_logic;
           reset : in std_logic;
           header : in STD_LOGIC_VECTOR;
           offset : in STD_LOGIC_VECTOR (6 downto 0);
           size : in STD_LOGIC_VECTOR (1 downto 0);
           field : out STD_LOGIC_VECTOR (31 downto 0)
       );
end sam32_c;

architecture Behavioral of sam32_c is
signal s_field:STD_LOGIC_VECTOR (31 downto 0);
begin

process (clock)
    begin
        if (rising_edge(clock)) then
            if (reset = '1') then
                field <= (others => '0');
            else
                field <= s_field;
            end if;
        end if;
end process;

Sam321a: entity work.sam32 port map(header,offset,size,s_field);

end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sam64 is
    Port ( --header : in STD_LOGIC_VECTOR (367 downto 0);
           header : in STD_LOGIC_VECTOR;
           offset : in STD_LOGIC_VECTOR (5 downto 0);
           field : out STD_LOGIC_VECTOR (63 downto 0)
           );
end sam64;

architecture Behavioral of sam64 is

signal extended:STD_LOGIC_VECTOR (511 downto 0);
signal i:integer:=0;

begin

extended<=std_logic_vector(resize(unsigned(header),512));
i<=8*to_integer(unsigned(offset));
field  <= extended(field'LENGTH-1+i downto i);

end Behavioral;
