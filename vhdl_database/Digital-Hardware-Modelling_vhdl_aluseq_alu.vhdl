library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
  generic( W : natural := 4 );
    port (i_data_a      : in  std_logic_vector(W-1 downto 0); -- input data A
          i_data_b      : in  std_logic_vector(W-1 downto 0); -- input data B
          i_data_carry  : in  std_logic;                      -- carry in or borrow in
          i_ctrl        : in  std_logic_vector(3 downto 0);   -- control signals
          o_data_c      : out std_logic_vector(W-1 downto 0); -- output data C
          o_data_carry  : out std_logic;                      -- carry out or borrow out
          o_data_comp   : out std_logic_vector(1 downto 0)    -- output comparison
        );
end alu;

architecture behavioral of alu is
begin

  comb_memless_process: process ( i_data_a, i_data_b, i_data_carry, i_ctrl )
    variable temp_carry: std_logic_vector(W downto 0) := ( others => '0' );
  begin
    o_data_c <= (others => '0');
    o_data_carry <= '0';
    o_data_comp <= (others => '0');

    case i_ctrl is
      when "0001" =>  -- ripple carry adder: {sum, cout} = a+b+cin               
                      temp_carry(0) := i_data_carry;
                      for i in 0 to W-1 loop
                        -- sum(k) = a(k) xor b(k) xor c(k)
                        o_data_c(i) <= i_data_a(i) xor i_data_b(i) xor temp_carry(i);

                        -- cout(k+1) = a(k).b(k) + b(k).c(k) + c(k).a(k)
                        temp_carry(i+1) := ( i_data_a(i) and i_data_b(i) ) or 
                                           ( i_data_b(i) and temp_carry(i) ) or 
                                           ( temp_carry(i) and i_data_a(i) );
                      end loop;
                      o_data_carry <= temp_carry(W);

      when "0010" =>  -- full subtraction: {diff, bout} = a-b-bin
                      temp_carry(0) := i_data_carry;
                      for i in 0 to W-1 loop
                        -- diff(k) = a(k) xor b(k) xor c(k)
                        o_data_c(i) <= i_data_a(i) xor i_data_b(i) xor temp_carry(i);

                        -- bout(k+1) = !a(k).b(k) + b(k).c(k) + c(k).!a(k)
                        temp_carry(i+1) := ( ( NOT i_data_a(i) ) AND i_data_b(i) ) OR 
                                           ( i_data_b(i) AND temp_carry(i) ) OR 
                                           ( temp_carry(i) AND ( NOT i_data_a(i) ) );
                      end loop;
                      o_data_carry <= temp_carry(W);

      when "0011" =>  -- comparator: comp_out = 1 if A > B
                      if( i_data_a > i_data_b ) then
                        o_data_comp <= "01"; 
                      else
                        o_data_comp <= "00";
                      end if;

      when "0100" =>  -- comparator: comp_out = 1 if A < B
                      if( i_data_a < i_data_b ) then
                        o_data_comp <= "01"; 
                      else
                        o_data_comp <= ( others => '0' ); 
                      end if;

      when "0101" =>  -- comparator: comp_out = 1 if A = B
                      if( i_data_a = i_data_b ) then
                        o_data_comp <= "01"; 
                      else
                        o_data_comp <= ( others => '0' ); 
                      end if;

      when "0110" =>  -- logical right shift A by B[1:0]
                      o_data_c <=  std_logic_vector( unsigned(i_data_a)  srl to_integer( unsigned( i_data_b(1 downto 0) ) ) );

      when "0111" =>  -- logical left shift A by B
                      o_data_c <=  std_logic_vector( unsigned(i_data_a)  sll to_integer( unsigned( i_data_b(1 downto 0) ) ) );

      when others => -- NOP
    end case;
  end process comb_memless_process;

end behavioral;