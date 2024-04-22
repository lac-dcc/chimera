library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
	generic( N : natural := 4 );
    port (in_data_a			: in 	std_logic_vector(N-1 downto 0);		-- input data A
    	  in_data_b			: in 	std_logic_vector(N-1 downto 0);		-- input data B
    	  in_data_carry		: in 	std_logic;							-- carry in or borrow in
    	  in_ctrl			: in 	std_logic_vector(2 downto 0);		-- control signals
    	  out_data_c		: out 	std_logic_vector(N-1 downto 0);		-- output data C
    	  out_data_carry	: out 	std_logic;							-- carry out or borrow out
    	  out_data_comp		: out 	std_logic_vector(1 downto 0)		-- output comparison
    	  );
end top;

architecture behavioral of top is
	
begin
	comb_memless_process: process ( in_data_a, in_data_b, in_data_carry, in_ctrl )
		variable temp_carry: std_logic_vector(N downto 0) := ( others => '0' );
		variable temp_b: std_logic_vector( N-1 downto 0 ) := ( others => '0' );
	begin
		out_data_c <= (others => '0');
		out_data_carry <= '0';
		out_data_comp <= (others => '0');

		case in_ctrl is
			when "000"	=> 	out_data_c <= in_data_a;
						   	out_data_carry <= in_data_carry;

			when "001"	=> 	-- ripple carry adder: {sum, cout} = a+b+cin
						   
						   	temp_carry(0) := in_data_carry;
						   	for i in 0 to N-1 loop
						   		-- sum(k) = a(k) xor b(k) xor c(k)
						   		out_data_c(i) <= in_data_a(i) xor in_data_b(i) xor temp_carry(i);

							    -- cout(k+1) = a(k).b(k) + b(k).c(k) + c(k).a(k)
						   		temp_carry(i+1) := ( in_data_a(i) and in_data_b(i) ) or 
						   						   ( in_data_b(i) and temp_carry(i) ) or 
						   						   ( temp_carry(i) and in_data_a(i) );
						   	end loop;
						   	out_data_carry <= temp_carry(N);

							--sum := signed('0' & in_data_a) + signed('0' & in_data_b) + signed( in_data_carry );
						   	--out_data_c <= std_logic_vector( sum(N-1 downto 0) );
						   	--out_data_carry <= sum(N);

			when "010"	=> 	-- full subtraction: {diff, bout} = a-b-bin
							temp_carry(0) := in_data_carry;
						   	for i in 0 to N-1 loop
						   		-- diff(k) = a(k) xor b(k) xor c(k)
						   		out_data_c(i) <= in_data_a(i) xor in_data_b(i) xor temp_carry(i);

							    -- bout(k+1) = !a(k).b(k) + b(k).c(k) + c(k).!a(k)
						   		temp_carry(i+1) := ( ( NOT in_data_a(i) ) AND in_data_b(i) ) OR 
						   						   ( in_data_b(i) AND temp_carry(i) ) OR 
						   						   ( temp_carry(i) AND ( NOT in_data_a(i) ) );
						   	end loop;
						   	out_data_carry <= temp_carry(N);

						   	-- 2's complement of n-bits data B (1's complement + 1)
						   	--temp_b := std_logic_vector( unsigned( NOT in_data_b ) + 1 );
						   
						   	-- 2's complement of single bit is same single bit
						   	--temp_carry(0) := in_data_carry;
						   	--for i in 0 to N-1 loop
						   	--		out_data_c(i) := in_data_a(i) xor temp_b(i) xor temp_carry(i);
						   	--		temp_carry(i+1) := ( in_data_a(i) and temp_b(i) ) or 
						   	--						   ( temp_b(i) and temp_carry(i) ) or 
						   	--						   ( temp_carry(i) and in_data_a(i) );
						   	--end loop;
						   	--out_data_carry <= temp_carry(N);

			when "011"	=> 	-- comparator: comp_out = 1 if A > B
						   	if( in_data_a > in_data_b ) then
						   		out_data_comp <= "01"; 
						   	else
						   		out_data_comp <= "00";
						   	end if;

			when "100"	=> 	-- comparator: comp_out = 1 if A < B
						   	if( in_data_a < in_data_b ) then
						   		out_data_comp <= "01"; 
						   	else
						   		out_data_comp <= ( others => '0' ); 
						   	end if;

			when "101"	=> -- comparator: comp_out = 1 if A = B
						   	if( in_data_a = in_data_b ) then
						   		out_data_comp <= "01"; 
						   	else
						   		out_data_comp <= ( others => '0' ); 
						   	end if;

			when "110"	=> -- logical right shift A by B[1:0]
						   out_data_c <=  std_logic_vector( unsigned(in_data_a)  srl to_integer( unsigned( in_data_b(1 downto 0) ) ) );

			when "111"	=> -- logical left shift A by B
						   out_data_c <=  std_logic_vector( unsigned(in_data_a)  sll to_integer( unsigned( in_data_b(1 downto 0) ) ) );

			when others => -- nothing to be done
		end case;
	end process comb_memless_process;

end behavioral;