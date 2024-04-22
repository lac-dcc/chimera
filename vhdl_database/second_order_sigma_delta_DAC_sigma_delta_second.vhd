library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sigma_delta_second is
   Port ( clk   : in  STD_LOGIC;
       i     : in  STD_LOGIC_VECTOR (15 downto 0);
       reset : in  STD_LOGIC;
       ce    : in  STD_LOGIC;
       o     : out STD_LOGIC);
end sigma_delta_second;

architecture Behavioral of sigma_delta_second is
    signal dac_out          : std_logic           := '0';
    signal dac_accum1       : signed(19 downto 0) := (others => '0');
    signal dac_accum2       : signed(19 downto 0) := (others => '0');
    signal dac_feedback     : signed(19 downto 0) := (others => '0');
    begin
    o <= dac_out;
    with dac_out select dac_feedback <= to_signed(-32768,20) when '1',
                                        to_signed( 32768,20) when others;     
dac2_proc: process(clk)
    variable new_val1 : signed(19 downto 0);
    variable new_val2 : signed(19 downto 0);
    begin
        if rising_edge(clk) then 
           if reset = '0' then
              dac_accum1 <= (others => '0');
              dac_accum2 <= (others => '0');
              dac_out <= '0';
           elsif ce = '1' then
               new_val1 := dac_accum1 + signed(i) + dac_feedback;
               new_val2 := dac_accum2 + new_val1  + dac_feedback;
               if new_val2 < 0 then
                  dac_out <= '0';
               else
                  dac_out <= '1';
               end if;
               dac_accum1 <= new_val1;
               dac_accum2 <= new_val2;
          end if;
       end if;
    end process;


end Behavioral;
