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
USE ieee.std_logic_misc.all;

entity cdc_in is 
port (

	-- USB signals
	ifclk 		: in std_logic;
	faddr		: in std_logic_vector(1 downto 0);
	cdcin		: in std_logic_vector(1 downto 0);
	slwr		: out std_logic;
	pktend		: out std_logic;
	fdata		: out std_logic_vector(7 downto 0);
	cdc_in_free	: out std_logic;		

	-- EDID structure  
	edid0_byte		: in std_logic_vector(7 downto 0);
	edid0_byte_en 	: in std_logic;
	edid1_byte		: in std_logic_vector(7 downto 0);
	edid1_byte_en 	: in std_logic;
	
	-- status inputs
	resX0		: in std_logic_vector(15 downto 0);
	resY0		: in std_logic_vector(15 downto 0);
	resX1		: in std_logic_vector(15 downto 0);
	resY1		: in std_logic_vector(15 downto 0);
	jpeg_error	: in std_logic;	
	rgb_de0 	: in std_logic; -- to check activity on hdmi
	rgb_de1 	: in std_logic; -- to check activity on hdmi
	
	-- command signals
	status 				: in std_logic_vector(4 downto 0);
	usb_cmd				: in std_logic_vector(2 downto 0); -- UVCpayloadheader(0),  raw/jpeg(1), uvc on/off(2)
	jpeg_encoder_cmd	: in std_logic_vector(1 downto 0); -- encodingQuality(1 downto 0)	
	selector_cmd 		: in std_logic_vector(12 downto 0); -- (1:0 source ) (2 gray/color) (3 inverted/not-inverted) (4:5 blue depth) (6:7 green depth) (8:9 red depth) (10 blue on/off) (11 green on/off) (12 red on/off)
	hdmi_cmd			: in std_logic_vector(1 downto 0); -- if 1 then dvi else hdmi
	
	--debug
	debug_byte			: in  std_logic_vector(7 downto 0);
	debug_index			: out integer range 0 to 15;
  
  	-- clk,rst
	rst			: in std_logic;	
	clk 		: in std_logic
);
end entity cdc_in;

architecture rtl of cdc_in is

--------- components
COMPONENT edidram
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    clkb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;


COMPONENT cdcfifo
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    full : OUT STD_LOGIC;
    almost_full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    almost_empty : OUT STD_LOGIC
  );
END COMPONENT;


--------- Signals
signal edid_we : std_logic_vector(0 downto 0);
signal edid_write_data : std_logic_vector(7 downto 0);
signal edid_read_data : std_logic_vector(7 downto 0);

signal edid_write_add_edid0 : std_logic_vector(6 downto 0);
signal edid_write_add_edid1 : std_logic_vector(6 downto 0);
signal edid_write_add : std_logic_vector(7 downto 0);
signal edid_read_add : std_logic_vector(7 downto 0);

signal status_q : std_logic_vector(4 downto 0);
signal counter : std_logic_vector(8 downto 0);
signal working : std_logic;

signal din : std_logic_vector(7 DOWNTO 0);
signal wr_en : std_logic;
signal rd_en : std_logic;
signal dout : std_logic_vector(7 DOWNTO 0);
signal full : std_logic;
signal almost_full : std_logic;
signal empty : std_logic;
signal almost_empty : std_logic;
signal pktend_i : std_logic;


begin -- of architecture

debug_index <= conv_integer(unsigned(counter));
----------- Sync Logic

usbFifoProcess:process(rst,clk)
begin
if rst = '1' then
	working <= '0';
	counter <= (others => '0');
	edid_read_add <= (others => '0');
	
elsif rising_edge(clk) then
	wr_en <= '0';

	if working = '0' then
		working <= or_reduce(status);
		status_q <= status;
		counter <= (others=>'0');
		
	else -- write data to fifo
	
		counter <= counter + 1;				
	
		if status_q(0) = '1' then -- USB		
			wr_en <= '1';
			din <= ("00000" & usb_cmd);
			working <= '0';
			
		elsif status_q(1) = '1' then -- jpeg_encoder_cmd		
			wr_en <= '1';
			din <= ("000000" & jpeg_encoder_cmd);
			working <= '0';

		elsif status_q(2) = '1' then -- selector_cmd 		
			if counter = 0 then
				wr_en <= '1';
				din <= selector_cmd(7 downto 0);
			elsif counter = 1 then
				wr_en <= '1';
				din <= ("000" & selector_cmd(12 downto 8));
			elsif counter = 2 then
				working <= '0';
			end if;			
				
	
		elsif status_q(3) = '1' then -- hdmi_cmd_i
		
			
			if counter = 256 then
				wr_en <= '1';
				din <= ("000000" & hdmi_cmd);

			elsif counter = 257  then
				wr_en <= '1';
				din <= resX0(15 downto 8);

			elsif counter = 258 then
				wr_en <= '1';
				din <= resX0(7 downto 0);				
				
			elsif counter = 259 then
				wr_en <= '1';
				din <= resY0(15 downto 8);

			elsif counter =  260 then
				wr_en <= '1';
				din <= resY0(7 downto 0);				
				
			elsif counter =  261 then
				wr_en <= '1';
				din <= resX1(15 downto 8);

			elsif counter =  262 then
				wr_en <= '1';
				din <= resX1(7 downto 0);				
				
			elsif counter =  263 then
				wr_en <= '1';
				din <= resY1(15 downto 8);

			elsif counter =  264 then
				wr_en <= '1';
				din <= resY1(7 downto 0);				
				
			elsif counter = 265 then
				working <= '0';		
				
			else
				edid_read_add <= counter(7 downto 0);
				din <= edid_read_data;
				wr_en <= '1';
			end if;
		elsif status_q(4) = '1' then
			if counter = 14 then
				working <= '0';
			else
				wr_en <= '1';
				din <= debug_byte;
			end if;

		end if;	
		
	end if; -- if working = '0' then

	

end if;-- clk
end process usbFifoProcess;




usbProcess:process(rst,ifclk)
begin
if rst = '1' then
	cdc_in_free <= '1';
	rd_en <= '0';
	slwr <= '1';
	pktend <= '1';
	pktend_i <= '0';
elsif falling_edge(ifclk) then
	cdc_in_free <= '1';
	rd_en <= '0';
	slwr <= '1';
	pktend <= '1';
	pktend_i <= '0';
	fdata <= dout;
	
	if faddr = cdcin then
		if empty = '0' then
		
			cdc_in_free <= '0';
			rd_en <= '1';
			slwr <= '0';
			pktend_i <= '1';
		
		elsif pktend_i = '1' then
			pktend <= '0';
			cdc_in_free <= '0';
		end if;
	end if;

end if;
end process usbProcess;


edidprocess:process(rst,clk)
begin

if rst = '1' then

	edid_write_data <= (others => '0');
	edid_write_add <= (others => '0');
	edid_write_add_edid0 <= (others => '0');
	edid_write_add_edid1 <= (others => '0');
	edid_we <= "0";
	
elsif rising_edge(clk) then

	edid_we <= "0";

	if edid0_byte_en = '1' then
		
		edid_we <= "1";
		edid_write_data <= edid0_byte;
		edid_write_add <= ('0' & edid_write_add_edid0);
		edid_write_add_edid0 <= edid_write_add_edid0 + 1;

	elsif edid1_byte_en = '1' then
	
		edid_we <= "1";
		edid_write_data <= edid1_byte;
		edid_write_add <= ('1' & edid_write_add_edid1);
		edid_write_add_edid1 <= edid_write_add_edid1 + 1;	

	end if;
	
end if;

end process edidprocess;


--------- components
edidram_comp : edidram
  PORT MAP (
    clka => clk,
    wea => edid_we,
    addra => edid_write_add,
    dina => edid_write_data,
    clkb => clk,
    addrb => edid_read_add,
    doutb => edid_read_data
  );

cdcfifo_comp : cdcfifo
  PORT MAP (
    rst => rst,
    wr_clk => clk,
    rd_clk => ifclk,
    din => din,
    wr_en => wr_en,
    rd_en => rd_en,
    dout => dout,
    full => full,
    almost_full => almost_full,
    empty => empty,
    almost_empty => almost_empty
  );  

end architecture rtl;

