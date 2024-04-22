----------------------------------------------------------------------------------
-- Description: ready the commands to the OV7670 over an I2C-like interface

-- Purpose: transfer intialized registers to the camera
-- Possibly could be directly transfered into VGA, WIP with correct HREF and clock settings
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sccb is
  Port ( iclk   : in  STD_LOGIC;    
	 siod  : inout  STD_LOGIC;
	 sioc  : out  STD_LOGIC;
	 busystate : out  STD_LOGIC;
	 ready  : in  STD_LOGIC;
	 cam_address    : in  STD_LOGIC_VECTOR (7 downto 0);
	 regid   : in  STD_LOGIC_VECTOR (7 downto 0);
	 regdata : in  STD_LOGIC_VECTOR (7 downto 0));
end sccb;

architecture Behavioral of sccb is

  signal   counter  : unsigned (7 downto 0) := "00000001"; -- this regdata gives a 254 cycle pause before the initial frame is sent
  signal   scl_line  : std_logic_vector(40 downto 0) := (others => '0'); -- Virtual clock line
  signal   sda_line  : std_logic_vector(40 downto 0) := (others => '1'); -- Packed data line

begin
  process(scl_line, sda_line(31))
  begin
    --if read = '0' then
    if scl_line(20 downto 19) = "10" or 
    scl_line(29 downto 28) = "10" or 
    scl_line(38 downto 37) = "10"  then
      siod <= 'Z';
    else
      siod <= sda_line(40);
    end if;
  --else
  --if scl_line(11 downto 10) = "10" or 
  --scl_line(20 downto 19) = "10" or 
  --scl_line(29 downto 28) = "10"  then
  --siod <= 'Z';

  --elsif scl_line(37) = '1' and scl_line(29) = '0' then --a read
  --data <= data( 6 downto 0 ) & siod;
  --else
  --siod <= sda_line(40);
  --end if;
  --end if;
  end process;

  process(iclk)
  begin
    if rising_edge(iclk) then
      busystate <= '0';  -- not sending.
      if scl_line(40) = '0' then
	SIOC <= '1'; -- Idles on High
	if ready = '1' then -- Size : 32. 9 bits a send. 100 start, 01 end.
	  if counter = "00000000" then 

	    --if read = '0' then
	    -- 3 + 9 + 9 + 9 + 2 = 32
	    sda_line <= "100" & cam_address & '0' & regid     & '0' & regdata    & "001" & "111111111";
	    scl_line <= "111" & "11111111"  & '1' &"11111111" & '1' & "11111111" & "111" & "000000000";
	    -- else
	    ---- 3 + 9 + 9 + 9 + 8 + 1 + 2 = 41
	    --sda_line <= "100" & cam_address & '0' & regid & '0' & cam_address & '0' & "00000000" & '1' & "01" ;
	    --scl_line <= (others => '1') ; 
	    --end if;
	    busystate <= '1';
	  else
	    counter <= counter+1; -- Will only ever get here at startup.
	  end if;
	end if;
      else
	  --if read = '0' then
	case scl_line(40 downto 38) & scl_line(11 downto 9) is
	  when "111"&"111" =>  -- "Begin transmission"
	    SIOC <= '1';
	  when "111"&"110" => 
	    SIOC <= '1';
	  when "111"&"100" => -- Start Bring SIOC low ... for the entire period. 
	    SIOC <= '0';

	  when "110"&"000" =>  --Ending sequence #1, bring it low for 1/4, high 3/4
	    case counter(7 downto 6) is
	      when "00"   => SIOC <= '0';
	      when "01"   => SIOC <= '1';
	      when "10"   => SIOC <= '1';
	      when others => SIOC <= '1';
	    end case;

	  when "100"&"000" => -- Ending sequence #2, SIOD must go high here.
	    SIOC <= '1';
	  when "000"&"000" => 
	    SIOC <= '1';

	  when others      => --50% duty cycle while D7:D0 is being sent
	    case counter(7 downto 6) is
	      when "00"   => SIOC <= '0';
	      when "01"   => SIOC <= '1';
	      when "10"   => SIOC <= '1';
	      when others => SIOC <= '0';
	    end case;
	end case;   

	if counter = "11111111" then
	  scl_line <= scl_line(39 downto 0) & '0';
	  sda_line <= sda_line(39 downto 0) & '1';
	  counter <= (others => '0');
	else
	  counter <= counter+1;
	end if;

	--else -- read
	--case scl_line(40 downto 38) & scl_line(2 downto 0) is

	---- "Begin transmission"
	---- SIOC on HIGH, until SIOD startbit
	--when "111"&"111" => 
	--SIOC <= '1';
	--when "111"&"110" => 
	--SIOC <= '1';

	---- Start the ready ( for data ). Bring SIOD on low.
	---- Bring SIOC low ... for the entire period. 
	--when "111"&"100" =>
	--SIOC <= '0';

	----Ending sequence #1, bring it low for 64, high 192
	---- Or high for an extra 1/4 duty, compared to 50%.
	---- SIOD must be low during this.
	--when "110"&"000" =>
	--case counter(7 downto 6) is
	--when "00"   => SIOC <= '0';
	--when "01"   => SIOC <= '1';
	--when "10"   => SIOC <= '1';
	--when others => SIOC <= '1';
	--end case;

	---- Ending sequence #2 
	---- Go back to idling.
	---- SIOD must go high here.
	--when "100"&"000" => 
	--SIOC <= '1';
	--when "000"&"000" => -- Idle
	--SIOC <= '1';

	----Everything in between is 50% duty cycle while D7:D0 is being sent
	--when others      => 
	--case counter(7 downto 6) is
	--when "00"   => SIOC <= '0';
	--when "01"   => SIOC <= '1';
	--when "10"   => SIOC <= '1';
	--when others => SIOC <= '0';
	--end case;
	--end case;   
	--end if; -- read

	---- Every 256 count ( implied 256 cycles )
	---- Concatenate the scl_line-1 bits (all 1s)  + 0 (idle on low)
	---- Concatenate the sda_line-1 bits + 1; (idle on high)
	--if counter = "1111111" then
	--scl_line <= scl_line(39 downto 0) & '0';
	--sda_line <= sda_line(39 downto 0) & '1';
	--counter <= (others => '0'); -- reset back to 0
	--else
	--counter <= counter+1; --increment counter.
	--end if;

	--end if; --scl high

      end if;
    end if;
  end process;
end Behavioral;
