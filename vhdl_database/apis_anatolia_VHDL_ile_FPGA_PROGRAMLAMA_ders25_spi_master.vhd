--------------------------------------------------------------------------------
-- AUTHOR:			MEHMET BURAK AYKENAR
-- CREATED:			09.12.2019
-- REVISION DATE:	09.12.2019
--
--------------------------------------------------------------------------------
-- DESCRIPTION:		
--    This module implements master part of SPI communication interface and can be used to any SPI slave IC.
 
--    In order to read from a slave IC, mosi_data_i input signal should be assigned to desired value and en_i signal should be high. 
--    In order to write to a slave IC, en_i input signal should be high. 
--    data_ready_o output signal has the logic high value for one clock cycle as read or/and write operation finished. miso_data_o output signal
-- has the data read from slave IC. 
--    In order to read or/and write consecutively, en_i signal should be kept high. To end the transaction, en_i input signal should be assigned to zero
-- when data_ready_o output signal gets high.
--------------------------------------------------------------------------------
-- Limitation/Assumption: In order to use this module properly, the ratio of  (c_clkfreq / c_sclkFreq) should be equal to 8 or more. 
--    For higher SCLK frequencies are possible but more elaboration is needed.
-- Notes: c_cpol and c_cpha parameters are clock polarity and clock phase, respectively.
--------------------------------------------------------------------------------
-- VHDL DIALECT: VHDL '93
--
--------------------------------------------------------------------------------
-- PROJECT 	: General purpose
-- BOARD 	: General purpose
-- ENTITY 	: spi_master
--------------------------------------------------------------------
-- FILE 	: spi_master.vhd
--------------------------------------------------------------------------------
-- REVISION HISTORY:
-- REVISION  DATE 		 AUTHOR        COMMENT
-- --------  ----------  ------------  -----------
-- 1.0	     19.12.2019	 M.B.AYKENAR   INITIAL REVISION
--------------------------------------------------------------------------------
 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity spi_master is
generic (
	c_clkfreq 		: integer := 100_000_000;
	c_sclkfreq 		: integer := 1_000_000;
	c_cpol			: std_logic := '0';
	c_cpha			: std_logic := '0'
);
Port ( 
	clk_i 			: in  STD_LOGIC;
	en_i 			: in  STD_LOGIC;
	mosi_data_i 	: in  STD_LOGIC_VECTOR (7 downto 0);
	miso_data_o 	: out STD_LOGIC_VECTOR (7 downto 0);
	data_ready_o 	: out STD_LOGIC;
	cs_o 			: out STD_LOGIC;
	sclk_o 			: out STD_LOGIC;
	mosi_o 			: out STD_LOGIC;
	miso_i 			: in  STD_LOGIC
);
end spi_master;
 
architecture Behavioral of spi_master is
 
--------------------------------------------------------------------------------
-- CONSTANTS
constant c_edgecntrlimdiv2	: integer := c_clkfreq/(c_sclkfreq*2);
 
--------------------------------------------------------------------------------
-- INTERNAL SIGNALS
signal write_reg	: std_logic_vector (7 downto 0) 	:= (others => '0');	
signal read_reg		: std_logic_vector (7 downto 0) 	:= (others => '0');	
 
signal sclk_en		: std_logic := '0';
signal sclk			: std_logic := '0';
signal sclk_prev	: std_logic := '0';
signal sclk_rise	: std_logic := '0';
signal sclk_fall	: std_logic := '0';
 
signal pol_phase	: std_logic_vector (1 downto 0) := (others => '0');
signal mosi_en		: std_logic := '0';
signal miso_en		: std_logic := '0';
signal once         : std_logic := '0';
 
signal edgecntr		: integer range 0 to c_edgecntrlimdiv2 := 0;
 
signal cntr 		: integer range 0 to 15 := 0;
 
--------------------------------------------------------------------------------
-- STATE DEFINITIONS
type states is (S_IDLE, S_TRANSFER);
signal state : states := S_IDLE;
 
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
begin
 
pol_phase <= c_cpol & c_cpha;
 
--------------------------------------------------------------------------------
--    SAMPLE_EN process assigns mosi_en and miso_en internal signals to sclk_fall or sclk_rise in a combinational logic according to 
-- generic parameters of c_cpol and c_cpha via pol_phase signal.
P_SAMPLE_EN : process (pol_phase, sclk_fall, sclk_rise) begin
 
	case pol_phase is
 
		when "00" =>
 
			mosi_en <= sclk_fall;
			miso_en	<= sclk_rise;
 
		when "01" =>
 
			mosi_en <= sclk_rise;
			miso_en	<= sclk_fall;		
 
		when "10" =>
 
			mosi_en <= sclk_rise;
			miso_en	<= sclk_fall;			
 
		when "11" =>
 
			mosi_en <= sclk_fall;
			miso_en	<= sclk_rise;	
 
		when others =>
 
	end case;
 
end process P_SAMPLE_EN;
 
--------------------------------------------------------------------------------
--    RISEFALL_DETECT process assigns sclk_rise and sclk_fall signals in a combinational logic.
P_RISEFALL_DETECT : process (sclk, sclk_prev) begin
 
	if (sclk = '1' and sclk_prev = '0') then
		sclk_rise <= '1';
	else
		sclk_rise <= '0';
	end if;
 
	if (sclk = '0' and sclk_prev = '1') then
		sclk_fall <= '1';
	else
		sclk_fall <= '0';
	end if;	
 
end process P_RISEFALL_DETECT;
 
--------------------------------------------------------------------------------
--    In the MAIN process S_IDLE and S_TRANSFER states are implemented. state changes from S_IDLE to S_TRANSFER when en_i input
-- signal has the logic high value. At that cycle, write_reg signal is assigned to mosi_data_i input signal. According to c_cpha generic 
-- parameter, the transaction operation changes slightly. This operational difference is well explained in the paper that can be found
-- in Documents folder of the SPI, which is located in SVN server.
P_MAIN : process (clk_i) begin
if (rising_edge(clk_i)) then
 
    data_ready_o <= '0';
	sclk_prev	<= sclk;
 
	case state is
 
--------------------------------------------------------------------------------	
		when S_IDLE =>	
 
			cs_o			<= '1';
			mosi_o			<= '0';
			data_ready_o	<= '0';			
			sclk_en			<= '0';
			cntr			<= 0; 
 
			if (c_cpol = '0') then
				sclk_o	<= '0';
			else
				sclk_o	<= '1';
			end if;	
 
			if (en_i = '1') then
				state		<= S_TRANSFER;
				sclk_en		<= '1';
				write_reg	<= mosi_data_i;
				mosi_o		<= mosi_data_i(7);
				read_reg	<= x"00";
			end if;
 
--------------------------------------------------------------------------------			
		when S_TRANSFER =>		
 
			cs_o	<= '0';
			mosi_o	<= write_reg(7);
 
 
			if (c_cpha = '1') then	
 
				if (cntr = 0) then
					sclk_o	<= sclk;
					if (miso_en = '1') then
						read_reg(0)				<= miso_i;
						read_reg(7 downto 1) 	<= read_reg(6 downto 0);
						cntr					<= cntr + 1;
						once                    <= '1';
					end if;				
				elsif (cntr = 8) then
				    if (once = '1') then
				        data_ready_o	<= '1';
				        once            <= '0';				       
				    end if;					
					miso_data_o		<= read_reg;
					if (mosi_en = '1') then
						if (en_i = '1') then
							write_reg	<= mosi_data_i;
							mosi_o		<= mosi_data_i(7);	
							sclk_o		<= sclk;							
							cntr		<= 0;
						else
							state	<= S_IDLE;
							cs_o	<= '1';								
						end if;	
					end if;
				elsif (cntr = 9) then
					if (miso_en = '1') then
						state	<= S_IDLE;
						cs_o	<= '1';
					end if;						
				else
					sclk_o	<= sclk;
					if (miso_en = '1') then
						read_reg(0)				<= miso_i;
						read_reg(7 downto 1) 	<= read_reg(6 downto 0);
						cntr					<= cntr + 1;
					end if;
					if (mosi_en = '1') then
						mosi_o	<= write_reg(7);
						write_reg(7 downto 1) 	<= write_reg(6 downto 0);
					end if;
				end if;
 
			else	-- c_cpha = '0'
 
				if (cntr = 0) then
					sclk_o	<= sclk;					
					if (miso_en = '1') then
						read_reg(0)				<= miso_i;
						read_reg(7 downto 1) 	<= read_reg(6 downto 0);
						cntr					<= cntr + 1;
						once                    <= '1';
					end if;
				elsif (cntr = 8) then				
                    if (once = '1') then
                        data_ready_o    <= '1';
                        once            <= '0';                       
                    end if;
					miso_data_o		<= read_reg;
					sclk_o			<= sclk;
					if (mosi_en = '1') then
						if (en_i = '1') then
							write_reg	<= mosi_data_i;
							mosi_o		<= mosi_data_i(7);		
							cntr		<= 0;
						else
							cntr	<= cntr + 1;
						end if;	
						if (miso_en = '1') then
							state	<= S_IDLE;
							cs_o	<= '1';							
						end if;
					end if;		
				elsif (cntr = 9) then
					if (miso_en = '1') then
						state	<= S_IDLE;
						cs_o	<= '1';
					end if;
				else
					sclk_o	<= sclk;
					if (miso_en = '1') then
						read_reg(0)				<= miso_i;
						read_reg(7 downto 1) 	<= read_reg(6 downto 0);
						cntr					<= cntr + 1;
					end if;
					if (mosi_en = '1') then
						write_reg(7 downto 1) 	<= write_reg(6 downto 0);
					end if;
				end if;			
 
			end if;
 
	end case;
 
end if;
end process P_MAIN;
 
--------------------------------------------------------------------------------
--    In the SCLK_GEN process, internal sclk signal is generated if sclk_en signal is '1'. 
P_SCLK_GEN : process (clk_i) begin
if (rising_edge(clk_i)) then
 
	if (sclk_en = '1') then
		if edgecntr = c_edgecntrlimdiv2-1 then
			sclk 		<= not sclk;
			edgecntr	<= 0;
		else
			edgecntr	<= edgecntr + 1;
		end if;	
	else
		edgecntr	<= 0;
		if (c_cpol = '0') then
			sclk	<= '0';
		else
			sclk	<= '1';
		end if;
	end if;
 
end if;
end process P_SCLK_GEN;
 
end Behavioral;