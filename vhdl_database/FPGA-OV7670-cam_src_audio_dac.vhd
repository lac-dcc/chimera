
--Legal Notice: (C)2006 Altera Corporation. All rights reserved. Your
--use of Altera Corporation's design tools, logic functions and other
--software and tools, and its AMPP partner logic functions, and any
--output files any of the foregoing (including device programming or
--simulation files), and any associated documentation or information are
--expressly subject to the terms and conditions of the Altera Program
--License Subscription Agreement or other applicable license agreement,
--including, without limitation, that your use is for the sole purpose
--of programming logic devices manufactured by Altera and sold by Altera
--or its authorized distributors.  Please refer to the applicable
--agreement for further details.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AUDIO_DAC is
  port (
	 --	Audio Side
	 oAUD_BCK : inout std_logic; 
	 oAUD_DATA : out std_logic;
	 oAUD_LRCK : out std_logic;
	 --	Control Signals
	 buzzeron : in std_logic;
	 buzzer : in std_logic;
	 left : in std_logic;
	 iCLK_18_4: in std_logic;
	 iRST_N: in std_logic
       );
end AUDIO_DAC;			

architecture Behavioral of  AUDIO_DAC is

  constant	REF_CLK			: natural :=	18432000;	--	18.432	MHz
  constant	SAMPLE_RATE		: natural :=	48000;		--	48		KHz
  constant	DATA_WIDTH		: natural :=	16;			--	16		Bits
  constant	CHANNEL_NUM		: natural :=	2;			--	Dual Channel
  constant	SIN_SAMPLE_DATA		: natural :=	48;
  --------------------------------------------------

  signal bck_div : unsigned(3 downto 0);
  signal LRCK_1X_DIV : unsigned(8 downto 0) ;
  signal LRCK_2X_DIV : unsigned(7 downto 0) ;
  signal LRCK_4X_DIV : unsigned(6 downto 0) ;

  --------	DATA Counter	--------
  signal SIN_Cont : natural ;

  ------------------------------------
  --signal Sin_Out : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal Sin_Out : std_logic_vector(15 downto 0);
  signal Sin_Out2 : std_logic;
  signal SEL_Cont : std_logic_vector(3 downto 0) ;

  signal LRCK_1X : std_logic;
  signal LRCK_2X : std_logic;
  signal LRCK_4X : std_logic;

  signal o : std_logic;
begin
  oAUD_BCK <= o;
  ------------	AUD_BCK Generator	--------------
  process(iCLK_18_4)
  begin
    if rising_edge(iCLK_18_4) then

      if bck_div >= to_unsigned(REF_CLK/(SAMPLE_RATE*DATA_WIDTH*CHANNEL_NUM*2)-1, bck_div'length) then
	bck_div		<= (others => '0');
	o <=	not o;
      else
	bck_div		<=	bck_div+1;
      end if;

	--------------------------------------------------
	------------	AUD_LRCK Generator	--------------

	--	LRCK 1X
      if (LRCK_1X_DIV >= to_unsigned(REF_CLK/(SAMPLE_RATE*2)-1, LRCK_1X_DIV'length)) then
	LRCK_1X_DIV	<=	(others => '0');
	LRCK_1X	<=	not LRCK_1X;
      else
	LRCK_1X_DIV		<=	LRCK_1X_DIV+1;
      end if;

	--	LRCK 2X
      if (LRCK_2X_DIV >= to_unsigned(REF_CLK/(SAMPLE_RATE*4)-1, LRCK_2X_DIV'length)) then

	LRCK_2X_DIV	<=	(others => '0');
	LRCK_2X	<=	not LRCK_2X;
      else
	LRCK_2X_DIV		<=	LRCK_2X_DIV+1;
      end if;
	--	LRCK 4X
      if( LRCK_4X_DIV >= to_unsigned(REF_CLK/(SAMPLE_RATE*8)-1, LRCK_4X_DIV'length)) then
	LRCK_4X_DIV	<=	(others => '0');
	LRCK_4X	<=	not LRCK_4X;
      else
	LRCK_4X_DIV		<=	LRCK_4X_DIV+1;		
      end if;
    end if;
  end process;


  oAUD_LRCK <= LRCK_1X;
  --------------------------------------------------
  ----------	Sin LUT ADDR Generator	--------------
  process(LRCK_1X)
  begin
    if falling_edge(LRCK_1X) then

      if (SIN_Cont < SIN_SAMPLE_DATA-1) then
	SIN_Cont	<=	SIN_Cont+1;
      else
	SIN_Cont	<=	0;
      end if;
    end if;
  end process;

  ----------	16 Bits PISO MSB First	--------------
  process ( o )
  begin
    if falling_edge(o) then
      SEL_Cont	<=	std_logic_vector(unsigned(SEL_Cont)+1);
    end if;
  end process;

  process ( buzzer )
  begin
    if buzzer = '1' and buzzeron = '1' then
      if left = '1' then
	oAUD_DATA <= Sin_Out(to_integer(unsigned(not SEL_Cont)));
      else
	oAUD_DATA <= Sin_Out(to_integer(unsigned(SEL_Cont)));
      end if;
    else
      oAUD_DATA <= '0';
    end if;
  end process;

  ------------	Sin Wave ROM Table	--------------
  process(SIN_Cont)
  begin
    case SIN_Cont is
      when 0  =>  Sin_Out       <=      (others => '0')	      ;
      when 1  =>  Sin_Out       <=      std_logic_vector(to_unsigned(4276,Sin_Out'length))    ;
      when 2  =>  Sin_Out       <=      std_logic_vector(to_unsigned(8480,Sin_Out'length))    ;
      when 3  =>  Sin_Out       <=      std_logic_vector(to_unsigned(12539,Sin_Out'length))   ;
      when 4  =>  Sin_Out       <=      std_logic_vector(to_unsigned(16383,Sin_Out'length))   ;
      when 5  =>  Sin_Out       <=      std_logic_vector(to_unsigned(19947,Sin_Out'length))   ;
      when 6  =>  Sin_Out       <=      std_logic_vector(to_unsigned(23169,Sin_Out'length))   ;
      when 7  =>  Sin_Out       <=      std_logic_vector(to_unsigned(25995,Sin_Out'length))   ;
      when 8  =>  Sin_Out       <=      std_logic_vector(to_unsigned(28377,Sin_Out'length))   ;
      when 9  =>  Sin_Out       <=      std_logic_vector(to_unsigned(30272,Sin_Out'length))   ;
      when 10  =>  Sin_Out      <=      std_logic_vector(to_unsigned(31650,Sin_Out'length))   ;
      when 11  =>  Sin_Out      <=      std_logic_vector(to_unsigned(32486,Sin_Out'length))   ;
      when 12  =>  Sin_Out      <=      std_logic_vector(to_unsigned(32767,Sin_Out'length))   ;
      when 13  =>  Sin_Out      <=      std_logic_vector(to_unsigned(32486,Sin_Out'length))   ;
      when 14  =>  Sin_Out      <=      std_logic_vector(to_unsigned(31650,Sin_Out'length))   ;
      when 15  =>  Sin_Out      <=      std_logic_vector(to_unsigned(30272,Sin_Out'length))   ;
      when 16  =>  Sin_Out      <=      std_logic_vector(to_unsigned(28377,Sin_Out'length))   ;
      when 17  =>  Sin_Out      <=      std_logic_vector(to_unsigned(25995,Sin_Out'length))   ;
      when 18  =>  Sin_Out      <=      std_logic_vector(to_unsigned(23169,Sin_Out'length))   ;
      when 19  =>  Sin_Out      <=      std_logic_vector(to_unsigned(19947,Sin_Out'length))   ;
      when 20  =>  Sin_Out      <=      std_logic_vector(to_unsigned(16383,Sin_Out'length))   ;
      when 21  =>  Sin_Out      <=      std_logic_vector(to_unsigned(12539,Sin_Out'length))   ;
      when 22  =>  Sin_Out      <=      std_logic_vector(to_unsigned(8480,Sin_Out'length))    ;
      when 23  =>  Sin_Out      <=      std_logic_vector(to_unsigned(4276,Sin_Out'length))    ;
      when 24  =>  Sin_Out      <=      std_logic_vector(to_unsigned(0,Sin_Out'length))       ;
      when 25  =>  Sin_Out      <=      std_logic_vector(to_unsigned(61259,Sin_Out'length))   ;
      when 26  =>  Sin_Out      <=      std_logic_vector(to_unsigned(57056,Sin_Out'length))   ;
      when 27  =>  Sin_Out      <=      std_logic_vector(to_unsigned(52997,Sin_Out'length))   ;
      when 28  =>  Sin_Out      <=      std_logic_vector(to_unsigned(49153,Sin_Out'length))   ;
      when 29  =>  Sin_Out      <=      std_logic_vector(to_unsigned(45589,Sin_Out'length))   ;
      when 30  =>  Sin_Out      <=      std_logic_vector(to_unsigned(42366,Sin_Out'length))   ;
      when 31  =>  Sin_Out      <=      std_logic_vector(to_unsigned(39540,Sin_Out'length))   ;
      when 32  =>  Sin_Out      <=      std_logic_vector(to_unsigned(37159,Sin_Out'length))   ;
      when 33  =>  Sin_Out      <=      std_logic_vector(to_unsigned(35263,Sin_Out'length))   ;
      when 34  =>  Sin_Out      <=      std_logic_vector(to_unsigned(33885,Sin_Out'length))   ;
      when 35  =>  Sin_Out      <=      std_logic_vector(to_unsigned(33049,Sin_Out'length))   ;
      when 36  =>  Sin_Out      <=      std_logic_vector(to_unsigned(32768,Sin_Out'length))   ;
      when 37  =>  Sin_Out      <=      std_logic_vector(to_unsigned(33049,Sin_Out'length))   ;
      when 38  =>  Sin_Out      <=      std_logic_vector(to_unsigned(33885,Sin_Out'length))   ;
      when 39  =>  Sin_Out      <=      std_logic_vector(to_unsigned(35263,Sin_Out'length))   ;
      when 40  =>  Sin_Out      <=      std_logic_vector(to_unsigned(37159,Sin_Out'length))   ;
      when 41  =>  Sin_Out      <=      std_logic_vector(to_unsigned(39540,Sin_Out'length))   ;
      when 42  =>  Sin_Out      <=      std_logic_vector(to_unsigned(42366,Sin_Out'length))   ;
      when 43  =>  Sin_Out      <=      std_logic_vector(to_unsigned(45589,Sin_Out'length))   ;
      when 44  =>  Sin_Out      <=      std_logic_vector(to_unsigned(49152,Sin_Out'length))   ;
      when 45  =>  Sin_Out      <=      std_logic_vector(to_unsigned(52997,Sin_Out'length))   ;
      when 46  =>  Sin_Out      <=      std_logic_vector(to_unsigned(57056,Sin_Out'length))   ;
      when 47  =>  Sin_Out      <=      std_logic_vector(to_unsigned(61259,Sin_Out'length))   ;
      when others => Sin_Out		<=		(others => '0')		;
    end case;
  end process;

end  Behavioral;
