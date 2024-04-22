library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity simple_serializer is
    Port ( clk : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           data_out : out  STD_LOGIC;
           gate : in  STD_LOGIC);
end simple_serializer;

architecture Behavioral of simple_serializer is


type state_type is (idle,b1,b2,b3,b4,b5,b6,b7);
signal state_reg, state_next : state_type := idle;

signal data_reg,data_next  : std_logic_vector( 7 downto 0) := (others => '0');

begin


process (clk) begin
    if (clk'event and clk = '1') then
     state_reg <= state_next;
     data_reg <= data_next;
    end if;
end process;


HEADER_FSMD : process(state_reg,gate,data_in,data_reg)
begin

	state_next <= state_reg;
   data_next <= data_reg;
	data_out <= '0';
	   
    case state_reg is 
    
            when idle =>                 

               if (gate = '1') then
                 	data_out <= data_in(0);
                 	data_next <= data_in;    
                 	state_next <= b1;       
          	   end if; 
                             
            when b1 =>
                 	data_out <= data_in(1);   
                 	state_next <= b2;  
            when b2 =>
                 	data_out <= data_in(2);   
                 	state_next <= b3;              
            when b3 =>
                 	data_out <= data_in(3);   
                 	state_next <= b4;  
            when b4 =>
                 	data_out <= data_in(4);   
                 	state_next <= b5;  
            when b5 =>
                 	data_out <= data_in(5);   
                 	state_next <= b6;  
            when b6 =>
                 	data_out <= data_in(6);   
                 	state_next <= b7;  
            when b7 =>
                 	data_out <= data_in(7);   
                 	state_next <= idle;                                 	
    end case; --state_reg

end process; --HEADER_FSMD  
  



end Behavioral;

