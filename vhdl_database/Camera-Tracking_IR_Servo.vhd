LIBRARY ieee; -- Import logic primitives
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all ;

entity IR_Servo is
	port(
		IRDA_RXD: in std_logic;
		key: in std_logic_vector(0 downto 0);
		CLOCK_50	:IN STD_LOGIC;
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: OUT STD_LOGIC_VECTOR(0 TO 6);	
		EXT_IO: out std_LOGIC_VECTOR(2 downto 0);
		LEDR: out std_LOGIC_VECTOR(2 downto 0)
		);
end IR_Servo;

architecture behav of IR_Servo is 
	component servo is 
		port(clk: in STD_LOGIC;
			Angle: in integer := 100;   -- 1.5 ms
			servo_ctr: out STD_LOGIC
		);
	end component;
	
	component IR_S is 
		port(
			IRDA_RXD: in std_logic;
			reset: in std_logic;
			CLOCK_50	:IN STD_LOGIC;
			ready : out std_logic  ;
			HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: OUT STD_LOGIC_VECTOR(0 TO 6);
			irData: out std_logic_vector(31 downto 0)
			);
	end component;
	
	signal ready: std_logic;
	signal irData: std_logic_vector(31 downto 0);
	signal controlAngleH: integer range 0 to 200 :=100;
	signal controlAngleV: integer range 0 to 200 :=100;
begin 
	infrared: IR_S port map(IRDA_RXD, key(0),CLOCK_50,ready,HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, irData);
	
	process (ready)
      begin 
			if ready='1' then 
				CASE irData(23 downto 16) IS   
					when "00010100"=>
						LEDR(2)<='1';
						LEDR(1)<='0';
						LEDR(0)<='0';
						if controlAngleH<200 then 
							controlAngleH<=controlAngleH+10;  -- clockwise around 10 degrees.
						else 
							controlAngleH<=controlAngleH;
						end if;
					when "00011000"=>
						LEDR(2)<='0';
						LEDR(1)<='1';
						LEDR(0)<='0';
						if controlAngleH>10 then 
							controlAngleH<=controlAngleH-10;  -- counter-clockwise around 10 degrees.
						else 
							controlAngleH<=controlAngleH;
						end if;
					when "00011010"=>
						LEDR(2)<='1';
						LEDR(1)<='0';
						LEDR(0)<='0';
						if controlAngleV<200 then
							controlAngleV<=controlAngleV+10;  -- clockwise around 10 degrees.
						else controlAngleV<=controlAngleV;
						end if;
					when "00011110"=>
						LEDR(2)<='0';
						LEDR(1)<='1';
						LEDR(0)<='0';
						if controlAngleV>10 then 
							controlAngleV<=controlAngleV-10;  -- counter-clockwise around 10 degrees.
						else 
							controlAngleV<=controlAngleV;
						end if;
					when others =>
						LEDR(2)<='0';
						LEDR(1)<='0';
						LEDR(0)<='1';
						controlAngleH<=controlAngleH ; 
						controlAngleV<=controlAngleV ; 
				END CASE;
			end if;
   end process;
	
	irservo: servo port map(CLOCK_50, controlAngleH, EXT_IO(0));
	irservoT: servo port map(CLOCK_50, controlAngleV, EXT_IO(1));
	
end architecture;