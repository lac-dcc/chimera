----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2015 02:46:34 PM
-- Design Name: 
-- Module Name: alu - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( OPa : in STD_LOGIC_VECTOR (31 downto 0);
           OPb : in STD_LOGIC_VECTOR (31 downto 0);
           OpCod : in STD_LOGIC_VECTOR (6 downto 0);
           Res : out STD_LOGIC_VECTOR (31 downto 0)
       );
end alu;

architecture Behavioral of alu is

begin


Res <= (OPa + OPb) when OpCod="0010000" else
       (OPa - OPb) when OpCod="0010001" else
       (OPa and OPb) when OpCod="0010010" else
       (OPa or OPb) when OpCod="0010011" else
       (OPa xor OPb) when OpCod="0010100" else
       (OPa + 1) when OpCod="0010101" else
       (OPa(30 downto 0) & '0') when OpCod="0100000" else
       ('0' & OPa(31 downto 1)) when OpCod="0100001" else
       OPb when OpCod="1010101" else
       Opa;

end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity alu_c is
    Port ( 
           clock : in std_logic;
           reset : in std_logic;
           OPa : in STD_LOGIC_VECTOR (31 downto 0);
           OPb : in STD_LOGIC_VECTOR (31 downto 0);
           OpCod : in STD_LOGIC_VECTOR (6 downto 0);
           Res : out STD_LOGIC_VECTOR (31 downto 0)
       );
end alu_c;

architecture Behavioral of alu_c is
signal sRes:STD_LOGIC_VECTOR (31 downto 0);
begin

process (clock)
    begin
        if (rising_edge(clock)) then
            if (reset = '1') then
                Res <= (others => '0');
            else
                Res <= sRes;
            end if;
        end if;
end process;

ALU1a: entity work.alu port map(OPa,OPb,OpCod,sRes);

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity mux3 is
    Port ( 
           I1 : in STD_LOGIC_VECTOR (31 downto 0);
           I2 : in STD_LOGIC_VECTOR (31 downto 0);
           I3 : in STD_LOGIC_VECTOR (31 downto 0);
           I4 : in STD_LOGIC_VECTOR (31 downto 0);
           I5 : in STD_LOGIC_VECTOR (31 downto 0);
           I6 : in STD_LOGIC_VECTOR (31 downto 0);
           I7 : in STD_LOGIC_VECTOR (31 downto 0);
           I8 : in STD_LOGIC_VECTOR (31 downto 0);
           Res : out STD_LOGIC_VECTOR (31 downto 0);
           OpCod : in STD_LOGIC_VECTOR (2 downto 0)
           );
end mux3;

architecture Behavioral of mux3 is
begin

Res <=  I1 when OpCod="000" else 
        I2 when OpCod="001" else
        I3 when OpCod="010" else
        I4 when OpCod="011" else
        I5 when OpCod="100" else
        I6 when OpCod="101" else
        I7 when OpCod="110" else
        I8;

end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity shreg is
    generic (
    clock_cycles: integer :=1;
    data_width  : integer :=8
    );    
    port (
    clk: in std_logic;
    data_in : in std_logic_vector(data_width-1 downto 0); -- Shift register Input
    data_out: out std_logic_vector(data_width-1 downto 0) -- Shift register Output
    );
end shreg;
 
architecture Behavioral of shreg is
type array_slv is array (data_width-1 downto 0) of std_logic_vector(clock_cycles-1 downto 0); 
signal shift_reg : array_slv; 

begin

process (clk)
    begin
       if clk'event and clk='1' then  
       for i in 0 to data_width-1 loop 
                    shift_reg(i)(0) <= data_in(i);
       end loop;
       
       for j in 1 to clock_cycles-1 loop
            for i in 0 to data_width-1 loop 
                shift_reg(i)(j) <= shift_reg(i)(j-1);
            end loop;
       end loop;       
       end if; 
    end process;

process (shift_reg)
begin
   for i in 0 to data_width-1 loop
      data_out(i) <= shift_reg(i)(clock_cycles-1);
   end loop;
end process;


end Behavioral;
