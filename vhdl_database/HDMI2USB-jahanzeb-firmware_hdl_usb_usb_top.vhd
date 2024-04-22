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

entity usb_top is
  port 
  (
	-- EDID structure  
	edid0_byte		: in std_logic_vector(7 downto 0);
	edid0_byte_en 	: in std_logic;
	edid1_byte		: in std_logic_vector(7 downto 0);
	edid1_byte_en 	: in std_logic;
	
	-- jpeg encoder
	jpeg_byte	: in std_logic_vector(7 downto 0);
	jpeg_clk 	: in std_logic;		
	jpeg_en		: in std_logic;		
	jpeg_fifo_full : out std_logic;	
	
	-- raw input 
	raw_en			: in std_logic;
	raw_bytes		: in std_logic_vector(23 downto 0);
	raw_fifo_full	: out std_logic;			
	raw_clk 		: in std_logic;
	
	-- cypress chip signals 
	fdata		: inout std_logic_vector(7 downto 0);
	flag_full 	: in std_logic;
	flag_empty 	: in std_logic;
	faddr		: out std_logic_vector(1 downto 0);
	slwr		: out std_logic;
	slrd		: out std_logic;
	sloe		: out std_logic;
	pktend		: out std_logic;
	ifclk		: in std_logic;
	
	-- status inputs
	resX_H0		: in std_logic_vector(15 downto 0);
	resY_H0		: in std_logic_vector(15 downto 0);
	resX_H1		: in std_logic_vector(15 downto 0);
	resY_H1		: in std_logic_vector(15 downto 0);	

	de_H0 		: in std_logic; -- to check activity on hdmi
	de_H1 		: in std_logic; -- to check activity on hdmi

	status 				: in std_logic_vector(4 downto 0);
	usb_cmd				: in std_logic_vector(2 downto 0); -- UVCpayloadheader(0),  raw/jpeg(1), uvc on/off(2)
	jpeg_encoder_cmd	: in std_logic_vector(1 downto 0); -- encodingQuality(1 downto 0)	
	selector_cmd 		: in std_logic_vector(12 downto 0); -- (1:0 source ) (2 gray/color) (3 inverted/not-inverted) (4:5 blue depth) (6:7 green depth) (8:9 red depth) (10 blue on/off) (11 green on/off) (12 red on/off)
	hdmi_cmd			: in std_logic_vector(1 downto 0); -- if 1 then dvi else hdmi

	uvc_rst				: in std_logic;	
	
	to_send 		: in std_logic_vector(23 downto 0);	
	cmd_en 			: out std_logic;
	cmd 			: out std_logic_vector(7 downto 0);
	
	--debug
	debug_byte  : in std_logic_vector(7 downto 0);
	debug_index : out integer range 0 to 15;
	eof_jpg     : out std_logic;

	-- clk,rst
	rst 		: in std_logic;	
	clk 		: in std_logic
  );
end entity usb_top;  

architecture rtl of usb_top is


----------- signals
constant cdcout : std_logic_vector(1 downto 0):= "00"; --ep 2
constant cdcin  : std_logic_vector(1 downto 0):= "01"; --ep 4
constant uvcin  : std_logic_vector(1 downto 0):= "10"; --ep 6

type states is (s_reset,s_cdc_in,s_cdc_out,s_uvc_in,s_cdc_in_w,s_cdc_out_w,s_uvc_in_w);
signal ps : states;

signal sloe_i : std_logic;
signal slrd_cdc : std_logic;
signal slwr_cdc : std_logic;
signal pktend_cdc : std_logic;
signal slwr_jpg_uvc : std_logic;
signal slwr_raw_uvc : std_logic;
signal pktend_jpg_uvc : std_logic;
signal pktend_raw_uvc : std_logic;


signal cdc_out_free : std_logic;
signal cdc_in_free : std_logic;
signal uvc_in_jpg_free : std_logic;
signal uvc_in_raw_free : std_logic;

signal fdatain : std_logic_vector(7 downto 0);
signal fdataout : std_logic_vector(7 downto 0);
signal fdataout_cdc : std_logic_vector(7 downto 0);
signal fdataout_jpg_uvc : std_logic_vector(7 downto 0);
signal fdataout_raw_uvc : std_logic_vector(7 downto 0);
signal faddr_i : std_logic_vector(1 downto 0);



signal jpg_uvc_error : std_logic;
signal raw_uvc_error : std_logic;




signal jpg_uvc_enable,raw_uvc_enable,uvc_enable,header : std_logic;

-- components signals 





begin  -- architecture
-- usb_cmd -- UVCpayloadheader(0),  raw/jpeg(1), uvc on/off(2)
sloe 			<= sloe_i;
faddr 			<= faddr_i;

jpg_uvc_enable <= usb_cmd(1) and usb_cmd(2);
raw_uvc_enable <= (not usb_cmd(1)) and usb_cmd(2);
uvc_enable <= usb_cmd(2);
header <= usb_cmd(0);


fdatain <= fdata;
fdata <= fdataout when sloe_i = '1' else "ZZZZZZZZ";

sloe_i <= '0' when (faddr_i = cdcout) else '1';

syncProc: process(rst,ifclk) -- usb process
begin -- process

if rst = '1' then		
	faddr_i		<= cdcout;
	slwr		<= '1';
	slrd		<= '1';
	pktend		<= '1';
	ps <= s_reset;
	fdataout <= (others => '0');
	
elsif falling_edge(ifclk) then

	slwr		<= '1';
	slrd		<= '1';
	pktend		<= '1';

	case ps is
	
	when s_reset =>
		faddr_i		<= cdcout;
		slwr		<= '1';
		slrd		<= '1';
		pktend		<= '1';
		ps 			<= s_cdc_out_w;
		fdataout 	<= (others => '0');

	when s_cdc_out_w =>
		ps <= s_cdc_out;

	when s_cdc_out =>
	slrd		<= slrd_cdc;
		if cdc_out_free = '1' then
			faddr_i	<= cdcin;			
			ps 		<= s_cdc_in_w;		
		end if;
	
	when s_cdc_in_w =>
		ps <= s_cdc_in;
		
	when s_cdc_in =>
	slwr		<= slwr_cdc;	
	pktend		<= pktend_cdc;
	fdataout	<= fdataout_cdc;
		if cdc_in_free = '1' then			
			if uvc_enable = '1' then
				faddr_i <= uvcin;
				ps 		<= s_uvc_in_w;

			else
				faddr_i 	<= cdcout;
				ps 		<= s_cdc_out_w;

			end if;
		end if;
		
	when s_uvc_in_w =>
		ps <= s_uvc_in;
	when s_uvc_in =>
	
		if usb_cmd(1) = '1' then -- jpeg encoder 
			slwr		<= slwr_jpg_uvc;	
			pktend		<= pktend_jpg_uvc;
			fdataout	<= fdataout_jpg_uvc;
				if uvc_in_jpg_free = '1' then
					faddr_i <= cdcout;
					ps 		<= s_cdc_out_w;	
				end if;
		else -- raw output 
			slwr		<= slwr_raw_uvc;	
			pktend		<= pktend_raw_uvc;
			fdataout	<= fdataout_raw_uvc;
				if uvc_in_raw_free = '1' then
					faddr_i <= cdcout;
					ps 		<= s_cdc_out_w;	
				end if;
		end if;
	
	when others =>
		ps <= s_reset;
	end case;

end if;

end process;

---------------------- components

cdc_out_comp: entity work.cdc_out
	port map(fdata        => fdatain,
		     flag_empty   => flag_empty,
		     faddr        => faddr_i,
		     cdcout       => cdcout,
		     slrd         => slrd_cdc,
		     cmd          => cmd,
		     cmd_en       => cmd_en,
		     cdc_out_free => cdc_out_free,
		     rst          => rst,
		     ifclk        => ifclk);

jpg_uvc_comp: entity work.jpg_uvc
	port map(jpeg_en        => jpeg_en,
		     jpeg_byte      => jpeg_byte,
		     jpeg_fifo_full => jpeg_fifo_full,
		     error          => jpg_uvc_error,
		     jpeg_clk       => jpeg_clk,
		     jpeg_enable    => jpg_uvc_enable,
		     slwr           => slwr_jpg_uvc,
		     pktend         => pktend_jpg_uvc,
		     fdata          => fdataout_jpg_uvc,
		     flag_full      => flag_full,
		     ifclk          => ifclk,
		     faddr          => faddr_i,
		     uvcin          => uvcin,
			 header 		=> header,
			  eof_jpg        => eof_jpg,			 
		     uvc_in_free    => uvc_in_jpg_free,
		     uvc_rst        => uvc_rst);
			 
raw_uvc_comp: entity work.raw_uvc
	port map(raw_en			=> raw_en,
			raw_bytes		=> raw_bytes,
			raw_fifo_full	=> raw_fifo_full,
			error			=> raw_uvc_error,
			raw_clk 		=> raw_clk,
			raw_enable		=> raw_uvc_enable,
			slwr			=> slwr_raw_uvc,
			pktend			=> pktend_raw_uvc,
			fdata			=> fdataout_raw_uvc,
			flag_full 		=> flag_full,
			ifclk			=> ifclk,
			faddr			=> faddr_i,
			uvcin			=> uvcin,
			header 			=> header,
			to_send 		=> to_send,
			uvc_in_free		=> uvc_in_raw_free,
			uvc_rst 		=> uvc_rst);

cdc_in_comp: entity work.cdc_in
	port map(ifclk            => ifclk,
		     faddr            => faddr_i,
		     cdcin            => cdcin,
		     slwr             => slwr_cdc,
		     pktend           => pktend_cdc,
		     fdata            => fdataout_cdc,
		     cdc_in_free      => cdc_in_free,
		     edid0_byte       => edid0_byte,
		     edid0_byte_en    => edid0_byte_en,
		     edid1_byte       => edid1_byte,
		     edid1_byte_en    => edid1_byte_en,
		     resX0            => resX_H0,
		     resY0            => resY_H0,
		     resX1            => resX_H1,
		     resY1            => resY_H1,
		     jpeg_error       => jpg_uvc_error,
		     rgb_de0          => de_H0,
		     rgb_de1          => de_H1,
		     status           => status,			 
			usb_cmd			  => usb_cmd,
			jpeg_encoder_cmd  => jpeg_encoder_cmd,
			selector_cmd 	  => selector_cmd,
			hdmi_cmd		  => hdmi_cmd,
			debug_byte      => debug_byte,
			debug_index     => debug_index,
			rst			      => rst,
			clk 		      => clk
			 );

end architecture; 
