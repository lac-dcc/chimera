-------------------------------------------------------------------------
----                                                                 ----
---- Company : ELB-Elektroniklaboratorien Bonn UG                    ----
----           (haftungsbeschränkt)                                  ----
----                                                                 ----
---- Description   : Disc16T                                         ----
----                                                                 ----
-------------------------------------------------------------------------
----                                                                 ----
---- Copyright (C) 2015 ELB                                          ----
----                                                                 ----
---- This program is free software; you can redistribute it and/or   ----
---- modify it under the terms of the GNU General Public License as  ----
---- published by the Free Software Foundation; either version 3 of  ----
---- the License, or (at your option) any later version.             ----
----                                                                 ----
---- This program is distributed in the hope that it will be useful, ----
---- but WITHOUT ANY WARRANTY; without even the implied warranty of  ----
---- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the    ----
---- GNU General Public License for more details.                    ----
----                                                                 ----
---- You should have received a copy of the GNU General Public       ----
---- License along with this program; if not, see                    ----
---- <http://www.gnu.org/licenses>.                                  ----
----                                                                 ----
-------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- needed to be able to do math
library UNISIM;
use UNISIM.VComponents.all;



entity mez_disc16 is
  Generic (mybaseaddress: natural := 16#0000#; use_clk_buf: STD_LOGIC_VECTOR (15 downto 0) := (others=>'0'));
     Port (databus : inout  STD_LOGIC_VECTOR (31 downto 0) := (others=>'Z');
           addressbus : in  STD_LOGIC_VECTOR (15 downto 0);
           writesignal : in  STD_LOGIC;
           readsignal : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Discriminator_Channel : out STD_LOGIC_VECTOR (16 downto 1);
           MEZ : inout STD_LOGIC_VECTOR (79 downto 0)  := (others=>'Z'));
end mez_disc16;

architecture Behavioral of mez_disc16 is

   -- IO ports
   Signal DiscP, DiscN : STD_LOGIC_VECTOR(16 downto 1);
   Signal Channel : STD_LOGIC_VECTOR (16 downto 1)  := (others=>'0');

   -- ELBDISC16T wires
   signal DAC_SDI, DAC_SCLK, DAC_CS : STD_LOGIC_VECTOR(2 downto 1)  := "11";
   signal DAC_SDO : STD_LOGIC_VECTOR(2 downto 1)  := "11";
   signal HDAC_CLK, HDAC_Load, HDAC_SDI : STD_LOGIC_VECTOR(2 downto 1)  := "11";
   signal ADC_SDO, ADC_CLK : STD_LOGIC;
   signal ADC_F0 : std_logic;
   signal ADC_CS : std_logic;
   signal DAC_WAKEUP : std_logic_vector(2 downto 1);
   signal DAC_LDAC : std_logic_vector(2 downto 1);
   signal DAC_Data_Format : std_logic_vector(2 downto 1);
   signal DAC_RST : std_logic_vector(2 downto 1);
   signal DAC_CLR : std_logic_vector(2 downto 1);   

	signal ID_MISO : STD_LOGIC;
	signal ID_CS  : STD_LOGIC:='1';
	signal ID_CLK, ID_MOSI  : STD_LOGIC:='0';
	
   ATTRIBUTE OUT_TERM: STRING;
   ATTRIBUTE OUT_TERM of ADC_F0 : SIGNAL is "UNTUNED_50";
   ATTRIBUTE OUT_TERM of ADC_CS : SIGNAL is "UNTUNED_50";
   ATTRIBUTE OUT_TERM of DAC_SDI : SIGNAL is "UNTUNED_50";
   ATTRIBUTE OUT_TERM of DAC_WAKEUP : SIGNAL is "UNTUNED_50";
   ATTRIBUTE OUT_TERM of DAC_LDAC : SIGNAL is "UNTUNED_50";
   ATTRIBUTE OUT_TERM of DAC_CLR : SIGNAL is "UNTUNED_50";
   ATTRIBUTE OUT_TERM of DAC_RST : SIGNAL is "UNTUNED_50";
   ATTRIBUTE OUT_TERM of DAC_SCLK : SIGNAL is "UNTUNED_50";
   ATTRIBUTE OUT_TERM of DAC_Data_Format : SIGNAL is "UNTUNED_50";
   ATTRIBUTE OUT_TERM of DAC_CS : SIGNAL is "UNTUNED_50";
   ATTRIBUTE OUT_TERM of HDAC_CLK : SIGNAL is "UNTUNED_50";
   ATTRIBUTE OUT_TERM of HDAC_SDI : SIGNAL is "UNTUNED_50";
   ATTRIBUTE OUT_TERM of HDAC_Load : SIGNAL is "UNTUNED_50";
	--new firmware

	ATTRIBUTE OUT_TERM of ID_CS  : SIGNAL is "UNTUNED_50";
	ATTRIBUTE OUT_TERM of ID_CLK  : SIGNAL is "UNTUNED_50";  
	ATTRIBUTE OUT_TERM of ID_MOSI  : SIGNAL is "UNTUNED_50";   
	
   --for mode 1: automatic digitizing of all channels:
   signal Enable_Automatic_Measurement : STD_LOGIC := '1';
   --Signal discriminator_channel : STD_LOGIC_VECTOR (16 downto 1);
   Signal THR1, THR2, THR3, THR4, THR5, THR6, THR7, THR8, THR9, THR10, THR11, THR12, THR13, THR14, THR15, THR16,
          HYS1, HYS2, HYS3, HYS4, HYS5, HYS6, HYS7, HYS8, HYS9, HYS10, HYS11, HYS12, HYS13, HYS14, HYS15, HYS16,
          DAC1_OFFSETA, DAC1_OFFSETB, DAC2_OFFSETA, DAC2_OFFSETB, DAC1_REFA, DAC1_REFB, DAC2_REFA, DAC2_REFB, DAC_GND : STD_LOGIC_VECTOR (15 downto 0) := X"DEAD";

   -- for mode2: writing dac values
   signal DAC_write_index : STD_LOGIC_VECTOR (4 downto 0) := "01110"; -- initial 0E -> error
   signal DAC_write_value : STD_LOGIC_VECTOR (15 downto 0) := X"DEAD";
   signal DAC_Write_enable : STD_LOGIC := '0';

   -- for mode3: writing arbitrary dac registers:
   signal ARB_W_WE1, ARB_W_WE2 : STD_LOGIC := '0';
   signal ARB_W_ADDR : STD_LOGIC_VECTOR (4 downto 0) := "01110"; -- initial 0E -> error
   signal ARB_W_Value : STD_LOGIC_VECTOR (15 downto 0) := X"DEAD";


   -- for mode 4: read DAC register (complementary to mode 2)
   signal DAC_Index_R : STD_LOGIC_VECTOR (4 downto 0); -- 0...15 =channels, 16..19 = offsetdacs
   signal DAC_Value_R : STD_LOGIC_VECTOR (15 downto 0) := X"DEAD";-- output
   signal DAC_Index_Read : STD_LOGIC_VECTOR (4 downto 0) := "11110"; -- index from witch value was read, initial 1E
   signal RE_DAC_Register : STD_LOGIC; -- read command
   signal RE_DAC_Reg_Valid : STD_LOGIC := '0'; -- data valid


   --for mode 5: reading arbitrary register
   signal ARB_R_Value1,ARB_R_Value2 : std_logic_vector(15 downto 0);
   signal ARB_R_Valid1,ARB_R_Valid2 : std_logic;
   signal ARB_R_Read_Addr1,ARB_R_Read_Addr2 : std_logic_vector(4 downto 0);
   signal ARB_R_ADDR : std_logic_vector(4 downto 0);
   signal ARB_R_RD1,ARB_R_RD2 : std_logic;

   -- for mode 6: read arbitragy analog channel
   signal RAA_WR : STD_LOGIC  := '0'; -- write command
   signal RAA_Index: STD_LOGIC_VECTOR (5 downto 0) := "001110";-- channel that has to be digitized.
   signal RAA_Value : STD_LOGIC_VECTOR (15 downto 0) := X"DEAD"; -- measured value
   signal RAA_Valid : STD_LOGIC  := '0'; -- data valid
   signal RAA_read_index : STD_LOGIC_VECTOR (5 downto 0); -- channel which was read
         

   -- for hysteresis setting:
	signal  HDAC_Data :  STD_LOGIC_VECTOR (7 downto 0);
	signal  HDAC_Channel :  STD_LOGIC_VECTOR (4 downto 0);
	signal  HDAC_WE :  STD_LOGIC;
	signal  HDAC_INIT :  STD_LOGIC;
	signal  HDAC_Busy :  STD_LOGIC;
     
		-- new Busy-flag
	signal 	TDAC_ADC_Busy : STD_LOGIC;

		--new ID function
	signal 	DeviceID :  STD_LOGIC_VECTOR (47 downto 0);
	signal	ReadID :  STD_LOGIC;
         
   -- adc frequency selection:
   signal ADC_Frequency : std_logic_vector(15 downto 0) := X"0030";
         
   -- initializatin command:
   signal initialize_DACs : STD_LOGIC  := '1'; -- '1' to initialize dacs on powerup

   COMPONENT Disc16T_ADC_DAC_Controller
   PORT(
      CLK : IN std_logic;
      initialize_DACs : in STD_LOGIC;
      Enable_Automatic_Measurement : IN std_logic;
      DAC_Index_W : IN std_logic_vector(4 downto 0);
      DAC_Value_W : IN std_logic_vector(15 downto 0);
      WE_DAC_Register : IN std_logic;
      --ARB_W_DAC1 : IN std_logic;
      ARB_W_ADDR : IN std_logic_vector(4 downto 0);
      ARB_W_Value : IN std_logic_vector(15 downto 0);
      ARB_W_WE1, ARB_W_WE2 : IN std_logic;
      
      DAC_Index_R : IN std_logic_vector(4 downto 0);
      RE_DAC_Register : IN std_logic;
    
      
      ARB_R_ADDR : IN std_logic_vector(4 downto 0);
      ARB_R_RD1,ARB_R_RD2 : IN std_logic;
      
       --new in/out for missing ELB_DISK16T  
      ADC_Frequency : in std_logic_vector(15 downto 0);
      DAC_SDI, DAC_SCLK, DAC_CS : out STD_LOGIC_VECTOR(2 downto 1) ;
      DAC_SDO : in STD_LOGIC_VECTOR(2 downto 1) ;
      HDAC_CLK, HDAC_Load, HDAC_SDI : out STD_LOGIC_VECTOR(2 downto 1) ;
      ADC_SDO, ADC_CLK : in STD_LOGIC;
      ADC_F0 : OUT std_logic;
      ADC_CS : OUT std_logic;
      DAC_WAKEUP : OUT std_logic_vector(2 downto 1);
      DAC_LDAC : OUT std_logic_vector(2 downto 1);
      DAC_Data_Format : OUT std_logic_vector(2 downto 1);
      DAC_RST : OUT std_logic_vector(2 downto 1);
      DAC_CLR : OUT std_logic_vector(2 downto 1);
		-- new firmware addition: ID readout
		ID_MISO : IN STD_LOGIC;
		ID_CS  : OUT STD_LOGIC:='1';
		ID_CLK, ID_MOSI  : OUT STD_LOGIC:='0';   
		--
      THR1 : OUT std_logic_vector(15 downto 0);
      THR2 : OUT std_logic_vector(15 downto 0);
      THR3 : OUT std_logic_vector(15 downto 0);
      THR4 : OUT std_logic_vector(15 downto 0);
      THR5 : OUT std_logic_vector(15 downto 0);
      THR6 : OUT std_logic_vector(15 downto 0);
      THR7 : OUT std_logic_vector(15 downto 0);
      THR8 : OUT std_logic_vector(15 downto 0);
      THR9 : OUT std_logic_vector(15 downto 0);
      THR10 : OUT std_logic_vector(15 downto 0);
      THR11 : OUT std_logic_vector(15 downto 0);
      THR12 : OUT std_logic_vector(15 downto 0);
      THR13 : OUT std_logic_vector(15 downto 0);
      THR14 : OUT std_logic_vector(15 downto 0);
      THR15 : OUT std_logic_vector(15 downto 0);
      THR16 : OUT std_logic_vector(15 downto 0);
      HYS1 : OUT std_logic_vector(15 downto 0);
      HYS2 : OUT std_logic_vector(15 downto 0);
      HYS3 : OUT std_logic_vector(15 downto 0);
      HYS4 : OUT std_logic_vector(15 downto 0);
      HYS5 : OUT std_logic_vector(15 downto 0);
      HYS6 : OUT std_logic_vector(15 downto 0);
      HYS7 : OUT std_logic_vector(15 downto 0);
      HYS8 : OUT std_logic_vector(15 downto 0);
      HYS9 : OUT std_logic_vector(15 downto 0);
      HYS10 : OUT std_logic_vector(15 downto 0);
      HYS11 : OUT std_logic_vector(15 downto 0);
      HYS12 : OUT std_logic_vector(15 downto 0);
      HYS13 : OUT std_logic_vector(15 downto 0);
      HYS14 : OUT std_logic_vector(15 downto 0);
      HYS15 : OUT std_logic_vector(15 downto 0);
      HYS16 : OUT std_logic_vector(15 downto 0);
      DAC1_OFFSETA : OUT std_logic_vector(15 downto 0);
      DAC1_OFFSETB : OUT std_logic_vector(15 downto 0);
      DAC2_OFFSETA : OUT std_logic_vector(15 downto 0);
      DAC2_OFFSETB : OUT std_logic_vector(15 downto 0);
      DAC1_REFA : OUT std_logic_vector(15 downto 0);
      DAC1_REFB : OUT std_logic_vector(15 downto 0);
      DAC2_REFA : OUT std_logic_vector(15 downto 0);
      DAC2_REFB : OUT std_logic_vector(15 downto 0);
      DAC_GND : OUT std_logic_vector(15 downto 0);
      DAC_Value_R : OUT std_logic_vector(15 downto 0);
      DAC_Index_Read : OUT std_logic_vector(4 downto 0);
      RE_DAC_Reg_Valid : OUT std_logic;
      
      ARB_R_Value1,ARB_R_Value2 : OUT std_logic_vector(15 downto 0);
      ARB_R_Valid1,ARB_R_Valid2 : OUT std_logic;
      ARB_R_Read_Addr1,ARB_R_Read_Addr2 : OUT std_logic_vector(4 downto 0);
      
      --for hysteresis setting:
		HDAC_Data : in STD_LOGIC_VECTOR (7 downto 0);
		HDAC_Channel : in STD_LOGIC_VECTOR (4 downto 0);
		HDAC_WE : in STD_LOGIC;
		HDAC_INIT : in STD_LOGIC;
		HDAC_Busy : OUT STD_LOGIC;
      
		TDAC_ADC_Busy : out STD_LOGIC;
		MuteChannelDuringTrhesholdChange : IN STD_LOGIC; 
		
		--new ID function
		DeviceID : OUT STD_LOGIC_VECTOR (47 downto 0);
		ReadID : in STD_LOGIC;
      
      
      RAA_WR : in STD_LOGIC; -- write command
      RAA_Index: in STD_LOGIC_VECTOR (5 downto 0);-- channel that has to be digitized.
      RAA_Value : out STD_LOGIC_VECTOR (15 downto 0) := X"DEAD"; -- measured value
      RAA_Valid : out STD_LOGIC  := '0'; -- data valid
      RAA_read_index : out STD_LOGIC_VECTOR (5 downto 0) := X"EDEAD" -- channel which was read
      );
   END COMPONENT;


begin

	-----------------------------------------------------
	---------- Instantiate all req. buffers -------------
	-----------------------------------------------------

	-- single outputs
   OBUF_MEZ10 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(10), I => ADC_F0 );
   OBUF_MEZ11 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(11), I => ADC_CS );
   OBUF_MEZ25 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(25), I => DAC_SDI(1) );
   OBUF_MEZ23 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(23), I => DAC_WAKEUP(1) );
   OBUF_MEZ24 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(24), I => DAC_LDAC(1) );
   OBUF_MEZ26 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(26), I => DAC_CLR(1) );
   OBUF_MEZ27 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(27), I => DAC_RST(1) );
   OBUF_MEZ33 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(33), I => DAC_SCLK(1) );
   OBUF_MEZ36 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(36), I => DAC_Data_Format(1) );
   OBUF_MEZ37 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(37), I => DAC_CS(1) );
   OBUF_MEZ46 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(46), I => DAC_SDI(2) );
   OBUF_MEZ47 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(47), I => DAC_SCLK(2) );
   OBUF_MEZ50 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(50), I => DAC_Data_Format(2) );
   OBUF_MEZ68 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(68), I => DAC_CLR(2) );
   OBUF_MEZ69 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(69), I => DAC_RST(2) );
   OBUF_MEZ70 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(70), I => DAC_WAKEUP(2) );
   OBUF_MEZ71 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(71), I => DAC_LDAC(2) );
   OBUF_MEZ67 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(67), I => DAC_CS(2) );
   OBUF_MEZ28 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(28), I => HDAC_SDI(1) );
   OBUF_MEZ29 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(29), I => HDAC_CLK(1) );
   OBUF_MEZ30 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(30), I => HDAC_Load(1) );
   OBUF_MEZ51 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(51), I => HDAC_Load(2) );
   OBUF_MEZ52 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(52), I => HDAC_CLK(2) );
   OBUF_MEZ53 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(53), I => HDAC_SDI(2) );   
   -- single inputs
   IBUF_MEZ31 : IBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => ADC_CLK, I => MEZ(31) );
   IBUF_MEZ32 : IBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => ADC_SDO, I => MEZ(32) );
   IBUF_MEZ22 : IBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => DAC_SDO(1), I => MEZ(22) );
   IBUF_MEZ72 : IBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => DAC_SDO(2), I => MEZ(72) );

	-- new firmware outputs
   OBUF_MEZ17 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(17), I => ID_CS );
   OBUF_MEZ61 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(61), I => ID_CLK );
   OBUF_MEZ60 : OBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => MEZ(60), I => ID_MOSI );
	-- new firmware inputs
	IBUF_MEZ16 : IBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( O => ID_MISO, I =>MEZ(16)  );
	 
 
   -- differential inputs
   DiscP(2)  <= MEZ(0);
   DiscN(2)  <= MEZ(1);
   DiscP(1)  <= MEZ(2);
   DiscN(1)  <= MEZ(3);
   DiscP(3)  <= MEZ(4);
   DiscN(3)  <= MEZ(5);
   DiscP(4)  <= MEZ(6);
   DiscN(4)  <= MEZ(7);
   DiscP(7)  <= MEZ(12);
   DiscN(7)  <= MEZ(13);
   DiscP(6)  <= MEZ(14);
   DiscN(6)  <= MEZ(15);
   DiscP(5)  <= MEZ(18);
   DiscN(5)  <= MEZ(19);
   DiscP(8)  <= MEZ(34);
   DiscN(8)  <= MEZ(35);
   DiscP(11) <= MEZ(40);
   DiscN(11) <= MEZ(41);
   DiscP(10) <= MEZ(42);
   DiscN(10) <= MEZ(43);
   DiscP(9)  <= MEZ(44);
   DiscN(9)  <= MEZ(45);
   DiscP(12) <= MEZ(48);
   DiscN(12) <= MEZ(49);
   DiscP(15) <= MEZ(54);
   DiscN(15) <= MEZ(55); 
   DiscP(14) <= MEZ(56);
   DiscN(14) <= MEZ(57);
   DiscP(13) <= MEZ(58);
   DiscN(13) <= MEZ(59);
   DiscN(16) <= MEZ(79);
   DiscP(16) <= MEZ(78);
	
   buffers: for i in 1 to 16 generate

		CLKBUF: if (use_clk_buf(i-1) = '1') generate 	-- clk bit is high
			Disc_IBUFGDS: IBUFGDS 
			GENERIC MAP ( DIFF_TERM => TRUE, 				-- Differential Termination 
							  IOSTANDARD => "LVPECL_25")
				PORT MAP ( O => Channel(i),
							  I => DiscP(i),
							  IB => DiscN(i) );  
			Discriminator_Channel(i) <= Channel(i); 
		end generate CLKBUF;

		DATABUF: if (use_clk_buf(i-1) = '0') generate 	-- clk bit is low
			Disc_IBUFDS: IBUFDS 
			GENERIC MAP ( DIFF_TERM => TRUE, 				-- Differential Termination 
							  IBUF_LOW_PWR => FALSE, 			-- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
							  IOSTANDARD => "LVPECL_25")
				PORT MAP ( O => Channel(i),
							  I => DiscP(i),
							  IB => DiscN(i) );  
			Discriminator_Channel(i) <= not Channel(i); 	-- signals in the pyhsical world are negative
		end generate DATABUF;
				
   end generate buffers;



	-----------------------------------------------------
	---------- Communication with VME interface ---------
	-----------------------------------------------------
	
	process (CLK) begin
   	if (rising_edge(CLK)) then
         
   	-- Set defaults
      DAC_Write_enable <= '0';
      ARB_W_WE1 <= '0';
      ARB_W_WE2 <= '0';
      HDAC_WE <= '0';
		HDAC_Init <= '0';
      RE_DAC_Register <= '0';
      ARB_R_RD1 <= '0';
      ARB_R_RD2 <= '0';         
      RAA_WR <= '0';
      initialize_DACs <= '0';              
		ReadID <= '0';
		


		
   	-- Register write/read
		
		-- do nothing by default
		databus <= (others => 'Z');   
		
		case (addressbus) is -- addr arranged such an offset of 0x40 between differnt MEZ is sufficient -> read all THR in one row

			when(mybaseaddress+X"0004") => -- initialization command
				if(writesignal='1') then
					initialize_DACs <= '1';
				end if;

			when(mybaseaddress+X"0008") => -- Set and Read ADC_Frequency
				if(readsignal='1') then
					databus(15 downto 0) <= ADC_Frequency;
				elsif (writesignal='1') then   
					ADC_Frequency <= databus(15 downto 0);
				end if;
				
			when(mybaseaddress+X"000C") => -- Set and Read automatic measurement
				if (writesignal='1') then
					Enable_Automatic_Measurement <= databus(0);
				elsif(readsignal='1') then
					databus(0) <= Enable_Automatic_Measurement;
				end if;
						
						
						
			when (mybaseaddress+X"0010") => -- set dac value for index: 0= broadcast (=all channels), 1...16 =channels, 17..20 = offsetdacs(1a,1b,2a,2b)
				if (writesignal='1') then
					DAC_Write_enable <= '1';
					DAC_write_index <= databus(20 downto 16);
					DAC_write_value <= databus(15 downto 0);
				elsif(readsignal='1') then
					databus(20 downto 16) <= DAC_write_index;
					databus(15 downto 0) <= DAC_write_value;
				end if;
			
			
			
			when(mybaseaddress+X"0014") =>  -- read digital written dac value (1. write desired index 2. readback value)      
				if(writesignal='1') then            
					RE_DAC_Register <= '1';
					DAC_Index_R <= databus(20 downto 16);
				elsif(readsignal='1') then
					databus(15 downto 0) <= DAC_Value_R;
					databus(20 downto 16) <= DAC_Index_Read;
					databus(28) <= RE_DAC_Reg_Valid;
					databus(24) <= RE_DAC_Reg_Valid;
				end if;

				
				
			when(mybaseaddress+X"0020") =>  -- write hysteresis dac
				if(readsignal='1') then
					databus(7 downto 0)  <= HDAC_Data;
					databus(12 downto 8) <= HDAC_Channel;
				elsif(writesignal='1') then
					if (databus(31)='1') then
						HDAC_Init <= '1';
					else
						HDAC_Data <= databus(7 downto 0);
						HDAC_Channel <= databus(12 downto 8);
						HDAC_WE <= '1';
					end if;
				end if;



			when(mybaseaddress+X"0030") =>  -- ARB WRITE
				if(writesignal='1') then   
					ARB_W_WE1 <= '1';
					ARB_W_WE2 <= '1';
					ARB_W_ADDR <= databus(20 downto 16);
					ARB_W_Value <= databus(15 downto 0);
				end if;
				
			when(mybaseaddress+X"0034") =>  -- ARB READ (write desired index)
				if(writesignal='1') then               
					ARB_R_RD1 <= databus(24);
					ARB_R_RD2 <= databus(28);
					ARB_R_ADDR <= databus(20 downto 16);
				end if;  
				
			when(mybaseaddress+X"0038") =>  -- ARB READ (read value1)
				if(readsignal='1') then
					databus(24)           <= ARB_R_Valid1;
					databus(20 downto 16) <= ARB_R_Read_Addr1;
					databus(15 downto 0)  <= ARB_R_Value1;
				end if;
				
			when(mybaseaddress+X"003C") => -- ARB READ (read value2)
				if(readsignal='1') then
					databus(28)           <= ARB_R_Valid2;
					databus(20 downto 16) <= ARB_R_Read_Addr2;
					databus(15 downto 0)  <= ARB_R_Value2;
				end if;

            

			when(mybaseaddress+X"0100") => -- analog readbacks of THR and HYS
				if(readsignal='1') then
					databus <= HYS1 & THR1;
				end if;
				
			when(mybaseaddress+X"0104") =>
				if(readsignal='1') then
					databus <= HYS2 & THR2;
				end if;
				
			when(mybaseaddress+X"0108") =>
				if(readsignal='1') then
					databus <= HYS3 & THR3;
				end if;
				
			when(mybaseaddress+X"010C") =>
				if(readsignal='1') then
					databus <= HYS4 & THR4;
				end if;
				
			when(mybaseaddress+X"0110") =>
				if(readsignal='1') then
					databus <= HYS5 & THR5;
				end if;
				
			when(mybaseaddress+X"0114") =>
				if(readsignal='1') then
					databus <= HYS6 & THR6;
				end if;
				
			when(mybaseaddress+X"0118") =>
				if(readsignal='1') then
					databus <= HYS7 & THR7;
				end if; 
				
			when(mybaseaddress+X"011C") =>
				if(readsignal='1') then
					databus <= HYS8 & THR8;
				end if; 
				
			when(mybaseaddress+X"0120") =>
				if(readsignal='1') then
					databus <= HYS9 & THR9;
				end if;  
				
			when(mybaseaddress+X"0124") =>
				if(readsignal='1') then
					databus <= HYS10 & THR10;
				end if;  
				
			when(mybaseaddress+X"0128") =>
				if(readsignal='1') then
					databus <= HYS11 & THR11;
				end if;  
				
			when(mybaseaddress+X"012C") =>
				if(readsignal='1') then
					databus <= HYS12 & THR12;
				end if;
				
			when(mybaseaddress+X"0130") =>
				if(readsignal='1') then
					databus <= HYS13 & THR13;
				end if;   
            
			when(mybaseaddress+X"0134") =>
				if(readsignal='1') then
					databus <= HYS14 & THR14;
				end if; 
				
			when(mybaseaddress+X"0138") =>
				if(readsignal='1') then
					databus <= HYS15 & THR15;
				end if;   
				
			when(mybaseaddress+X"013C") =>
				if(readsignal='1') then
					databus <= HYS16 & THR16;
				end if;   

            
				
			when(mybaseaddress+X"0200") => -- other analog readbacks
				if(readsignal='1') then
					databus <= DAC1_OFFSETA & DAC1_OFFSETB;
				end if;  
				
			when(mybaseaddress+X"0204") =>
				if(readsignal='1') then
					databus <= DAC2_OFFSETA & DAC2_OFFSETB;
				end if;  
				
			when(mybaseaddress+X"0208") =>
				if(readsignal='1') then
					databus <= DAC1_REFA & DAC1_REFB;
				end if; 
				
			when(mybaseaddress+X"020C") =>
				if(readsignal='1') then
					databus <= DAC2_REFA & DAC2_REFB;
				end if; 
				
			when(mybaseaddress+X"0210") =>
				if(readsignal='1') then
					databus <= X"0000" & DAC_GND;
				end if;   

			when(mybaseaddress+X"0220") => -- read arbitrary analog channel (1. Write desired index 2. Readback value)      
				if(writesignal='1') then      
					RAA_WR <= '1';
					RAA_Index <= databus(21 downto 16);
				elsif(readsignal='1') then
					databus(15 downto 0) <= RAA_Value;
					databus(21 downto 16) <= RAA_read_index;
					databus(28) <= RAA_Valid;
					databus(24) <= RAA_Valid;
				end if;
			
			when(mybaseaddress+X"0224") => --  (1. Write signal to Address 0x0224 2. Readback value from Address 0x0224 and 0x228)      
				if(writesignal='1') then      
					ReadID <= '1';
				elsif(readsignal='1') then
					databus(23 downto 0) <= DeviceID (23 downto 0);
				end if;
		
			when(mybaseaddress+X"0228") =>   
				if(writesignal='1') then      
					ReadID <= '1';
				elsif(readsignal='1') then
					databus(23 downto 0) <= DeviceID (47 downto 24);
				end if;

         when others => NULL;
         end case;


   	end if;
	end process;









   Inst_Disc16T_ADC_DAC_Controller: Disc16T_ADC_DAC_Controller PORT MAP(
   	CLK => CLK,
   	ADC_Frequency => ADC_Frequency,
   	initialize_DACs=>initialize_DACs,
   	THR1 => THR1,
   	THR2 => THR2,
   	THR3 => THR3,
   	THR4 => THR4,
   	THR5 => THR5,
   	THR6 => THR6,
   	THR7 => THR7,
   	THR8 => THR8,
   	THR9 => THR9,
   	THR10 => THR10,
   	THR11 => THR11,
   	THR12 => THR12,
   	THR13 => THR13,
   	THR14 => THR14,
   	THR15 => THR15,
   	THR16 => THR16,
   	HYS1 => HYS1,
   	HYS2 => HYS2,
   	HYS3 => HYS3,
   	HYS4 => HYS4,
   	HYS5 => HYS5,
   	HYS6 => HYS6,
   	HYS7 => HYS7,
   	HYS8 => HYS8,
   	HYS9 => HYS9,
   	HYS10 => HYS10,
   	HYS11 => HYS11,
   	HYS12 => HYS12,
   	HYS13 => HYS13,
   	HYS14 => HYS14,
   	HYS15 => HYS15,
   	HYS16 => HYS16,
   	DAC1_OFFSETA => DAC1_OFFSETA,
   	DAC1_OFFSETB => DAC1_OFFSETB,
   	DAC2_OFFSETA => DAC2_OFFSETA,
   	DAC2_OFFSETB => DAC2_OFFSETB,
   	DAC1_REFA => DAC1_REFA,
   	DAC1_REFB => DAC1_REFB,
   	DAC2_REFA => DAC2_REFA,
   	DAC2_REFB => DAC2_REFB,
   	DAC_GND => DAC_GND,
   	Enable_Automatic_Measurement => Enable_Automatic_Measurement,
   	
   	-- mode 2: write value in dac voltage register
   	DAC_Index_W =>DAC_write_index,
   	DAC_Value_W=>DAC_write_value,
   	we_dac_register=>DAC_Write_enable,
   	-- mode 3: write arbitraty DAC register
   	ARB_W_ADDR => ARB_W_ADDR,
   	ARB_W_Value => ARB_W_Value,
   	ARB_W_WE1 => ARB_W_WE1,
   	ARB_W_WE2 => ARB_W_WE2,
   	
   	DAC_Index_R => DAC_Index_R,
   	DAC_Value_R => DAC_Value_R,
   	DAC_Index_Read=>DAC_Index_Read,
   	RE_DAC_Register => RE_DAC_Register,
   	RE_DAC_Reg_Valid => RE_DAC_Reg_Valid,   	
   	
   	-- mode 5: arbitrary dac register read
   	ARB_R_Value1=>ARB_R_Value1,
   	ARB_R_Value2=>ARB_R_Value2,
   	ARB_R_Valid1=>ARB_R_Valid1,
   	ARB_R_Valid2=>ARB_R_Valid2,
   	ARB_R_Read_Addr1=>ARB_R_Read_Addr1,
   	ARB_R_Read_Addr2=>ARB_R_Read_Addr2,
   	ARB_R_ADDR=>ARB_R_ADDR,
   	ARB_R_RD1=>ARB_R_RD1,
   	ARB_R_RD2=>ARB_R_RD2,
   	
   	-- for hysteresis setting:
		HDAC_Data=>HDAC_Data,
		HDAC_Channel=>HDAC_Channel,
		HDAC_WE=>HDAC_WE,
		HDAC_Init=>HDAC_Init,
		HDAC_Busy=>HDAC_Busy,   	
   	
		DeviceID=>DeviceID,
		ReadID=>ReadID,		
		
		MuteChannelDuringTrhesholdChange=>'0',
		TDAC_ADC_Busy=>TDAC_ADC_Busy,
		
   	RAA_WR=>RAA_WR,
   	RAA_Index=>RAA_Index,
   	RAA_Value=>RAA_Value,
   	RAA_Valid=>RAA_Valid,
   	RAA_read_index=>RAA_read_index,
   	
	--      RAA_DAC1_Mux => (others=>'0'),
	--      RAA_DAC2_Mux => (others=>'0'),
	--      RAA_DAC1_IO => (others=>'0'),
	--      RAA_DAC2_IO => (others=>'0'),
	--      RAA_WR => '0',
	--      RAA_Value =>open ,
	--      RAA_Valid => open,
	--      RAA_DAC1_Mux_V => open,
	--      RAA_DAC2_Mux_V => open,

   	-- new in/out for missing ELB_DISK16
   	DAC_SDI => DAC_SDI,
   	DAC_SCLK => DAC_SCLK,
   	DAC_CS  => DAC_CS,
   	DAC_SDO  => DAC_SDO,
   	HDAC_CLK => HDAC_CLK,
   	HDAC_Load => HDAC_Load,
   	HDAC_SDI  => HDAC_SDI,
   	ADC_SDO => ADC_SDO,
   	ADC_CLK => ADC_CLK,
   	ADC_F0 => ADC_F0, 
   	ADC_CS => ADC_CS, 
   	DAC_WAKEUP => DAC_WAKEUP, 
   	DAC_LDAC => DAC_LDAC, 
   	DAC_CLR => DAC_CLR,
   	DAC_RST => DAC_RST , 
   	DAC_Data_Format => DAC_Data_Format, 
		
		ID_MISO => ID_MISO,
		ID_CS => ID_CS,
		ID_CLK => ID_CLK,
		ID_MOSI => ID_MOSI
   );

end Behavioral;
