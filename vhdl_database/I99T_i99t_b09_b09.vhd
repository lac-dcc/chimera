entity b09 is port (
			reset,clock: in bit;
			x: in bit;
			y: out bit
		);
end b09;


architecture BEHAV of b09 is

  constant Bit_start : bit := '1';
  constant Bit_stop : bit := '0';
  constant Bit_idle : bit := '0';
  constant Zero_8 : bit_vector ( 7 downto 0) := "00000000";
  constant Zero_9 : bit_vector ( 8 downto 0) := "000000000";

  signal d_in:  bit_vector ( 8 downto 0);          
  signal d_out: bit_vector ( 7 downto 0);
  signal old: bit_vector ( 7 downto 0);

  begin

  process(clock,reset)

  variable stato: integer range 3 downto 0;
  constant INIT : integer := 0;
  constant RECEIVE : integer := 1;
  constant EXECUTE : integer := 2;
  constant LOAD_OLD : integer := 3;

  begin

  if    reset = '1' then
		stato := INIT;
		d_in <= Zero_9;   
		d_out <= Zero_8;  
		old <= Zero_8;  
		y <= Bit_idle;  

  elsif clock'event and clock='1' then
	case stato is

	when INIT
	=>      stato := RECEIVE;
		d_in <= Zero_9;   
		d_out <= Zero_8;  
		old <= Zero_8;  
		y <= Bit_idle;  


	when RECEIVE 
	=>      if  d_in(0) = Bit_start	then   
			old <= d_in(8 downto 1);  
			y <= Bit_start;
			d_out <= d_in(8 downto 1);
			d_in <= Bit_start & Zero_8;
			stato := EXECUTE;
		else    
			d_in <= x & d_in(8 downto 1);
			stato := RECEIVE;
		end if;


	when EXECUTE  
	=>      if  d_in(0) = Bit_start	then
			y <= Bit_stop;
			stato := LOAD_OLD;
		else  
			d_out <= Bit_idle & d_out(7 downto 1);
			y <= d_out(0);
			stato := EXECUTE;
		end if;
		d_in <= x & d_in(8 downto 1);


	when LOAD_OLD
	=>  if  d_in(0) = Bit_start
		then 
			if  d_in(8 downto 1) = old then   
				d_in <= Zero_9;
				y <= Bit_idle;
				stato := LOAD_OLD;
			else    
				y <= Bit_start;
				d_out <= d_in(8 downto 1);
				d_in <= Bit_start & Zero_8;
				stato := EXECUTE;
			end if;
			old <= d_in(8 downto 1);
		else    
			d_in <= x & d_in(8 downto 1);
			y <= Bit_idle;   
			stato := LOAD_OLD;

		end if;
	
	end case;
  end if;
  end process;
end BEHAV;



