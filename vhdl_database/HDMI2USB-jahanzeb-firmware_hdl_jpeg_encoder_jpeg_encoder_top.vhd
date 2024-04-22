-- //////////////////////////////////////////////////////////////////////////////
-- /// Copyright (c) 2013, Jahanzeb Ahmad
-- /// All rights reserved.
-- ///
-- // Redistribution and use in source and binary forms, with or without modification, 
-- /// are permitted provided that the following conditions are met:
-- ///
-- ///  * Redistributions of source code must retain the above copyright notice, 
-- ///    this list of conditions and the following disclaimer.
-- ///  * Redistributions in binary form must reproduce the above copyright notice, 
-- ///    this list of conditions and the following disclaimer in the documentation and/or 
-- ///    other materials provided with the distribution.
-- ///
-- ///    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
-- ///    EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
-- ///    OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
-- ///    SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
-- ///    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
-- ///    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
-- ///    PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
-- ///    WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
-- ///    ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
-- ///   POSSIBILITY OF SUCH DAMAGE.
-- ///
-- ///
-- ///  * http://opensource.org/licenses/MIT
-- ///  * http://copyfree.org/licenses/mit/license.txt
-- ///
-- //////////////////////////////////////////////////////////////////////////////

LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;		 
USE ieee.std_logic_unsigned.all;

entity jpeg_encoder_top is
port 
(
	clk                : in  std_logic;
	uvc_rst             : in  std_logic;
			
	-- IMAGE RAM
	iram_wdata         : in  std_logic_vector(23 downto 0);
	iram_wren          : in  std_logic;
	iram_fifo_afull    : out std_logic; 
	
	-- OUT RAM
	ram_byte           : out std_logic_vector(7 downto 0);
	ram_wren           : out std_logic;
	ram_wraddr         : out std_logic_vector(23 downto 0); -- not used, not required 
	outif_almost_full  : in  std_logic;
	
	resx 			   : in std_logic_vector(15  DOWNTO 0);
	resy			   : in std_logic_vector(15 DOWNTO 0);
	
	-- cmd 
	jpeg_encoder_cmd	: in std_logic_vector(1 downto 0); -- , encodingQuality(1 downto 0)
	enable 	: in std_logic;
	
	-- others
	start 				: in std_logic;
	done			   	: out std_logic;
	busy	   			: out std_logic;

	--debug signal
	frame_size			: out std_logic_vector(23 downto 0)
);
end entity jpeg_encoder_top;

architecture RTL of jpeg_encoder_top is


---------------------------------------------------------------------------------
component JpegEnc is
  port 
  (
        CLK                : in  std_logic;
        RST                : in  std_logic;
        
        -- OPB
        OPB_ABus           : in  std_logic_vector(31 downto 0);
        OPB_BE             : in  std_logic_vector(3 downto 0);
        OPB_DBus_in        : in  std_logic_vector(31 downto 0);
        OPB_RNW            : in  std_logic;
        OPB_select         : in  std_logic;
        OPB_DBus_out       : out std_logic_vector(31 downto 0);
        OPB_XferAck        : out std_logic;
        OPB_retry          : out std_logic;
        OPB_toutSup        : out std_logic;
        OPB_errAck         : out std_logic;
        
        --% IMAGE RAM
        iram_wdata         : in  std_logic_vector(23 downto 0);
        iram_wren          : in  std_logic;
        iram_fifo_afull    : out std_logic; 
        
        --% OUT RAM
        ram_byte           : out std_logic_vector(7 downto 0);
        ram_wren           : out std_logic;
        ram_wraddr         : out std_logic_vector(23 downto 0);
        outif_almost_full  : in  std_logic;

        -- debug signal
        frame_size         : out std_logic_vector(23 downto 0)

   );
end component JpegEnc;


------------------------------------------------------------------------

type ROMQ_TYPE is array (0 to 256-1) of std_logic_vector(7 downto 0);
  
constant qrom_lum : ROMQ_TYPE := 
(
-- 100%
X"01", X"01", X"01", X"01", X"01", X"01", X"01", X"01", 
X"01", X"01", X"01", X"01", X"01", X"01", X"01", X"01", 
X"01", X"01", X"01", X"01", X"01", X"01", X"01", X"01", 
X"01", X"01", X"01", X"01", X"01", X"01", X"01", X"01", 
X"01", X"01", X"01", X"01", X"01", X"01", X"01", X"01", 
X"01", X"01", X"01", X"01", X"01", X"01", X"01", X"01", 
X"01", X"01", X"01", X"01", X"01", X"01", X"01", X"01", 
X"01", X"01", X"01", X"01", X"01", X"01", X"01", X"01", 

-- 85%
X"05", X"03", X"04", X"04", X"04", X"03", X"05", X"04", 
X"04", X"04", X"05", X"05", X"05", X"06", X"07", X"0C",
X"08", X"07", X"07", X"07", X"07", X"0F", X"0B", X"0B", 
X"09", X"0C", X"11", X"0F", X"12", X"12", X"11", X"0F",
X"11", X"11", X"13", X"16", X"1C", X"17", X"13", X"14", 
X"1A", X"15", X"11", X"11", X"18", X"21", X"18", X"1A",
X"1D", X"1D", X"1F", X"1F", X"1F", X"13", X"17", X"22", 
X"24", X"22", X"1E", X"24", X"1C", X"1E", X"1F", X"1E",

-- 75%
X"08", X"06", X"06", X"07", X"06", X"05", X"08", X"07", 
X"07", X"07", X"09", X"09", X"08", X"0A", X"0C", X"14",
X"0D", X"0C", X"0B", X"0B", X"0C", X"19", X"12", X"13", 
X"0F", X"14", X"1D", X"1A", X"1F", X"1E", X"1D", X"1A",
X"1C", X"1C", X"20", X"24", X"2E", X"27", X"20", X"22", 
X"2C", X"23", X"1C", X"1C", X"28", X"37", X"29", X"2C",
X"30", X"31", X"34", X"34", X"34", X"1F", X"27", X"39", 
X"3D", X"38", X"32", X"3C", X"2E", X"33", X"34", X"32",   

-- 50%
X"10", X"0B", X"0C", X"0E", X"0C", X"0A", X"10", X"0E", 
X"0D", X"0E", X"12", X"11", X"10", X"13", X"18", X"28",
X"1A", X"18", X"16", X"16", X"18", X"31", X"23", X"25", 
X"1D", X"28", X"3A", X"33", X"3D", X"3C", X"39", X"33",
X"38", X"37", X"40", X"48", X"5C", X"4E", X"40", X"44", 
X"57", X"45", X"37", X"38", X"50", X"6D", X"51", X"57",
X"5F", X"62", X"67", X"68", X"67", X"3E", X"4D", X"71", 
X"79", X"70", X"64", X"78", X"5C", X"65", X"67", X"63"

);

constant qrom_chr : ROMQ_TYPE := 
(
-- 100%
X"01", X"01", X"01", X"01", X"01", X"01", X"01", X"01", 
X"01", X"01", X"01", X"01", X"01", X"01", X"01", X"01", 
X"01", X"01", X"01", X"01", X"01", X"01", X"01", X"01", 
X"01", X"01", X"01", X"01", X"01", X"01", X"01", X"01", 
X"01", X"01", X"01", X"01", X"01", X"01", X"01", X"01", 
X"01", X"01", X"01", X"01", X"01", X"01", X"01", X"01", 
X"01", X"01", X"01", X"01", X"01", X"01", X"01", X"01", 
X"01", X"01", X"01", X"01", X"01", X"01", X"01", X"01", 

-- 85%
X"08", X"06", X"06", X"07", X"06", X"05", X"08", X"07", 
X"07", X"07", X"09", X"09", X"08", X"0A", X"0C", X"14",
X"0D", X"0C", X"0B", X"0B", X"0C", X"19", X"12", X"13", 
X"0F", X"14", X"1D", X"1A", X"1F", X"1E", X"1D", X"1A",
X"1C", X"1C", X"20", X"24", X"2E", X"27", X"20", X"22", 
X"2C", X"23", X"1C", X"1C", X"28", X"37", X"29", X"2C",
X"30", X"31", X"34", X"34", X"34", X"1F", X"27", X"39", 
X"3D", X"38", X"32", X"3C", X"2E", X"33", X"34", X"32",

-- 75% chrominance
X"09", X"09", X"09", X"0C", X"0B", X"0C", X"18", X"0D", 
X"0D", X"18", X"32", X"21", X"1C", X"21", X"32", X"32", 
X"32", X"32", X"32", X"32", X"32", X"32", X"32", X"32", 
X"32", X"32", X"32", X"32", X"32", X"32", X"32", X"32", 
X"32", X"32", X"32", X"32", X"32", X"32", X"32", X"32", 
X"32", X"32", X"32", X"32", X"32", X"32", X"32", X"32", 
X"32", X"32", X"32", X"32", X"32", X"32", X"32", X"32", 
X"32", X"32", X"32", X"32", X"32", X"32", X"32", X"32",
 
-- 50% for chrominance
X"11", X"12", X"12", X"18", X"15", X"18", X"2F", X"1A", 
X"1A", X"2F", X"63", X"42", X"38", X"42", X"63", X"63",
X"63", X"63", X"63", X"63", X"63", X"63", X"63", X"63", 
X"63", X"63", X"63", X"63", X"63", X"63", X"63", X"63",
X"63", X"63", X"63", X"63", X"63", X"63", X"63", X"63", 
X"63", X"63", X"63", X"63", X"63", X"63", X"63", X"63",
X"63", X"63", X"63", X"63", X"63", X"63", X"63", X"63", 
X"63", X"63", X"63", X"63", X"63", X"63", X"63", X"63"
);

TYPE states is (s_reset,wait_for_enable,wait_for_start,write_lum_tables_wait,write_lum_tables,write_chr_tables_wait,write_res_reg,write_chr_tables,write_res_reg_done,write_start_reg,write_start_reg_done,write_reg_check_done,check_done);

SIGNAL ps	 	: states;

-- OPB
signal OPB_ABus      :   std_logic_vector(31 downto 0);
signal OPB_BE        :   std_logic_vector(3 downto 0);
signal OPB_DBus_in   :   std_logic_vector(31 downto 0);
signal OPB_RNW       :   std_logic;
signal OPB_select    :   std_logic;


signal OPB_DBus_out       :  std_logic_vector(31 downto 0);
signal OPB_XferAck        :  std_logic;
signal OPB_retry          :  std_logic;
signal OPB_toutSup        :  std_logic;
signal OPB_errAck       :  std_logic;
signal counter			: std_logic_vector(5 downto 0);

signal rst				: std_logic;
signal iram_wdata_i		: std_logic;

signal resx_q 	: std_logic_vector(15  DOWNTO 0);
signal resy_q 	: std_logic_vector(15 DOWNTO 0);

-- debug
signal frame_size_s     : std_logic_vector(23 downto 0);

begin


--- sync process -----------------------------------------
sync: PROCESS(clk,uvc_rst)
BEGIN
IF uvc_rst = '1' THEN
	ps <= s_reset;
	rst <= '1';
ELSIF rising_edge(clk) THEN
resx_q <= resx;
resy_q <= resy;

	CASE ps IS
	when s_reset => 
		
		counter <= (others => '0');
		OPB_ABus    <= (others => '0');
		OPB_BE      <= (others => '0');
		OPB_DBus_in <= (others => '0');
		OPB_RNW     <= '0';
		OPB_select  <= '0';	
		busy <= '0';
		done <= '1';
		rst <= '1';
		ps <= wait_for_enable;

		
	
	when wait_for_enable =>		
		if enable = '1' then
			ps <= write_lum_tables;
			rst <= '0';
		end if;	
	

	when write_lum_tables =>	
		counter 	<= counter + 1;
		OPB_select  <= '1';
		OPB_ABus    <= X"0000_0100" + counter*X"04";
		OPB_RNW     <= '0';
		OPB_BE      <= X"F";
		OPB_DBus_in <= X"0000_00" & (qrom_lum(conv_integer((jpeg_encoder_cmd(1 downto 0) & counter))));
		ps <= write_lum_tables_wait;

	when write_lum_tables_wait =>
		if OPB_XferAck /= '1' then
		else
			OPB_ABus   	<= (others => '0');
			OPB_BE      <= (others => '0');
			OPB_DBus_in <= (others => '0');
			OPB_RNW     <= '0';
			OPB_select  <= '0';
			if counter = 0 then
				ps <= write_chr_tables;
				counter <= (others =>'0');
			else
				ps <= write_lum_tables;				
			end if;	
		end if;


	when write_chr_tables =>
		counter 	<= counter + 1;
		OPB_select  <= '1';
		OPB_ABus    <= X"0000_0200" + counter*X"04";
		OPB_RNW     <= '0';
		OPB_BE      <= X"F";
		OPB_DBus_in <= X"0000_00" & (qrom_chr(conv_integer((jpeg_encoder_cmd(0 downto 0) & counter))));
		ps <= write_chr_tables_wait;

	when write_chr_tables_wait =>
		if OPB_XferAck /= '1' then
		else
			OPB_ABus   	<= (others => '0');
			OPB_BE      <= (others => '0');
			OPB_DBus_in <= (others => '0');
			OPB_RNW     <= '0';
			OPB_select  <= '0';			
			if counter = 0 then
				ps <= wait_for_start;
			else
				ps <= write_chr_tables;
			end if;	
		end if;


	when wait_for_start =>
		if start = '1' then
			OPB_select  <= '1';
			OPB_ABus    <= X"0000_0004";
			OPB_RNW     <= '0';
			OPB_BE      <= X"F";
			busy 		<= '1';
			done 		<= '0';
			OPB_DBus_in <= resx_q & resy_q;
			ps <= write_res_reg_done;
		end if;

	when write_res_reg_done => 
		if OPB_XferAck /= '1' then			
		else
			OPB_ABus   	<= (others => '0');
			OPB_BE      <= (others => '0');
			OPB_DBus_in <= (others => '0');
			OPB_RNW     <= '0';
			OPB_select  <= '0';	
			ps <= write_start_reg;
		end if;

	when write_start_reg =>
		OPB_select  <= '1';
		OPB_ABus    <= X"0000_0000";
		OPB_RNW     <= '0';
		OPB_BE      <= X"F";
		OPB_DBus_in <= X"0000_0007"; -- RGB= 11, sof= 1, 
		ps <= write_start_reg_done;


	when write_start_reg_done => 
		if OPB_XferAck /= '1' then			
		else
			OPB_ABus   	<= (others => '0');
			OPB_BE      <= (others => '0');
			OPB_DBus_in <= (others => '0');
			OPB_RNW     <= '0';
			OPB_select  <= '0';	
			ps <= write_reg_check_done;
		end if;
		  
	when write_reg_check_done =>
		ps <= check_done;
		OPB_select  <= '1';
		OPB_ABus    <= X"0000_000C";
		OPB_RNW     <= '1';
		OPB_BE      <= X"F";
				
	when check_done =>	
		if OPB_XferAck /= '1' then
		else
			if OPB_DBus_out = X"0000_0002" then
				ps <= s_reset;
				done <= '1';
				busy <= '0';
				frame_size <= frame_size_s;
			else
				OPB_ABus   	<= (others => '0');
				OPB_BE      <= (others => '0');
				OPB_DBus_in <= (others => '0');
				OPB_RNW     <= '0';
				OPB_select  <= '0';				
				ps <= write_reg_check_done;
			end if;

		end if;
		
	WHEN OTHERS =>
		ps <= s_reset;
		
	END CASE;

END IF;
END PROCESS sync;

iram_wdata_i <= iram_wren and enable;


-------------------------------------------------------------
jpegencoder: JpegEnc port map
(
--debug signal
frame_size         => frame_size_s,

CLK                => clk,
RST                => rst,

-- OPB
OPB_ABus           => OPB_ABus,
OPB_BE             => OPB_BE,
OPB_DBus_in        => OPB_DBus_in,
OPB_RNW            => OPB_RNW,
OPB_select         => OPB_select,
OPB_DBus_out       => OPB_DBus_out,
OPB_XferAck        => OPB_XferAck,
OPB_retry          => OPB_retry,
OPB_toutSup        => OPB_toutSup,
OPB_errAck         => OPB_errAck,

-- IMAGE RAM
iram_wdata         => iram_wdata,
iram_wren          => iram_wdata_i,
iram_fifo_afull    => iram_fifo_afull,

-- OUT RAM
ram_byte           => ram_byte,
ram_wren           => ram_wren,
ram_wraddr         => ram_wraddr,
outif_almost_full  => outif_almost_full
);


end architecture RTL; 

