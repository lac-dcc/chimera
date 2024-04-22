-------------------------------------------------------------------------
----                                                                 ----
---- Engineer: Christian Honisch                                     ----
---- Company : ELB-Elektroniklaboratorien Bonn UG                    ----
----           (haftungsbeschränkt)                                  ----
----                                                                 ----
---- Description   : State machine that controls ADC and DAC on      ----
----                 Disc16T. Things that are controlled are 2 DACs  ----
----                 and one ADC (hysteresis dac has to be           ----
----                 implemented independently).                     ----
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


-------------------------------------------------------------------------------------------------------------
-- core of design is a state machine with following modes:
-- 1) All thresholds and all hysteresis-set-voltages are measured in a cycle (lowest priority)
-- 2) Write Value into DAC register = set DAC-Voltage (including offset dac)
-- 3) Write certain register in DAC (allows access to all registers)
-- 4) read back dac value (read back written setting)
-- 5) read certain register (allows access to all registers)
-- 6) digitize certain voltage (allows digitizing of voltages not coverd by mode 1. e.g. ref, offsetdac,...)
-------------------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Disc16T_ADC_DAC_Controller is
    Port ( CLK : in  STD_LOGIC; -- system clock
			  ADC_Frequency : in  STD_LOGIC_VECTOR (15 downto 0);
			  initialize_DACs : in STD_LOGIC;
			  -- for mode 1: Measured thresholds and measured hysteresis setting voltages (not equal to hysteresis)
           THR1, THR2, THR3, THR4, THR5, THR6, THR7, THR8, THR9, THR10, THR11, THR12, THR13, THR14, THR15, THR16 : out  STD_LOGIC_VECTOR (15 downto 0):=X"DEAD";
           HYS1, HYS2, HYS3, HYS4, HYS5, HYS6, HYS7, HYS8, HYS9, HYS10, HYS11, HYS12, HYS13, HYS14, HYS15, HYS16 : out  STD_LOGIC_VECTOR (15 downto 0):=X"DEAD";
			  DAC1_OFFSETA,DAC1_OFFSETB,DAC2_OFFSETA,DAC2_OFFSETB, DAC1_REFA, DAC1_REFB, DAC2_REFA, DAC2_REFB, DAC_GND : out STD_LOGIC_VECTOR(15 downto 0):=X"DEAD";
			  Enable_Automatic_Measurement : in STD_LOGIC;
			  -- for mode 2: write dac register
			  DAC_Index_W : in STD_LOGIC_VECTOR (4 downto 0); -- 0= broadcast (=all channels), 1...16 =channels, 17..20 = offsetdacs(1a,1b,2a,2b)
			  DAC_Value_W : in STD_LOGIC_VECTOR (15 downto 0); -- value to be written to dac, 16 bit for compability with 16 bit version of dac.
			  WE_DAC_Register : in STD_LOGIC; --Write enable
			  -- for mode 3: write arbitraty register
			  ARB_W_ADDR : in STD_LOGIC_VECTOR (4 downto 0); -- target address
			  ARB_W_Value : in STD_LOGIC_Vector (15 downto 0);-- value
			  ARB_W_WE1,ARB_W_WE2 : in STD_LOGIC; -- write enable for both dacs
			  -- for mode 4: read DAC register (complementary to mode 2)
			  DAC_Index_R : in STD_LOGIC_VECTOR (4 downto 0); -- 0...15 =channels, 16..19 = offsetdacs
			  DAC_Value_R : out STD_LOGIC_VECTOR (15 downto 0):=X"DEAD";-- output
			  DAC_Index_Read : out STD_LOGIC_VECTOR (4 downto 0):="11110"; -- index from which value was read, initial 1E
			  RE_DAC_Register : in STD_LOGIC; -- read command
			  RE_DAC_Reg_Valid : out STD_LOGIC:='0'; -- data valid
			  -- for mode 5: read arbitrary register (complementary to mode 3)
			  ARB_R_ADDR : in STD_LOGIC_VECTOR (4 downto 0); -- target address
			  ARB_R_RD1 : in STD_LOGIC; -- read enable DAC1
			  ARB_R_RD2 : in STD_LOGIC; -- read enable DAC2, both dacs can be read at the same time
			  ARB_R_Valid1, ARB_R_Valid2 : out STD_LOGIC :='0'; -- data valid
			  ARB_R_Read_Addr1, ARB_R_Read_Addr2 : out STD_LOGIC_VECTOR (4 downto 0):="11110"; -- register from which value was read, initial 1E
			  ARB_R_Value1,ARB_R_Value2 : out STD_LOGIC_VECTOR (15 downto 0):=X"dead";-- value
			  -- for mode 6: read arbitrary analog channel = RAA
			  -- replaced by index --RAA_DAC1_Mux, RAA_DAC2_Mux : in STD_LOGIC_VECTOR (4 downto 0);
			  -- replaced by index --RAA_DAC1_IO, RAA_DAC2_IO : in STD_LOGIC_VECTOR (2 downto 0); -- setting for IO
			  RAA_WR : in STD_LOGIC; -- write command
			  RAA_Index: in STD_LOGIC_VECTOR (5 downto 0);-- channel that has to be digitized.
			  RAA_Value : out STD_LOGIC_VECTOR (15 downto 0):=X"DEAD"; -- measured value
			  RAA_Valid : out STD_LOGIC :='0'; -- data valid
			  RAA_read_index : out STD_LOGIC_VECTOR (5 downto 0):="001110"; -- channel which was read           -- replaced by index: RAA_DAC1_Mux_V, RAA_DAC2_Mux_V : out STD_LOGIC_VECTOR (4 downto 0); -- mux values which were set, when read command was done
 			  
			  TDAC_ADC_Busy : out STD_LOGIC;
			  MuteChannelDuringTrhesholdChange : IN STD_LOGIC;          

           -- SPI DAC and ADC interfaces
           --ADC_F0, ADC_CS : out std_logic;
           --ADC_CLK, ADC_SDO : in std_logic;
           
           --for hysteresis setting:
			  HDAC_Data : in STD_LOGIC_VECTOR (7 downto 0);
			  HDAC_Channel : in STD_LOGIC_VECTOR (4 downto 0);
			  HDAC_WE : in STD_LOGIC;
			  HDAC_INIT : in STD_LOGIC;
			  HDAC_Busy : OUT STD_LOGIC;
                       
           --MEZ : INOUT std_logic_vector(79 downto 0) :=(others=>'Z')

           
           --DAC_SCLK, DAC_SDI, DAC_CS : out std_logic_vector(2 downto 1);
           --DAC_SDO : in  std_logic_vector(2 downto 1);
           --DAC_WAKEUP, DAC_LDAC, DAC_CLR : IN std_logic_vector(2 downto 1);
           --DAC_RST, DAC_Data_Format : IN std_logic_vector(2 downto 1);

           --for ELB_DISC16T in/out

         DAC_SDI, DAC_SCLK, DAC_CS : out STD_LOGIC_VECTOR(2 downto 1) :="11";
         DAC_SDO : in STD_LOGIC_VECTOR(2 downto 1) :="11";
         HDAC_CLK, HDAC_Load, HDAC_SDI : out STD_LOGIC_VECTOR(2 downto 1) :="11";
         ADC_SDO, ADC_CLK : in STD_LOGIC;
         ADC_F0 : OUT std_logic :='0';
			ID_MISO : in STD_LOGIC;
			ID_CS  : out STD_LOGIC;
			ID_CLK, ID_MOSI  : out STD_LOGIC;

         --signals are not modified by this module, default values
         ADC_CS : OUT std_logic :='0';
         DAC_WAKEUP : OUT std_logic_vector(2 downto 1):= "00"; -- Low= restore SPI from sleep mode
         DAC_LDAC : OUT std_logic_vector(2 downto 1):= "00"; -- Low = DAC-LATCH is transparent
         DAC_Data_Format : OUT std_logic_vector(2 downto 1):= "00"; -- Low = straight binary, HIGH= twos complement
         DAC_RST : OUT std_logic_vector(2 downto 1):="11"; -- Low = reset dac registers to default value
         DAC_CLR : OUT std_logic_vector(2 downto 1):= "11"; -- Low = out connected to AGND, high = buffer amp out
			
			-- new ID readout
			DeviceID : OUT STD_LOGIC_VECTOR (47 downto 0);
			ReadID : in STD_LOGIC
			
			
           );
           
end Disc16T_ADC_DAC_Controller;

architecture Behavioral of Disc16T_ADC_DAC_Controller is
   
	type   controller_states is (waiting,           -- idle state, accept command
										  initializing_DACs, -- initialize dac registers
										  initializing_HDACs, -- initialize hysteresis dacs 
										  next_channel,      -- mode1: atomatically digitize data. for this switch to next analog channel
										  wait_for_spi_done_last, --set_dac_value,     -- mode 2: write dac output value
										  --set_register,      -- mode 3: write arbitraty register
										  read_dac_value,    -- mode 4: read dac register value
										  wait_read_channel_reg_done, -- helpstate for mode 4: wait until datatransfer is finished
										  read_register,     -- mode 5: read arbitrary register
										  wait_read_reg_done,-- helpstate for mode 5: wait until datatransfer is finished.
										  
										  switch_to_channel, -- mode 6: switch adc to arbitrary analog channel
										  wait_for_ADC,     -- helpstate for mode 6: wait until adc is avaliable before switching to new channel.
										  wait_until_dac_finished, -- helpstate for mode 1: wait until switching the muxer is done.
										  wait_until_dac_finished_ARB -- same for mode 6: wait until switching the muxer is done.
										  );
                                
	signal cont_state    : controller_states := waiting;
   
	signal ADC_Busy : STD_LOGIC :='0';      -- flag if adc is digitizing channel right now (if =1 do not switch the analog channels!)
	signal ADC_read_now,ADC_read_now_ARB : STD_LOGIC :='0';  -- flag analog mux configuration finished, read adc now.
	signal Data_to_skip_found : STD_LOGIC :='0'; -- when the mux has ben configured, the next word from the adc has to be skipped because it is invalid
	signal Save_ADC_Data_to_ARB_Register : STD_LOGIC :='0';
   
   constant REF_B : STD_LOGIC_VECTOR (15 downto 0):=X"0010";
   constant REF_A : STD_LOGIC_VECTOR (15 downto 0):=X"0020";
   constant OFFSET_B : STD_LOGIC_VECTOR (15 downto 0):=X"0050";
   constant OFFSET_A : STD_LOGIC_VECTOR (15 downto 0):=X"0060";
   
   constant AIN_0 : STD_LOGIC_VECTOR (15 downto 0):=X"0040";
   constant AIN_1 : STD_LOGIC_VECTOR (15 downto 0):=X"0080";
   
   constant DAC_0 : STD_LOGIC_VECTOR (15 downto 0):=X"0100";
   constant DAC_1 : STD_LOGIC_VECTOR (15 downto 0):=X"0200";
   constant DAC_2 : STD_LOGIC_VECTOR (15 downto 0):=X"0400";
   constant DAC_3 : STD_LOGIC_VECTOR (15 downto 0):=X"0800";
   
   constant DAC_4 : STD_LOGIC_VECTOR (15 downto 0):=X"1000";
   constant DAC_5 : STD_LOGIC_VECTOR (15 downto 0):=X"2000";
   constant DAC_6 : STD_LOGIC_VECTOR (15 downto 0):=X"4000";
   constant DAC_7 : STD_LOGIC_VECTOR (15 downto 0):=X"8000";
	
	constant DAC_ADDR_MUX : STD_LOGIC_VECTOR (4 downto 0) :="00001";
	constant DAC_ADDR_IO  : STD_LOGIC_VECTOR (4 downto 0) :="00010";
	constant DAC_ADDR_Broadcast  : STD_LOGIC_VECTOR (4 downto 0) :="00111";
	constant DAC_ADDR_Config : STD_LOGIC_VECTOR (4 downto 0) :="00000";
	constant config_nop : STD_LOGIC_VECTOR (15 downto 0):=X"0020";
	
	constant DISABLE_MUX : STD_LOGIC_VECTOR (15 downto 0):=X"0000";
	
	constant DAC_SPI_CLOCK_DIVIDER : STD_LOGIC_VECTOR (3 downto 0) :="0010";
	
	constant max_dac_index : integer :=20;
   
	function Write_addr_from_DAC_index(index: integer range 0 to max_dac_index) return STD_LOGIC_VECTOR is
		begin
		case index is
			when 0 => return "00111";--broadcast Address
			when 1 => return "01000";-- channel 1
			when 2 => return "01001";
			when 3 => return "01010";
			when 4 => return "01011";
			when 5 => return "01100";
			when 6 => return "01101";
			when 7 => return "01110";
			when 8 => return "01111";
			when 9 => return "01000"; -- same addresses for 9-16 as for 1-8 (same registers in other chip)
			when 10 => return "01001";
			when 11 => return "01010";
			when 12 => return "01011";
			when 13 => return "01100";
			when 14 => return "01101";
			when 15 => return "01110";
			when 16 => return "01111";
			when 17 => return "00011"; -- offsetdac A
			when 18 => return "00100"; -- offsetdac B
			when 19 => return "00011"; -- offsetdac A
			when 20 => return "00100"; -- offsetdac B
			when others => return "00101"; -- reserved register, writing into it has no effect
		end case;
	end Write_addr_from_DAC_index;
   
	function DAC_Index_for_DAC_1(index: integer range 0 to max_dac_index) return STD_LOGIC is
	begin
		if index = 0 or index = 1  or index = 2 or index = 3 or index = 4 or index = 5 or index = 6 or index = 7 or index = 8 or index = 17 or index = 18 then
			return '1';
		else
			return '0';
		end if;
	end DAC_Index_for_DAC_1;
   
	function DAC_Index_for_DAC_2(index: integer range 0 to max_dac_index) return STD_LOGIC is
	begin
		if index = 0 or index = 9 or index = 10 or index = 11 or index = 12 or index = 13 or index = 14 or index = 15 or index = 16 or index = 19 or index = 20 then
			return '1';
		else
			return '0';
		end if;
	end DAC_Index_for_DAC_2;
   
-- funcion to fix bug on prototype pcb
	function reverse_bits (input : STD_LOGIC_VECTOR(2 downto 0)) return STD_LOGIC_VECTOR is
	begin
		return input(0) & input(1) & input (2);
	end function;
-- for hdac muxing
	function select_data(select_first : STD_LOGIC; in1, in2 : STD_LOGIC_VECTOR) return std_logic_vector is
	begin
		if select_first='1' then
			return in1;
		else
			return in2;
		end if;
	end function;
	
	function select_data(select_first : STD_LOGIC; in1, in2 : STD_LOGIC) return STD_LOGIC is
	begin
		if select_first='1' then
			return in1;
		else
			return in2;
		end if;
	end function;

   
	constant analog_max_index : integer := 40;
	signal current_index : integer range 0 to analog_max_index :=40;
	
	function Mux1_From_Index(a_index: integer range 0 to analog_max_index) return STD_LOGIC_VECTOR is
	begin
		case a_index is
			when 0 => return DAC_0;
			when 1 => return DAC_1;
			when 2 => return DAC_2;
			when 3 => return DAC_3;
			when 4 => return DAC_4;
			when 5 => return DAC_5;
			when 6 => return DAC_6;
			when 7 => return DAC_7;
				
			when 16 => return AIN_0;
			when 17 => return AIN_0;
			when 18 => return AIN_0;
			when 19 => return AIN_0;
			when 20 => return AIN_0;
			when 21 => return AIN_0;
			when 22 => return AIN_0;
			when 23 => return AIN_0;
			
			when 32 => return OFFSET_A;
			when 33 => return OFFSET_B;
			when 36 => return REF_A;
			when 37 => return REF_B;
			when 40 => return AIN_1; -- connection to GND
			when others => return DAC_0;-- DISABLE_MUX;
		end case;
				
	end Mux1_From_Index;
   
	function Mux2_From_Index(a_index: integer range 0 to analog_max_index) return STD_LOGIC_VECTOR is
	begin
		case a_index is
			when 0 => return AIN_0;
			when 1 => return AIN_0;
			when 2 => return AIN_0;
			when 3 => return AIN_0;
			when 4 => return AIN_0;
			when 5 => return AIN_0;
			when 6 => return AIN_0;
			when 7 => return AIN_0;
			
			when 8  => return DAC_0;
			when 9  => return DAC_1;
			when 10 => return DAC_2;
			when 11 => return DAC_3;
			when 12 => return DAC_4;
			when 13 => return DAC_5;
			when 14 => return DAC_6;
			when 15 => return DAC_7;
			
			when 16 => return AIN_0;
			when 17 => return AIN_0;
			when 18 => return AIN_0;
			when 19 => return AIN_0;
			when 20 => return AIN_0;
			when 21 => return AIN_0;
			when 22 => return AIN_0;
			when 23 => return AIN_0;
			
			when 24 => return AIN_1;
			when 25 => return AIN_1;
			when 26 => return AIN_1;
			when 27 => return AIN_1;
			when 28 => return AIN_1;
			when 29 => return AIN_1;
			when 30 => return AIN_1;
			when 31 => return AIN_1;
			
			when 32 => return AIN_0;
			when 33 => return AIN_0;
			when 34 => return OFFSET_A;
			when 35 => return OFFSET_B;
			
			when 36 => return AIN_0;
			when 37 => return AIN_0;
			when 38 => return REF_A;
			when 39 => return REF_B;
			
			when 40 => return AIN_0;
		end case;
				
	end Mux2_From_Index;
      
   
--- for mode 5 and 4: reading something from the dacs
signal Reading_from_DAC : STD_LOGIC_VECTOR(2 downto 1):="00";--flag if from DAC1/2 is being read
   
	COMPONENT Controller_DAC8218
	PORT(
		CLK : IN std_logic;
		CLK_DIVIDER : IN std_logic_vector(3 downto 0);          
		
		SDI : IN std_logic;
		SCLK : OUT std_logic;
		CS : OUT std_logic;
		SDO : OUT std_logic;
		
		ADDR : IN std_logic_vector(4 downto 0);
		DATA_Write : IN std_logic_vector(15 downto 0);
		WR : IN std_logic;
		RD : IN std_logic;
		
		
		DATA_Read : OUT std_logic_vector(15 downto 0);
		busy : OUT std_logic;
		Data_Update : OUT std_logic
		);
	END COMPONENT;

-- glue signals:
   signal DAC_WR, DAC_RD, DAC_busy, DAC_data_update : STD_LOGIC_VECTOR(2 downto 1) :="00";
   --signal DATA_Read1, DATA_Read2, DATA_Write1, DATA_Write2 : STD_LOGIC_VECTOR (15 downto 0):=X"dead";
   signal DAC_Data_Out1, DAC_Data_In1, DAC_Data_Out2, DAC_Data_In2 : STD_LOGIC_VECTOR (15 downto 0):=X"dead";
   signal DAC_ADDR1, DAC_ADDR2 : STD_LOGIC_VECTOR(4 downto 0):="11110";

--necessary to write both dacs:
--DAC_ADDR1<=
--DATA_Write1<=
--DAC_ADDR2<=
--DATA_Write2<=
--DAC_WR<="11";

	COMPONENT ADC_LT2433_1_Receiver
	PORT(
		CLK : IN std_logic;
		SCLK : IN std_logic;
		SDO : IN std_logic;          
		Data : OUT std_logic_vector(18 downto 0);
		Data_Update : OUT std_logic
		);
	END COMPONENT;
signal ADC_Data_Out : std_logic_vector(18 downto 0);
signal ADC_Data_Update : STD_LOGIC:='0';


--COMPONENT MB88347_Controller
--	PORT(
--		CLK : IN std_logic;
--		CLK_DIV : IN std_logic_vector(7 downto 0);
--		Data : IN std_logic_vector(7 downto 0);
--		Channel : IN std_logic_vector(3 downto 0);
--		WE : IN std_logic;          
--		SCLK : OUT std_logic;
--		CS : OUT std_logic;
--		MOSI : OUT std_logic;
--		Busy : OUT std_logic
--		);
--	END COMPONENT;
	
--	signal HDAC_CLK, HDAC_Load, HDAC_SDI : STD_LOGIC_VECTOR(2 downto 1) :="11";
	
	
	COMPONENT HDAC_Controller
	PORT(
		CLK : IN std_logic;
		Channel : IN std_logic_vector(4 downto 0);
		Data : IN std_logic_vector(11 downto 0);
		WE : IN std_logic;
		Init : IN std_logic;          
		Busy : OUT std_logic;
		HDAC_CLK : OUT std_logic_vector(2 downto 1);
		HDAC_Load : OUT std_logic_vector(2 downto 1);
		HDAC_SDI : OUT std_logic_vector(2 downto 1)
		);
	END COMPONENT;
   

   
-- for initialization
--wl 0x100104 11008180  -- configuration register
--wl 0x100100 11aaac    -- offsetvoltage for both dacs and both groups
--wl 0x100100 12aaac
--wl 0x100100 13aaac
--wl 0x100100 14aaac

-- result: three write cycles to addresses, both dacs
-- addr 00 data 8180
-- addr 03 data aaac
-- addr 04 data aac
constant number_of_init_commands : integer :=4;
type array_init_data_type is array (0 to number_of_init_commands-1 ) of std_logic_vector(15 downto 0); 
constant init_data : array_init_data_type:=(X"8180",X"aaac",X"aaac",X"8800");
type array_init_addr_type is array (0 to number_of_init_commands-1 ) of std_logic_vector(4 downto 0); 
constant init_addr : array_init_addr_type:=("00000", "00011","00100", "00111");

signal init_command_index : integer range 0 to number_of_init_commands:=0;

signal init_hdac_counter : integer range 1 to 17:=1;
constant hyst_init_value : STD_LOGIC_VECTOR (7 downto 0) := X"78";
signal hdac_override : STD_LOGIC :='0';
signal HDAC_INT_Data : STD_LOGIC_VECTOR (7 downto 0) :=X"EE";
signal HDAC_INT_addr : STD_LOGIC_VECTOR (4 downto 0) :="11100";
signal HDAC_INT_we : STD_LOGIC_VECTOR (2 downto 1):="00";


--constant adc_clk_divider : integer :=48;
signal counter : integer:=0;-- range 0 to adc_clk_divider :=0;
signal f0 : STD_LOGIC :='0';

--signal ID_MISO : STD_LOGIC;
--signal ID_CS  : STD_LOGIC :='1';
--signal ID_CLK, ID_MOSI  : STD_LOGIC :='0';

signal HDAC_DATA12 : STD_LOGIC_VECTOR (11 downto 0);

	--signal HDAC_INIT : STD_LOGIC;
	--signal HDAC_Busy : STD_LOGIC;
------------------------------------------------
--UID	
	COMPONENT Controller_25AA02E48
	PORT(
		CLK : IN std_logic;
		CLKDivH : IN std_logic_vector(3 downto 0);
		CLKDivL : IN std_logic_vector(3 downto 0);
		ReadID : IN std_logic;
		MISO : IN std_logic;          
		ID : OUT std_logic_vector(47 downto 0);
		SCLK : OUT std_logic;
		CS : OUT std_logic;
		MOSI : OUT std_logic
		);
	END COMPONENT;
	
--Signal DiscID : STD_LOGIC_VECTOR (23 downto 0);

--------- command request processing signals	


signal reg_InterfaceBusy,initialize_DACs_request : std_logic  :='0';
signal WE_DAC_Register_request : std_logic  :='0';
signal RE_DAC_Register_request,ARB_W_WE1_request,ARB_W_WE2_request,ARB_R_RD1_request,ARB_R_RD2_request,RAA_WR_request : std_logic  :='0';

signal DAC_Index_W_request, DAC_Index_R_request, ARB_W_ADDR_request, ARB_R_ADDR_request : STD_LOGIC_VECTOR (4 downto 0):=(others=>'0');
signal DAC_Value_W_request, ARB_W_Value_request : STD_LOGIC_VECTOR (15 downto 0):=(others=>'0');
signal RAA_Index_request : STD_LOGIC_VECTOR (5 downto 0):=(others=>'0');

--=======================================================================================================
begin

TDAC_ADC_Busy<=reg_InterfaceBusy; --- interface already received the next command and cannot accept another command right now.

process (CLK) is begin
	if rising_edge(CLK) then
	
		if (reg_InterfaceBusy ='0') then
			if initialize_DACs = '1' then
				initialize_DACs_request<='1';
				reg_InterfaceBusy <='1';
				
			elsif WE_DAC_Register='1' then
				reg_InterfaceBusy <='1';
				WE_DAC_Register_request<='1';
				DAC_Index_W_request <= DAC_Index_W;
				DAC_Value_W_request <= DAC_Value_W;
				
			elsif RE_DAC_Register='1' then
				reg_InterfaceBusy <='1';
				RE_DAC_Register_request<='1';
				DAC_Index_R_request<=DAC_Index_R;
				
			elsif ARB_W_WE1='1' OR ARB_W_WE2='1' then
				reg_InterfaceBusy <='1';
				ARB_W_WE1_request<=ARB_W_WE1;
				ARB_W_WE2_request<=ARB_W_WE2;
				ARB_W_ADDR_request  <= ARB_W_ADDR; 
				ARB_W_Value_request <= ARB_W_Value;
				
			elsif ARB_R_RD1='1' or ARB_R_RD2='1' then
				ARB_R_RD1_request<=ARB_R_RD1;
				ARB_R_RD2_request<=ARB_R_RD2;
				reg_InterfaceBusy <='1';
				ARB_R_ADDR_request <=ARB_R_ADDR;
				
			elsif RAA_WR='1' then
				reg_InterfaceBusy <='1';
				RAA_WR_request<='1';
				RAA_Index_request <=RAA_Index;
			end if;
		else
			if cont_state = waiting then  -- if state is waiting, command will be processed, request can be cleared.
				if WE_DAC_Register_request='1' then
					reg_InterfaceBusy<='0';
					WE_DAC_Register_request<='0';
				end if;
				if initialize_DACs_request = '1' then
					initialize_DACs_request<='0';
					reg_InterfaceBusy <='0';
				end if;
				
				if RE_DAC_Register_request='1' then
					reg_InterfaceBusy <='0';
					RE_DAC_Register_request<='0';
				end if;
					
				if ARB_W_WE1_request='1' OR ARB_W_WE2_request='1' then
					reg_InterfaceBusy <='0';
					ARB_W_WE1_request<='0';
					ARB_W_WE2_request<='0';
				end if;	
				if ARB_R_RD1_request='1' or ARB_R_RD2_request='1' then
					ARB_R_RD1_request<='0';
					ARB_R_RD2_request<='0';
					reg_InterfaceBusy <='0';
				end if;
				if RAA_WR_request='1' then
					reg_InterfaceBusy <='0';
					RAA_WR_request<='0';
				end if;
				
				
			end if;
		end if;
	end if;
end process;

process (CLK) is begin
	if rising_edge(CLK) then		
		case cont_state is
			when waiting =>           -- idle state, process command
				if initialize_DACs_request='1' then
				--if initialize_DACs='1' then
					--reg_InterfaceBusy<='0';
					--initialize_DACs_request<='0';
					cont_state<=initializing_DACs;
					init_command_index<=1;
					DAC_ADDR1<=init_addr(0);
					DAC_ADDR2<=init_addr(0);
					DAC_Data_In1<=init_data(0);
					DAC_Data_In2<=init_data(0);
					DAC_WR<="11";
					
				elsif WE_DAC_Register_request='1' then -- highest priority = writing dac registers
				--if WE_DAC_Register='1' then -- highest priority = writing dac registers
					
					cont_state <=wait_for_spi_done_last;
					DAC_ADDR1<=Write_addr_from_DAC_index(to_integer(unsigned(DAC_Index_W_request)));
					DAC_ADDR2<=Write_addr_from_DAC_index(to_integer(unsigned(DAC_Index_W_request)));
					DAC_Data_In1<=DAC_Value_W_request;
					DAC_Data_In2<=DAC_Value_W_request;
					DAC_WR(1)<=DAC_Index_for_DAC_1(to_integer(unsigned(DAC_Index_W_request)));
					DAC_WR(2)<=DAC_Index_for_DAC_2(to_integer(unsigned(DAC_Index_W_request)));
					ARB_R_Valid1<=not DAC_Index_for_DAC_1(to_integer(unsigned(DAC_Index_W_request)));
					ARB_R_Valid2<=not DAC_Index_for_DAC_2(to_integer(unsigned(DAC_Index_W_request)));
					
				elsif RE_DAC_Register_request='1' then -- mode 4: read dac channel
					cont_state <= read_dac_value;
					DAC_ADDR1<=Write_addr_from_DAC_index(to_integer(unsigned(DAC_Index_R_request))); 
					DAC_ADDR2<=Write_addr_from_DAC_index(to_integer(unsigned(DAC_Index_R_request)));
					DAC_RD(1)<=DAC_Index_for_DAC_1(to_integer(unsigned(DAC_Index_R_request)));
					DAC_RD(2)<=DAC_Index_for_DAC_2(to_integer(unsigned(DAC_Index_R_request)));
					RE_DAC_Reg_Valid<='0';
					DAC_Index_Read<=DAC_Index_R_request;
					Reading_from_Dac(1)<=DAC_Index_for_DAC_1(to_integer(unsigned(DAC_Index_R_request)));
					Reading_from_Dac(2)<=DAC_Index_for_DAC_2(to_integer(unsigned(DAC_Index_R_request)));
					
				elsif ARB_W_WE1_request='1' OR ARB_W_WE2_request='1' then -- mode 3: write arbitrary register
					cont_state <= wait_for_spi_done_last;--set_register; (changed, because state waits only for DAC transfer to be completed):
					DAC_ADDR1<=ARB_W_ADDR_request;
					DAC_ADDR2<=ARB_W_ADDR_request;
					DAC_Data_In1<=ARB_W_Value_request;
					DAC_Data_In2<=ARB_W_Value_request;
					DAC_WR(1)<=ARB_W_WE1_request;
					DAC_WR(2)<=ARB_W_WE2_request;
					ARB_R_Valid1<= not ARB_W_WE1_request;
					ARB_R_Valid2<= not ARB_W_WE2_request;
					
				elsif ARB_R_RD1_request='1' or ARB_R_RD2_request='1' then -- mode 5: read arbitrary register
					cont_state <= read_register;
					-- initiate transfer
					DAC_ADDR1<=ARB_R_ADDR_request;
					DAC_ADDR2<=ARB_R_ADDR_request;
					DAC_RD(1)<=ARB_R_RD1_request;
					DAC_RD(2)<=ARB_R_RD2_request;
					Reading_from_DAC(1)<=ARB_R_RD1_request;
					Reading_from_DAC(2)<=ARB_R_RD2_request;
					-- clear dataregisters : (no longer valid)
					ARB_R_Valid1<='0';
					ARB_R_Read_Addr1<="01110"; -- 0x0E for indication of error
					ARB_R_Value1<=X"DEAD";
					ARB_R_Valid2<='0';
					ARB_R_Read_Addr2<="01110"; -- 0x0E for indication of error
					ARB_R_Value2<=X"DEAD";
					
				elsif RAA_WR_request='1' then -- mode 6: read arbitrary analog channel
					cont_state <= wait_for_ADC; -- enter helpstate to wait until adc is avalable
					RAA_read_index<=RAA_Index_request;
				elsif Enable_Automatic_Measurement='1' AND ADC_Busy='0' then -- lowest priority = automatic measurement
					
					cont_state <= next_channel;
					-- configure analog mux chain. 
					-- 1) write DAC Monitor register
					-- 2) write DAC IO register, thereby set hysteresis voltage muxer
					
					DAC_ADDR1<=DAC_ADDR_MUX;
					
					DAC_ADDR2<=DAC_ADDR_MUX;
					
					DAC_WR<="11";
					if current_index=analog_max_index then
						current_index<=0;
						DAC_Data_In1<=Mux1_From_Index(0);
						DAC_Data_In2<=Mux2_From_Index(0);
					else
						current_index<=current_index+1;
						DAC_Data_In1<=Mux1_From_Index(current_index+1);
						DAC_Data_In2<=Mux2_From_Index(current_index+1);
					end if;
				end if;
			
			when initializing_DACs => -- initializing DACs
				DAC_WR<="00";
				if dac_busy="00" and init_command_index=number_of_init_commands then
					cont_state<=initializing_HDACs;--waiting;
					--hdac_override<='1';
					--HDAC_INT_Data<=hyst_init_value;
					--HDAC_INT_addr<=STD_LOGIC_VECTOR(to_unsigned(init_hdac_counter,5));
					--HDAC_INT_we<="11";
					--init_hdac_counter<=init_hdac_counter+1;
					
				elsif dac_busy="00" then
					--cont_state<=initializing_DACs;
					init_command_index<=init_command_index+1;
					DAC_ADDR1<=init_addr(init_command_index);
					DAC_ADDR2<=init_addr(init_command_index);
					DAC_Data_In1<=init_data(init_command_index);
					DAC_Data_In2<=init_data(init_command_index);
					DAC_WR<="11";
				end if;
			when initializing_HDACs=>
				--HDAC_INT_we<="00";
				--if HDAC_Busy="00" AND init_hdac_counter=17 then
					cont_state<=waiting;
--					init_hdac_counter<=1;
--					hdac_override<='0';
--				elsif HDAC_Busy="00" and HDAC_INT_we="00" then
--					hdac_override<='1';
--					HDAC_INT_Data<=hyst_init_value;
--					init_hdac_counter<=init_hdac_counter+1;
--					HDAC_INT_addr<=STD_LOGIC_VECTOR(to_unsigned(init_hdac_counter,5));
--					HDAC_INT_we<="11";
--				end if;
				
				
			
			when next_channel =>      -- mode1: atomatically digitize data. for this switch to next analog channel
				DAC_WR<="00";
				if DAC_busy="00" then 
					DAC_ADDR1<=DAC_ADDR_IO;
					--DAC_Data_In1(12 downto 0)<="0000000000000";
					--DAC_Data_In1(15 downto 13)<=reverse_bits(STD_LOGIC_VECTOR(to_unsigned(current_index,3)));-- reversing bits due to bug on prototype pcb...
					DAC_Data_In1<=STD_LOGIC_VECTOR(to_unsigned(current_index,3)) & "0000000000000";
					
					DAC_ADDR2<=DAC_ADDR_IO;
					DAC_Data_In2<=STD_LOGIC_VECTOR(to_unsigned(current_index,3)) & "0000000000000";
					DAC_WR<="11";
					cont_state<=wait_until_dac_finished;
				end if;
			when wait_until_dac_finished =>
				DAC_WR<="00";
				if DAC_busy="00" then
					ADC_read_now<='1';
				end if;
				if adc_busy ='1' then
					cont_state<=waiting;
					ADC_read_now<='0';
				end if;
				
			when wait_for_spi_done_last =>     -- mode 2 and 3: write dac output value
				DAC_WR<="00";
				if DAC_busy="00" then
					cont_state<=waiting;
				end if;
			--when set_register =>      -- mode 3: write arbitraty register
			when read_dac_value =>    -- mode 4: read dac register value
				DAC_RD<="00";
				if DAC_busy="00" then
					DAC_WR<=Reading_from_DAC; -- write same dac(s) which were prepared for reading
					DAC_ADDR1<=DAC_ADDR_Config;
					DAC_Data_In1<=config_nop;  -- do NOP, so nothing changes during write cycle
					DAC_ADDR2<=DAC_ADDR_Config;
					DAC_Data_In2<=config_nop;  -- do NOP, so nothing changes during write cycle
					cont_state<=wait_read_channel_reg_done;
				end if;
			when wait_read_channel_reg_done=>
				DAC_WR<="00";
				if DAC_data_update(1)='1' then
					RE_DAC_Reg_Valid<='1';
					DAC_Value_R<=DAC_Data_Out1;
					Reading_from_DAC(1)<='0';
				end if;
				if DAC_data_update(2)='1' then
					RE_DAC_Reg_Valid<='1';
					DAC_Value_R<=DAC_Data_Out2;
					Reading_from_DAC(2)<='0';
				end if;
				
				if Reading_from_DAC="00" then
					cont_state<=waiting;
				end if;
	-- mode 1 end			
			when read_register =>     -- mode 5: read arbitrary register
				DAC_RD<="00";
				if DAC_busy="00" then
					DAC_WR<=Reading_from_DAC; -- write same dac(s) which were prepared for reading
					DAC_ADDR1<=DAC_ADDR_Config;
					DAC_Data_In1<=config_nop;  -- do NOP, so nothing changes during write cycle
					DAC_ADDR2<=DAC_ADDR_Config;
					DAC_Data_In2<=config_nop;  -- do NOP, so nothing changes during write cycle
					cont_state<=wait_read_reg_done;
				end if;
			when wait_read_reg_done=>
				DAC_WR<="00";
				if DAC_data_update(1)='1' then
					ARB_R_Valid1<='1';
					ARB_R_Read_Addr1<=ARB_R_ADDR;--DAC_ADDR1;
					ARB_R_Value1<=DAC_Data_Out1;
					Reading_from_DAC(1)<='0';
				else
					--to be cleared at start of transfer: ARB_R_Valid1<='0';
				end if;
				
				if DAC_data_update(2)='1' then
					ARB_R_Valid2<='1';
					ARB_R_Read_Addr2<=ARB_R_ADDR;--DAC_ADDR2;
					ARB_R_Value2<=DAC_Data_Out2;
					Reading_from_DAC(2)<='0';
				else
					--to be cleared at start of transfer: ARB_R_Valid2<='0';
				end if;
				
				if Reading_from_DAC="00" then
					cont_state<=waiting;
				end if;
	-- mode 5 end
			when wait_for_ADC =>      -- helpstate for mode 6: wait until adc is avaliable before switching to new channel.
				if adc_busy='0' then
					cont_state<=switch_to_channel;
					DAC_ADDR1<=DAC_ADDR_MUX;
					DAC_ADDR2<=DAC_ADDR_MUX;
					DAC_WR<="11";
					DAC_Data_In1<=Mux1_From_Index(to_integer(unsigned(RAA_Index)));
					DAC_Data_In2<=Mux2_From_Index(to_integer(unsigned(RAA_Index)));
				end if;
			when switch_to_channel => -- mode 6: switch adc to arbitrary analog channel
				DAC_WR<="00";
				if DAC_busy="00" then
					DAC_ADDR1<=DAC_ADDR_IO;
					--DAC_Data_In1(12 downto 0)<="0000000000000";
					--DAC_Data_In1(15 downto 13)<=reverse_bits(RAA_Index(2 downto 0));-- reversing bits due to bug on prototype pcb...
					DAC_Data_In1<= RAA_Index(2 downto 0) & "0000000000000";
					
					
					DAC_ADDR2<=DAC_ADDR_IO;
					DAC_Data_In2<= RAA_Index(2 downto 0) & "0000000000000"; --STD_LOGIC_VECTOR(to_unsigned(current_index,3)) & "0000000000000";
					DAC_WR<="11";
					cont_state<=wait_until_dac_finished_ARB;
				end if;
			when wait_until_dac_finished_ARB =>
				DAC_WR<="00";
				if DAC_busy="00" then
					ADC_read_now_ARB<='1';
				end if;
				if adc_busy ='1' then
					cont_state<=waiting;
					ADC_read_now_ARB<='0';
				end if;
		end case;
	end if;
end process;

--- process to save ADC data in correct registers.
Process(CLK) is begin
	if rising_edge(CLK) then
		if RAA_WR='1' then
			RAA_Valid<='0'; --if new read command is found: clear valid flag.
		end if;
		if ADC_busy='0' then
			Data_to_skip_found<='0';
			if ADC_read_now ='1' OR ADC_read_now_ARB='1' then
				ADC_busy<='1';
				Save_ADC_Data_to_ARB_Register<=ADC_read_now_ARB; -- save wheather the read cycle is an arbitrary one or an automatic one.
			end if;
		else
			if ADC_Data_Update='1' then -- a new Dataword of the adc is available
				if Data_to_skip_found='1' then
					--assign data now.
					ADC_Busy<='0';
					if Save_ADC_Data_to_ARB_Register='1' then
						RAA_Value<=ADC_Data_Out(15 downto 0);
						RAA_Valid<='1';
					else -- save value to according register.
						case current_index is
							when 0 => THR1<=ADC_Data_Out(15 downto 0);
							when 1 => THR2<=ADC_Data_Out(15 downto 0);
							when 2 => THR3<=ADC_Data_Out(15 downto 0);
							when 3 => THR4<=ADC_Data_Out(15 downto 0);
							
							when 4 => THR5<=ADC_Data_Out(15 downto 0);
							when 5 => THR6<=ADC_Data_Out(15 downto 0);
							when 6 => THR7<=ADC_Data_Out(15 downto 0);
							when 7 => THR8<=ADC_Data_Out(15 downto 0);
							
							when 8 => THR9<=ADC_Data_Out(15 downto 0);
							when 9 => THR10<=ADC_Data_Out(15 downto 0);
							when 10 => THR11<=ADC_Data_Out(15 downto 0);
							when 11 => THR12<=ADC_Data_Out(15 downto 0);
							
							when 12 => THR13<=ADC_Data_Out(15 downto 0);
							when 13 => THR14<=ADC_Data_Out(15 downto 0);
							when 14 => THR15<=ADC_Data_Out(15 downto 0);
							when 15 => THR16<=ADC_Data_Out(15 downto 0);
							
							
							when 16 => HYS1<=ADC_Data_Out(15 downto 0);
							when 17 => HYS2<=ADC_Data_Out(15 downto 0);
							when 18 => HYS3<=ADC_Data_Out(15 downto 0);
							when 19 => HYS4<=ADC_Data_Out(15 downto 0);
							
							when 20 => HYS5<=ADC_Data_Out(15 downto 0);
							when 21 => HYS6<=ADC_Data_Out(15 downto 0);
							when 22 => HYS7<=ADC_Data_Out(15 downto 0);
							when 23 => HYS8<=ADC_Data_Out(15 downto 0);
							
							when 24 => HYS9<=ADC_Data_Out(15 downto 0);
							when 25 => HYS10<=ADC_Data_Out(15 downto 0);
							when 26 => HYS11<=ADC_Data_Out(15 downto 0);
							when 27 => HYS12<=ADC_Data_Out(15 downto 0);
							
							when 28 => HYS13<=ADC_Data_Out(15 downto 0);
							when 29 => HYS14<=ADC_Data_Out(15 downto 0);
							when 30 => HYS15<=ADC_Data_Out(15 downto 0);
							when 31 => HYS16<=ADC_Data_Out(15 downto 0);
							
							when 32 => DAC1_OFFSETA<=ADC_Data_Out(15 downto 0);
							when 33 => DAC1_OFFSETB<=ADC_Data_Out(15 downto 0);
							when 34 => DAC2_OFFSETA<=ADC_Data_Out(15 downto 0);
							when 35 => DAC2_OFFSETB<=ADC_Data_Out(15 downto 0);
							when 36 => DAC1_REFA<=ADC_Data_Out(15 downto 0);
							when 37 => DAC1_REFB<=ADC_Data_Out(15 downto 0);
							when 38 => DAC2_REFA<=ADC_Data_Out(15 downto 0);
							when 39 => DAC2_REFB<=ADC_Data_Out(15 downto 0);
							when 40 => DAC_GND<=ADC_Data_Out(15 downto 0);
						end case;
					end if;
				else 
					Data_to_skip_found<='1';
				end if;
			end if;
		end if;
	end if;
end process;


   

	Inst_Controller_DAC8211: Controller_DAC8218 PORT MAP(
		CLK => CLK,
		SCLK => DAC_SCLK(1),
		CS => DAC_CS(1),
		SDO => DAC_SDI(1),
		SDI => DAC_SDO(1),
		ADDR => DAC_ADDR1,
		DATA_Read => DAC_Data_Out1,
		DATA_Write => DAC_Data_In1,
		WR => DAC_WR(1),
		RD => DAC_RD(1),
		busy => DAC_busy(1),
		Data_Update => DAC_data_update(1),
		CLK_DIVIDER => DAC_SPI_CLOCK_DIVIDER
	);


	Inst_Controller_DAC8218_2: Controller_DAC8218 PORT MAP(
		CLK => CLK,
		SCLK => DAC_SCLK(2),
		CS => DAC_CS(2),
		SDO => DAC_SDI(2),
		SDI => DAC_SDO(2),
		ADDR => DAC_ADDR2,
		DATA_Read => DAC_Data_Out2,
		DATA_Write => DAC_Data_In2,
		WR => DAC_WR(2) ,
		RD => DAC_RD(2),
		busy => DAC_busy(2),
		Data_Update => DAC_data_update(2),
		CLK_DIVIDER => DAC_SPI_CLOCK_DIVIDER
	);

--- allowed frequency range for f0 (adc datasheet)
-- 2,56 kHz ... 2 MHz
-- 19531  ....  25 Zählschritte
	process (CLK) is begin
		if rising_edge(CLK) then
			if ADC_Frequency(15)='1' then -- use internal oscillator in ADC
				f0<='0';
			else
				counter<=counter -1;
				if counter =0 then
					if to_integer(unsigned (ADC_Frequency)) >19530 then
						counter <=19530;
					elsif to_integer(unsigned (ADC_Frequency)) < 24 then
						counter <= 24;
					else 
						counter<=to_integer(unsigned (ADC_Frequency));
					end if;
					f0<= not f0;
				end if;
			end if;
		end if;
	end process;
	
    ADC_F0 <= f0;
	 
	Inst_ADC_LT2433_1_Receiver: ADC_LT2433_1_Receiver PORT MAP(
		CLK => CLK,
		SCLK => ADC_CLK,
		SDO => ADC_SDO,
		Data => ADC_Data_Out,
		Data_Update => ADC_Data_Update
	);
   

	
	HDAC_DATA12(11 downto 4)<= HDAC_Data;
	HDAC_DATA12(3 downto 0) <= "0000";
	
	Inst_HDAC_Controller: HDAC_Controller PORT MAP(
		CLK => CLK,
		Channel => HDAC_Channel,
		Data => HDAC_DATA12,
		Busy => HDAC_Busy,
		HDAC_CLK => HDAC_CLK,
		HDAC_Load => HDAC_Load,
		HDAC_SDI => HDAC_SDI,
		WE => HDAC_WE,
		Init => HDAC_INIT
	);
	
	
	Inst_Controller_25AA02E48: Controller_25AA02E48 PORT MAP(
		CLK => CLK,
		CLKDivH => X"A",
		CLKDivL => X"A",
		ReadID => ReadID,
		ID => DeviceID,
		SCLK => ID_CLK,
		CS => ID_CS,
		MOSI => ID_MOSI,
		MISO => ID_MISO
	);

end Behavioral;
