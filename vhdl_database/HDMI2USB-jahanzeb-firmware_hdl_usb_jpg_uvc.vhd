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

entity jpg_uvc is 
port (
	-- Jpeg signals
	jpeg_en			: in std_logic;
	jpeg_byte		: in std_logic_vector(7 downto 0);
	jpeg_fifo_full	: out std_logic;		
	error			: out std_logic;		
	jpeg_clk 		: in std_logic;
	jpeg_enable		: in std_logic;
	
	-- USB signals
	slwr		: out std_logic;
	pktend		: out std_logic;
	fdata		: out std_logic_vector(7 downto 0);
	flag_full 	: in std_logic;
	ifclk		: in std_logic;
	faddr		: in std_logic_vector(1 downto 0);
	uvcin		: in std_logic_vector(1 downto 0);	
	header 		: in std_logic;

  	-- others
	eof_jpg     : out std_logic;
	uvc_in_free	: out std_logic;		
	uvc_rst		: in std_logic
);
end entity jpg_uvc;

architecture rtl of jpg_uvc is

COMPONENT bytefifo
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
    overflow : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    almost_empty : OUT STD_LOGIC;
    underflow : OUT STD_LOGIC;
	prog_full : OUT STD_LOGIC

  );
END COMPONENT;

COMPONENT bytefifoFPGA
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
    overflow : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    almost_empty : OUT STD_LOGIC;
    underflow : OUT STD_LOGIC;
    prog_full : OUT STD_LOGIC	
  );
END COMPONENT;


--signal rst : std_logic;

signal jpeg_rd_en : std_logic;
signal jpeg_fifo_empty : std_logic;
signal jpeg_fifo_empty_i : std_logic;
--signal jpeg_fifo_almost_empty : std_logic;
signal eof : std_logic;
signal pkt_sent : std_logic;
signal fid : std_logic;
signal jpeg_rd_wr_en : std_logic;
signal jpeg_fifo_full_i : std_logic;
signal jpeg_en_i : std_logic;

signal jpeg_fdata: std_logic_vector(7 downto 0);
signal temp: std_logic_vector(7 downto 0);
signal jpeg_byte_i: std_logic_vector(7 downto 0);


signal jpeg_byte_q: std_logic_vector(7 downto 0);
signal jpeg_byte_q_q: std_logic_vector(7 downto 0);
signal wrightcount: std_logic_vector(11 downto 0);
signal watchdog: std_logic_vector(5 downto 0);

signal underflow1,underflow2,overflow1,overflow2 : std_logic;

type states is (wait_for_uvc,uvc_wait,uvc_in_pktend,uvc_send_data,s_reset,free_uvc,s_skip);
signal ps : states;


begin

error <= overflow1 or underflow1 or overflow2 or underflow2;

syncProc: process(uvc_rst,ifclk)
begin

if uvc_rst = '1' then		
	slwr		<= '1';
	pktend		<= '1';
	jpeg_rd_en	<= '0';
	fid			<= '0';
	pkt_sent 	<= '0';	
	uvc_in_free	<= '1';	
	wrightcount <= (others => '0');	
	watchdog <= (others => '0');	
	temp <= (others => '0');	
	ps <= s_reset;
elsif falling_edge(ifclk) then

	slwr		<= '1';
	pktend		<= '1';
	jpeg_rd_en 	<= '0';


	case ps is
	when s_reset =>
		slwr		<= '1';
		pktend		<= '1';
		jpeg_rd_en	<= '0';
		fid			<= '0';
		pkt_sent 	<= '0';	
		uvc_in_free	<= '1';	
		ps 			<= wait_for_uvc;
		fdata 	<= (others => '0');
		temp 	<= (others => '0');
		watchdog 	<= (others => '0');
		wrightcount <= (others => '0');	
	when wait_for_uvc =>
		if  faddr = uvcin and jpeg_enable = '1' then
			ps <= uvc_wait;			
			uvc_in_free	<= '0';	
		end if;
		
	when uvc_send_data =>
	
		if jpeg_fifo_empty_i = '0' and flag_full = '1' then 
			
			wrightcount <= wrightcount +1; 
			
			if header = '1' then 
				if wrightcount = X"400" then		
						ps <= uvc_wait;
						wrightcount <= (others => '0');
				elsif wrightcount = X"000" then
					slwr		<= '0';
					fdata <= X"0C"; -- header length
					pkt_sent <= '0';	

				elsif wrightcount = X"001" then	
					slwr		<= '0';
					fdata <= ( "100" & "000" & eof & fid ); -- EOH  ERR  STI  RES  SCR  PTS  EOF  FID
					
				elsif wrightcount = X"002" then	
					slwr		<= '0';
					fdata <= X"00";

				elsif wrightcount = X"003" then	
					slwr		<= '0';
					fdata <= X"00";

				elsif wrightcount = X"004" then	
					slwr		<= '0';
					fdata <= X"00";

				elsif wrightcount = X"005" then	
					slwr		<= '0';
					fdata <= X"00";

				elsif wrightcount = X"006" then	
					slwr		<= '0';
					fdata <= X"00";

				elsif wrightcount = X"007" then	
					slwr		<= '0';
					fdata <= X"00";

				elsif wrightcount = X"008" then	
					slwr		<= '0';
					fdata <= X"00";

				elsif wrightcount = X"009" then	
					slwr		<= '0';
					fdata <= X"00";

				elsif wrightcount = X"00A" then	
					slwr		<= '0';
					fdata <= X"00";


				elsif wrightcount = X"00B" then	
					slwr		<= '0';
					fdata <= X"00";

				else

					slwr		<= '0';
					jpeg_rd_en	<= '1';					
					temp <= jpeg_fdata;
					fdata <= jpeg_fdata;								
					if temp = X"FF" and jpeg_fdata = X"D9" then
						fid 	<= not fid;
						ps <= uvc_in_pktend;
						pkt_sent <= '1';
						wrightcount <= (others => '0');
					end if;
						
				end if;
			else 
				if wrightcount = X"400" then		
					ps <= uvc_wait;
					wrightcount <= (others => '0');
				else

					slwr		<= '0';
					jpeg_rd_en	<= '1';					
					temp <= jpeg_fdata;
					fdata <= jpeg_fdata;								
					if temp = X"FF" and jpeg_fdata = X"D9" then
						fid 	<= not fid;
						ps <= uvc_in_pktend;
						pkt_sent <= '1';
						wrightcount <= (others => '0');
					end if;						
				end if;			
			end if;		
		end if;	

	
	when uvc_wait =>
		
		watchdog <= watchdog + 1;
		
		if jpeg_fifo_full_i = '1' and flag_full = '1' then
			ps 	<= uvc_send_data;			
		elsif watchdog(watchdog'range) = (watchdog'range => '1') then
			ps 		<= free_uvc;		
		end if;
		
	when uvc_in_pktend =>		
		pktend	<= '0';
		ps 		<= free_uvc;
		

	
	when free_uvc =>
		ps 		<= s_skip;
		uvc_in_free	<= '1';	

	when s_skip =>		
		ps 		<= wait_for_uvc;
	
	when others =>
		ps <= s_reset;
	end case;

end if;

end process;

eof_jpg <= eof;

eofprocess: process(uvc_rst,ifclk)
begin

if uvc_rst = '1' then	
	eof <= '0';	
	jpeg_byte_q <= (others => '0');
	jpeg_byte_q_q <= (others => '0');

elsif falling_edge(ifclk) then

	jpeg_byte_q <= jpeg_byte_i;
	jpeg_byte_q_q <= jpeg_byte_q;
	
	if pkt_sent = '1' then
		eof <= '0';	
	elsif (jpeg_byte_q_q = X"FF" and jpeg_byte_q = X"D9" ) then
		eof <= '1';			
	end if;


end if;
end process;

jpeg_en_i <= jpeg_en and jpeg_enable;

bytefifo_encoder: bytefifoFPGA port map(
rst => uvc_rst,
wr_clk => jpeg_clk,
rd_clk => ifclk,
din => jpeg_byte,
wr_en => jpeg_en_i,
rd_en => jpeg_rd_wr_en,
dout => jpeg_byte_i,
empty => jpeg_fifo_empty,
-- almost_full => jpeg_fifo_full, -- bug in jpeg core  even after aserting fifo fill it transmits couple of bytes gets transmitted
prog_full => jpeg_fifo_full,
overflow => overflow1,
underflow => underflow1
);

process(uvc_rst,ifclk)
begin
if uvc_rst = '1' then
	jpeg_rd_wr_en <= '0';
elsif falling_edge(ifclk) then
	jpeg_rd_wr_en <= '0';
	if jpeg_fifo_empty = '0' and jpeg_fifo_full_i = '0' then
		jpeg_rd_wr_en <= '1';
	end if;
end if;
end process;

bytefifo_usb: bytefifo port map(
rst => uvc_rst,
wr_clk => ifclk,
rd_clk => ifclk,
din => jpeg_byte_i,
wr_en => jpeg_rd_wr_en,
rd_en => jpeg_rd_en,
dout => jpeg_fdata,
empty => jpeg_fifo_empty_i,
--full => jpeg_fifo_full_i,
prog_full => jpeg_fifo_full_i, -- 1012 bytes are needed in fifo not 1024 because 12 are header.
overflow => overflow2,
underflow => underflow2
);


end rtl;