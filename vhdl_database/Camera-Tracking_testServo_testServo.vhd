library ieee;
use ieee.std_logic_1164.all;

entity testServo is 
	port(clock_50: in STD_LOGIC;
		  key: in std_logic_vector(1 downto 0);
		  EXT_IO: out std_logic_vector(0 downto 0)
	);
end;



architecture behavior of testServo is 

	signal pan_angle: integer;

	component servo is 
		port(clk: in STD_LOGIC;
			Angle: in integer := 100;   -- 1.5 ms
			servo_ctr: out STD_LOGIC
		);
	end component;
	
begin
	process(KEY(0),key(1))
	begin
     if (KEY(0)='0') then
         pan_angle <= pan_angle + 2;
	  elsif (key(1)='0') then 
			pan_angle <= pan_angle - 2;
     end if;
	end process;
	

pan_Servo: servo port map(clk=>clock_50,Angle=>pan_angle,servo_ctr=>EXT_IO(0));

end behavior;