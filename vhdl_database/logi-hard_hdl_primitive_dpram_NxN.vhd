library IEEE;
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;

entity dpram_NxN is
	generic(SIZE : natural := 64 ; NBIT : natural := 8; ADDR_WIDTH : natural := 6);
	port(
 		clk : in std_logic; 
 		we : in std_logic; 
 		
 		di : in std_logic_vector(NBIT-1 downto 0 ); 
		a	:	in std_logic_vector((ADDR_WIDTH - 1) downto 0 );
 		dpra : in std_logic_vector((ADDR_WIDTH - 1) downto 0 );
		spo : out std_logic_vector(NBIT-1 downto 0 );
		dpo : out std_logic_vector(NBIT-1 downto 0 ) 		
	); 
end dpram_NxN;

architecture behavioral of dpram_NxN is
 
	type ram_type is array (0 to (SIZE - 1)) of std_logic_vector(NBIT-1 downto 0 ); 
	signal RAM : ram_type;
	begin
	
	
   process (clk)
   begin
	  if (clk'event and clk = '1') then
			if (we = '1') then
				 RAM(conv_integer(a)) <= di;
			end if;
			spo <= RAM(conv_integer(a));
			dpo <= RAM(conv_integer(dpra));
	  end if;
   end process;
	


	
end behavioral ;