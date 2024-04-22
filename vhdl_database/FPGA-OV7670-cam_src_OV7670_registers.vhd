----------------------------------------------------------------------------------
-- Register settings
-- Purpose: Load register values before sending.
--------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity OV7670_registers is
  Port ( iclk      : in  STD_LOGIC;
	 gostate	    : in  STD_LOGIC;
	 sw : in std_logic_vector(9 downto 0);
	 key : in std_logic_vector(2 downto 0);
	 regs	    : out  std_logic_vector(15 downto 0);
	 reg_loaded  : out  STD_LOGIC
       );
end OV7670_registers;

architecture Behavioral of OV7670_registers is
  COMPONENT debounce PORT
    (
      clk : IN std_logic;
      i : IN std_logic;          
      o : OUT std_logic
    );
  END COMPONENT;

  signal sreg	  : std_logic_vector(15 downto 0);
  signal nextRegAddr : std_logic_vector(7 downto 0) := (others => '0');

  constant write_address : std_logic_vector(7 downto 0) := x"42";
  constant read_address : std_logic_vector( 7 downto 0 ) := x"43"; 

  signal test2 : std_logic_vector(15 downto 0);
  signal test3 : std_logic_vector(15 downto 0);
  signal test4 : std_logic_vector(15 downto 0);
  signal test5 : std_logic_vector(15 downto 0);
  signal fps_reg : std_logic_vector(15 downto 0) := x"6b4a";
  signal colour_reg : std_logic_vector(15 downto 0) := x"1204";
  signal resend   :  STD_LOGIC; --resend registers
  signal survmode : std_logic;
begin

  b1 : debounce PORT MAP
  (
    clk => iclk,
    i   => key(2),
    o   => resend
  );

  regs <= sreg;
  with sreg select reg_loaded  <= '1' when x"FFFF", '0' when others;
  with sw(0) select colour_reg <= x"1200" when '1', x"1204" when others;
  with sw(1) select fps_reg <= x"6bca" when '1', x"6b4a" when others;
  with sw(2) select test2<= x"4fff" when '1', x"4fb3" when others;
  with sw(3) select test3<= x"50ff" when '1', x"50b3" when others;
  with sw(4) select test4<= x"51ff" when '1', x"5100" when others;
  with sw(7) select survmode <= '1' when '1', '0' when others;

  process(iclk)
  begin
    if rising_edge(iclk) then
      if gostate = '1' then
	--Ready for the next item.
	nextRegAddr <= std_logic_vector(unsigned(nextRegAddr)+1);
      elsif resend = '1' then 
	nextRegAddr <= (others => '0');
      end if;

      if survmode = '0' then
	case nextRegAddr is
	  when x"00" => sreg <= x"1280"; -- COM7   Reset -- Do it twice to make sure its wiped
	  when x"01" => sreg <= x"1280"; -- COM7   Reset -- choose output format. 
	  when x"02" => sreg <= x"1101"; -- CLKRC  Prescaler then multiplied by 4 for 25mhz. 30fps.
	  when x"03" => sreg <= colour_reg; -- COM7   VGA + RGB output
	  when x"04" => sreg <= x"0C04"; -- COM3  Lots of stuff, enable scaling, all others off
	  when x"05" => sreg <= x"3E19"; -- COM14  PCLK scaling = 2 when x"05" => sreg <= x"3E00"; -- COM14  PCLK scaling = 0
	  when x"06" => sreg <= x"4010" ; -- COM15  Full 0-255 output, RGB 565
	  when x"07" => sreg <= x"3a04"; -- TSLB   Set UV ordering,  do not auto-reset window
	  --when x"08" => sreg <= x"8C00"; -- RGB444 Set RGB format -- must be low for rgb 565 to work
	  when x"08" => sreg <= x"8C02"; -- RGB444 
	  when x"09" => sreg <= x"1714"; -- HSTART HREF start (high 8 bits)
	  when x"0a" => sreg <= x"1802"; -- HSTOP  HREF stop (high 8 bits)
	  when x"0b" => sreg <= x"32A4"; -- HREF   Edge offset and low 3 bits of HSTART and HSTOP
	  when x"0c" => sreg <= x"1903"; -- VSTART VSYNC start (high 8 bits)
	  when x"0d" => sreg <= x"1A7b"; -- VSTOP  VSYNC stop (high 8 bits) 
	  when x"0e" => sreg <= x"038a"; -- VREF   VSYNC low two bits
	  when x"0f" => sreg <= x"703a"; -- SCALING_XSC -- default value. HScale. Can have test pattern.
	  when x"10" => sreg <= x"7135"; -- SCALING_YSC -- default value. VScale. Can have test pattern.
	  when x"11" => sreg <= x"7211"; -- SCALING_DCWCTR -- default value. H down sample by 8.
	  when x"12" => sreg <= x"7301"; -- SCALING_PCLK_DIV -- default: 00. lowerbit = COM14. Prescale by 2.
	  when x"13" => sreg <= x"a200"; -- SCALING_PCLK_DELAY  PCLK scaling = 4, must match COM14

	  when x"14" => sreg <= x"1438"; -- COM9  - AGC Celling
	  when x"15" => sreg <= test2; -- MTX1  - colour conversion matrix
	  when x"16" => sreg <= test3; -- MTX2  - colour conversion matrix
	  when x"17" => sreg <= test4; -- MTX3  - colour conversion matrix
	  --when x"15" => sreg <= x"4fb3"; -- MTX1  - colour conversion matrix
	  --when x"16" => sreg <= x"50b3"; -- MTX2  - colour conversion matrix
	  --when x"17" => sreg <= x"5100"; -- MTX3  - colour conversion matrix
	  when x"18" => sreg <= x"523d"; -- MTX4  - colour conversion matrix
	  when x"19" => sreg <= x"53a7"; -- MTX5  - colour conversion matrix
	  when x"1A" => sreg <= x"54e4"; -- MTX6  - colour conversion matrix
	  --when x"18" => sreg <= x"52" & test2; -- MTX4  - colour conversion matrix
	  --when x"19" => sreg <= x"53" & test3; -- MTX5  - colour conversion matrix
	  --when x"1A" => sreg <= x"54" & test4; -- MTX6  - colour conversion matrix
	  when x"1B" => sreg <= x"589e"; -- MTXS  - Matrix sign and auto contrast
	  when x"1C" => sreg <= fps_reg; -- DBLV input clock
	  when x"1d" => sreg <= x"3dc0"; -- COM13 - Turn on GAMMA and UV Auto adjust
	  --when x"1e" => sreg <= x"1500"; -- COM10 Use HREF not hSYNC


	  when others => sreg <= x"ffff";
	--case nextRegAddr is
	--when x"1E" => cam_address <= READ_ADDRESS;
	--when others => cam_address <= WRITE_ADDRESS;
	--end case;
	end case;

      else 
	case nextRegAddr is
	  when x"00" => sreg <= x"1280"; -- COM7   Reset -- Do it twice to make sure its wiped
	  when x"01" => sreg <= x"1280"; -- COM7   Reset -- choose output format. 
	  when x"02" => sreg <= x"1101"; -- CLKRC  Prescaler then multiplied by 4 for 25mhz. 30fps.
	  when x"03" => sreg <= colour_reg; -- COM7   VGA + RGB output
	  when x"04" => sreg <= x"0C04"; -- COM3  Lots of stuff, enable scaling, all others off
	  when x"05" => sreg <= x"3E19"; -- COM14  PCLK scaling = 2 when x"05" => sreg <= x"3E00"; -- COM14  PCLK scaling = 0
	  when x"06" => sreg <= x"4010" ; -- COM15  Full 0-255 output, RGB 565
	  when x"07" => sreg <= x"3a04"; -- TSLB   Set UV ordering,  do not auto-reset window
	  --when x"08" => sreg <= x"8C00"; -- RGB444 Set RGB format -- must be low for rgb 565 to work
	  when x"08" => sreg <= x"8C02"; -- RGB444 
	  when x"09" => sreg <= x"1714"; -- HSTART HREF start (high 8 bits)
	  when x"0a" => sreg <= x"1802"; -- HSTOP  HREF stop (high 8 bits)
	  when x"0b" => sreg <= x"32A4"; -- HREF   Edge offset and low 3 bits of HSTART and HSTOP
	  when x"0c" => sreg <= x"1903"; -- VSTART VSYNC start (high 8 bits)
	  when x"0d" => sreg <= x"1A7b"; -- VSTOP  VSYNC stop (high 8 bits) 
	  when x"0e" => sreg <= x"038a"; -- VREF   VSYNC low two bits
	  when x"0f" => sreg <= x"703a"; -- SCALING_XSC -- default value. HScale. Can have test pattern.
	  when x"10" => sreg <= x"7135"; -- SCALING_YSC -- default value. VScale. Can have test pattern.
	  when x"11" => sreg <= x"7211"; -- SCALING_DCWCTR -- default value. H down sample by 8.
	  when x"12" => sreg <= x"7301"; -- SCALING_PCLK_DIV -- default: 00. lowerbit = COM14. Prescale by 2.
	  when x"13" => sreg <= x"a200"; -- SCALING_PCLK_DELAY  PCLK scaling = 4, must match COM14

	  when x"14" => sreg <= x"1438"; -- COM9  - AGC Celling
	  when x"15" => sreg <= test2; -- MTX1  - colour conversion matrix
	  when x"16" => sreg <= test3; -- MTX2  - colour conversion matrix
	  when x"17" => sreg <= test4; -- MTX3  - colour conversion matrix
	  --when x"15" => sreg <= x"4fb3"; -- MTX1  - colour conversion matrix
	  --when x"16" => sreg <= x"50b3"; -- MTX2  - colour conversion matrix
	  --when x"17" => sreg <= x"5100"; -- MTX3  - colour conversion matrix
	  when x"18" => sreg <= x"523d"; -- MTX4  - colour conversion matrix
	  when x"19" => sreg <= x"53a7"; -- MTX5  - colour conversion matrix
	  when x"1A" => sreg <= x"54e4"; -- MTX6  - colour conversion matrix
	  --when x"18" => sreg <= x"52" & test2; -- MTX4  - colour conversion matrix
	  --when x"19" => sreg <= x"53" & test3; -- MTX5  - colour conversion matrix
	  --when x"1A" => sreg <= x"54" & test4; -- MTX6  - colour conversion matrix
	  when x"1B" => sreg <= x"589e"; -- MTXS  - Matrix sign and auto contrast
	  when x"1C" => sreg <= fps_reg; -- DBLV input clock
	  when x"1d" => sreg <= x"1500"; -- COM10 Use HREF not hSYNC

	  when x"1e" => sreg <= x"7a20"; -- SLOP
	  when x"1f" => sreg <= x"7b10"; -- GAM1
	  when x"20" => sreg <= x"7c1e"; -- GAM2
	  when x"21" => sreg <= x"7d35"; -- GAM3
	  when x"22" => sreg <= x"7e5a"; -- GAM4
	  when x"23" => sreg <= x"7f69"; -- GAM5
	  when x"24" => sreg <= x"8076"; -- GAM6
	  when x"25" => sreg <= x"8180"; -- GAM7
	  when x"26" => sreg <= x"8288"; -- GAM8
	  when x"27" => sreg <= x"838f"; -- GAM9
	  when x"28" => sreg <= x"8496"; -- GAM10
	  when x"29" => sreg <= x"85a3"; -- GAM11
	  when x"2a" => sreg <= x"86af"; -- GAM12
	  when x"2b" => sreg <= x"87c4"; -- GAM13
	  when x"2c" => sreg <= x"88d7"; -- GAM14
	  when x"2d" => sreg <= x"89e8"; -- GAM15
	  when x"2e" => sreg <= x"3d80"; -- COM13 - Turn on GAMMA and UV Auto adjust

	  when others => sreg <= x"ffff";

	end case;
      end if;

    end if;
  end process;
end Behavioral;


--when x"2e" => sreg <= x"13E0"; -- COM8 - AGC, White balance
--when x"2f" => sreg <= x"0000"; -- GAIN AGC 
--when x"30" => sreg <= x"1000"; -- AECH Exposure
--when x"31" => sreg <= x"0D40"; -- COMM4 - Window Size
--when x"32" => sreg <= x"1418"; -- COMM9 AGC 
--when x"33" => sreg <= x"a505"; -- AECGMAX banding filter step
--when x"34" => sreg <= x"2495"; -- AEW AGC Stable upper limite
--when x"35" => sreg <= x"2533"; -- AEB AGC Stable lower limi
--when x"36" => sreg <= x"26e3"; -- VPT AGC fast mode limits
--when x"37" => sreg <= x"9f78"; -- HRL High reference level
--when x"38" => sreg <= x"A068"; -- LRL low reference level
--when x"39" => sreg <= x"a103"; -- DSPC3 DSP control
--when x"3a" => sreg <= x"A6d8"; -- LPH Lower Prob High
--when x"3b" => sreg <= x"A7d8"; -- UPL Upper Prob Low
--when x"3c" => sreg <= x"A8f0"; -- TPL Total Prob Low
--when x"3d" => sreg <= x"A990"; -- TPH Total Prob High
--when x"3e" => sreg <= x"AA94"; -- NALG AEC Algo select
--when x"3f" => sreg <= x"13E5"; -- COM8 AGC Settings

--when x"16" => sreg <= x"7a20";
--when x"17" => sreg <= x"7b1c";
--when x"18" => sreg <= x"7c28";
--when x"19" => sreg <= x"7d3c";
--when x"1a" => sreg <= x"7e55";
--when x"1b" => sreg <= x"7f68";
--when x"1c" => sreg <= x"8076";
--when x"1d" => sreg <= x"8180";
--when x"1e" => sreg <= x"8288";
--when x"1f" => sreg <= x"838f";
--when x"21" => sreg <= x"8496";
--when x"22" => sreg <= x"85a3";
--when x"23" => sreg <= x"86af";
--when x"24" => sreg <= x"87c4";
--when x"25" => sreg <= x"88d7";
--when x"26" => sreg <= x"89e8";
--when x"27" => sreg <= x"13e0";
--when x"28" => sreg <= x"0000";
--when x"29" => sreg <= x"1000";
--when x"2a" => sreg <= x"0d00";
--when x"2b" => sreg <= x"1428";
--when x"2c" => sreg <= x"a505";
--when x"2d" => sreg <= x"ab07";
--when x"2e" => sreg <= x"2475";
--when x"2f" => sreg <= x"2563";
--when x"30" => sreg <= x"26A5";
--when x"31" => sreg <= x"9f78";
--when x"32" => sreg <= x"a068";
--when x"33" => sreg <= x"a103";
--when x"34" => sreg <= x"a6df";
--when x"35" => sreg <= x"a7df";
--when x"36" => sreg <= x"a8f0";
--when x"37" => sreg <= x"a990";
--when x"38" => sreg <= x"aa94";
--when x"39" => sreg <= x"13e5";
--when x"3a" => sreg <= x"0e61";
--when x"3b" => sreg <= x"0f4b";
--when x"3c" => sreg <= x"1602";
--when x"3d" => sreg <= x"1e07";
--when x"3e" => sreg <= x"2102";
--when x"3f" => sreg <= x"2291";
--when x"40" => sreg <= x"2907";
--when x"41" => sreg <= x"330b";
--when x"42" => sreg <= x"350b";
--when x"43" => sreg <= x"371d";
--when x"44" => sreg <= x"3871";
--when x"45" => sreg <= x"392a";
--when x"46" => sreg <= x"3c78";
--when x"47" => sreg <= x"4d40";
--when x"48" => sreg <= x"4e20";
--when x"49" => sreg <= x"6900";
--when x"4a" => sreg <= x"6b4a";
--when x"4b" => sreg <= x"7419";
--when x"4c" => sreg <= x"8d4f";
--when x"4d" => sreg <= x"8e00";
--when x"4e" => sreg <= x"8f00";
--when x"4f" => sreg <= x"9000";
--when x"50" => sreg <= x"9100";
--when x"51" => sreg <= x"9200";
--when x"52" => sreg <= x"9600";
--when x"53" => sreg <= x"9a80";
--when x"54" => sreg <= x"b084";
--when x"55" => sreg <= x"b10c";
--when x"56" => sreg <= x"b20e";
--when x"57" => sreg <= x"b382";
--when x"58" => sreg <= x"b80a";
--when x"59" => sreg <= x"4314";
--when x"5a" => sreg <= x"44f0";
--when x"5b" => sreg <= x"4534";
--when x"5c" => sreg <= x"4658";
--when x"5d" => sreg <= x"4728";
--when x"5e" => sreg <= x"483a";
--when x"5f" => sreg <= x"5988";
--when x"60" => sreg <= x"5a88";
--when x"61" => sreg <= x"5b44";
--when x"62" => sreg <= x"5c67";
--when x"63" => sreg <= x"5d49";
--when x"64" => sreg <= x"5e0e";
--when x"65" => sreg <= x"6404";
--when x"66" => sreg <= x"6520";
--when x"67" => sreg <= x"6605";
--when x"68" => sreg <= x"9404";
--when x"69" => sreg <= x"9508";
--when x"6a" => sreg <= x"6c0a";
--when x"6b" => sreg <= x"6d55";
--when x"6c" => sreg <= x"6e11";
--when x"6d" => sreg <= x"6f9f";
--when x"6e" => sreg <= x"6a40";
--when x"6f" => sreg <= x"0140";
--when x"70" => sreg <= x"0240";
--when x"71" => sreg <= x"13e7";
--when x"72" => sreg <= x"1500";  
--when x"73" => sreg <= x"4f80";
--when x"74" => sreg <= x"5080";
--when x"75" => sreg <= x"5100";
--when x"76" => sreg <= x"5222";
--when x"77" => sreg <= x"535e";
--when x"78" => sreg <= x"5480";
--when x"79" => sreg <= x"589e";
--when x"7a" => sreg <= x"4108";
--when x"7b" => sreg <= x"3f00";
--when x"7c" => sreg <= x"7505";
--when x"7d" => sreg <= x"76e1";
--when x"7e" => sreg <= x"4c00";
--when x"7f" => sreg <= x"7701";
--when x"80" => sreg <= x"3dc2";	
--when x"81" => sreg <= x"4b09";
--when x"82" => sreg <= x"c960";
--when x"83" => sreg <= x"4138";
--when x"84" => sreg <= x"5640";
--when x"85" => sreg <= x"3411";
--when x"86" => sreg <= x"3b02"; 
--when x"87" => sreg <= x"a489";
--when x"88" => sreg <= x"9600";
--when x"89" => sreg <= x"9730";
--when x"8a" => sreg <= x"9820";
--when x"8b" => sreg <= x"9930";
--when x"8c" => sreg <= x"9a84";
--when x"8d" => sreg <= x"9b29";
--when x"8e" => sreg <= x"9c03";
--when x"8f" => sreg <= x"9d4c";
--when x"90" => sreg <= x"9e3f";
--when x"91" => sreg <= x"7804";
