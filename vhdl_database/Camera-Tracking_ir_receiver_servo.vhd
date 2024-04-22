LIBRARY ieee; -- Import logic primitives
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all ;

entity ir_receiver_servo is 
  port ( 
			IRDA_RXD: in std_logic;
			reset: in std_logic;
			CLOCK_50: in std_logic;
			--Display the information about CUSTOM CODE bits __HEX7-HEX4
			--and KEY CODE bits __HEX3-HEX0
			data_ready : out std_logic ;
			oData: out std_logic_vector(31 downto 0));
end entity;

architecture behaviour of ir_receiver_servo is
--All the constant I will use:
	constant data2idleThreshold: integer:=262143; --5.24ms
	constant idle2guidanceThreshold: integer:=230000; --4.6ms
	constant guidance2datareadThreshold: integer:=210000; --4.2ms
	constant data_high_duration: integer:=41500; --0.83ms
--All the signals I need to use:
	type count_state is (idle, guidance, dataread);--Once detect the LEAD CODE transfer idle to guidance, Detect the CUSTOM CODE transfer guidance to dataread.
	signal state : count_state;
	--The signals to determine the time to switch state
	signal idle_count_flag: std_logic;
	signal guidance_count_flag: std_logic;
	signal dataread_count_flag: std_logic;
	
	signal idle_count: integer;
	signal guidance_count: integer;
	signal dataread_count: integer;
----------------------------------------
	signal bitcount: integer := 0;  --range 0 to 34 
----------------------------------------
	signal data_ready_flag: std_logic;
	signal data: std_logic_vector(31 downto 0);
	signal data_buffer: std_logic_vector(31 downto 0);

	
begin 
--Count the idle_count preparing for state changes from idle to guidance
	process(CLOCK_50, reset)
	begin
		if (reset='0') then 
			idle_count<=0;
		elsif rising_edge(CLOCK_50) then 
			if idle_count_flag='1' then 
				idle_count<=idle_count+1;
			else 
				idle_count<=0;
			end if;
		end if;
	end process;
	
	process(CLOCK_50, reset)
	begin 
		if (reset='0') then 
			idle_count_flag<='0';
		elsif rising_edge(CLOCK_50) then
			if (state=idle and IRDA_RXD='0') then 
				idle_count_flag<='1';
			else 
				idle_count_flag<='0';
			end if;
		end if;
	end process;
	
--Count the guidance_count preparing for state changes from guidance to dataread
	process(CLOCK_50, reset)
	begin
		if (reset='0') then 
			guidance_count<=0;
	    elsif rising_edge(CLOCK_50) then
			if guidance_count_flag='1' then 
				guidance_count<=guidance_count+1;
			else 
				guidance_count<=0;
			end if;
		end if;
	end process;
	
	process(CLOCK_50, reset)
	begin
		if (reset='0') then 
			guidance_count_flag<='0';
		elsif rising_edge(CLOCK_50) then  
			if (state=guidance and IRDA_RXD='1') then 
				guidance_count_flag<='1';
			else 
				guidance_count_flag<='0';
			end if;
		end if;
	end process;
	
--Count the dataread_count preparing for state changes from dataread to idle
	process(CLOCK_50, reset)
	begin
		if (reset='0') then 
			dataread_count<=0;
		elsif rising_edge(CLOCK_50) then  
			if dataread_count_flag='1' then 
				dataread_count<=dataread_count+1;
			else 
				dataread_count<=0;
			end if;
		end if;
	end process;
	
	process(CLOCK_50, reset)
	begin 
		if (reset='0') then 
			dataread_count_flag<='0';
		elsif rising_edge(CLOCK_50) then
			if (state=dataread and IRDA_RXD='1') then 
				dataread_count_flag<='1';
			else 
				dataread_count_flag<='0';
			end if;
		end if;
	end process;
	
--The bitcount to get the info of the bit we have already handled.
	process(CLOCK_50, reset)
	begin
		if reset='0' then 
			bitcount<=0;
		elsif rising_edge(CLOCK_50) then 
			if state=dataread then 
				if (dataread_count=20000) then 
					bitcount<=bitcount+1;
				end if;
			else 
				bitcount<=0;
			end if;
		end if;
	end process;
	
--State changes between IDLE, GUIdance, DATaread	
	process(state, CLOCK_50)
	begin 
		 --First time forget to add reset!
			if reset='0' then
				state<=idle;
			elsif (rising_edge(CLOCK_50)) then
				case state is
					when 
						idle=>
							if (idle_count>idle2guidanceThreshold) then 
								state<=guidance;
							end if;
					when 
						guidance=>
							if (guidance_count>guidance2datareadThreshold) then
								state<=dataread;
							end if;
					when 
						dataread=>
							if ((bitcount>=33) or (dataread_count>=data2idleThreshold)) then        
								state<=idle;	
							end if;
					when others =>	
						state <= idle ;
				end case;
			end if;
	end process;
	

--In the dataread state, to distinguish whether the emitted signal is 0 or 1;
--Shift register function;
	process(CLOCK_50, reset)
	begin
		if (reset='0') then 
			data<= (others=>'0');
		elsif rising_edge(CLOCK_50) then
			if state=dataread then
				if (dataread_count>=data_high_duration) then 
					data(bitcount-1)<='1';
				end if;
			else 
				data<=(others=>'0');
			end if;
		end if;
	end process;
	 				
--Check and Set the data_ready_flag 													
	process(CLOCK_50, reset)                        --bit count is a problem;
	begin 
		if (reset='0') then 
			data_ready_flag<='0';
		elsif rising_edge(CLOCK_50) then 
			if bitcount=32 then
				if (data(31 downto 24)=(not data(23 downto 16))) then 
					data_buffer<=data;
					--odata<=data_buffer;
					data_ready_flag<='1';
				--else 
					--data_ready_flag<='0';
					--if reset ='0' then 
					--	odata<=(others=> '0');
					--end if;
				end if;
			else 
				data_ready_flag<='0';
			end if;
		end if;
	end process;
	
--Read data
	process(CLOCK_50, reset)
	begin
		if reset ='0' then 
			odata<=(others=> '0');
		elsif rising_edge(CLOCK_50) then
				
			if data_ready_flag='1' then			--     data_ready_flag is a big problem
				odata<=data_buffer;
				if (state=idle) then 
					odata<=(others =>'0');
				end if;
				--odata(23 downto 0) <= data_buffer(23 downto 0);
				--if(state = idle) then 
				--	odata(31 downto 24) <= "00010001";
			--	elsif (state = guidance) then
				--	odata(31 downto 24) <= "00100010"; 
				--else
				--	odata(31 downto 24) <= "00110011";
				--end if;
			end if;
		end if;
	end process;
data_ready <= data_ready_flag ;
end behaviour;


		
