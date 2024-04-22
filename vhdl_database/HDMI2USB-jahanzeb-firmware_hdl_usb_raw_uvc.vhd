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

entity raw_uvc is 
port (

	-- raw signals
	raw_en			: in std_logic;
	raw_bytes		: in std_logic_vector(23 downto 0);

	raw_fifo_full	: out std_logic;		
	error			: out std_logic;		
	raw_clk 		: in std_logic;
	raw_enable		: in std_logic;
	
	-- USB signals
	slwr		: out std_logic;
	pktend		: out std_logic;
	fdata		: out std_logic_vector(7 downto 0);
	flag_full 	: in std_logic;
	ifclk		: in std_logic;
	faddr		: in std_logic_vector(1 downto 0);
	uvcin		: in std_logic_vector(1 downto 0);	
	header 		: in std_logic;
	to_send		: in std_logic_vector(23 downto 0);
		
  	-- others
	uvc_in_free	: out std_logic;		
	uvc_rst 	: in std_logic
);
end entity raw_uvc;

architecture rtl of raw_uvc is

COMPONENT rawUVCfifo
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
    full : OUT STD_LOGIC;
    almost_full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    almost_empty : OUT STD_LOGIC;	
    valid : OUT STD_LOGIC;
	prog_full : OUT STD_LOGIC
  );
END COMPONENT;


signal fid : std_logic;
signal eof : std_logic;


signal total_send: std_logic_vector(23 downto 0);
signal dout: std_logic_vector(23 downto 0);
signal wrightcount: std_logic_vector(11 downto 0);
signal watchdog: std_logic_vector(5 downto 0);
signal count: std_logic_vector(1 downto 0);
signal raw_en_i : std_logic;


signal full,empty,almost_empty,valid,rd_en : std_logic;

type states is (wait_for_uvc,uvc_wait,uvc_in_pktend,uvc_send_data,s_reset,free_uvc,s_skip);
signal ps : states;


begin



syncProc: process(uvc_rst,ifclk)
begin

if uvc_rst = '1' then		
	slwr		<= '1';
	pktend		<= '1';
	rd_en	<= '0';
	fid			<= '0';
	uvc_in_free	<= '1';	
	wrightcount <= (others => '0');	
	watchdog <= (others => '0');	
	ps <= s_reset;

	eof <= '0';
elsif falling_edge(ifclk) then

	slwr		<= '1';
	pktend		<= '1';
	rd_en 	<= '0';

	case ps is
	when s_reset =>
		slwr		<= '1';
		pktend		<= '1';
		rd_en		<= '0';
		fid			<= '0';
		uvc_in_free	<= '1';	
		ps 			<= wait_for_uvc;
		fdata 		<= (others => '0');
		watchdog 	<= (others => '0');
		wrightcount <= (others => '0');	
		total_send 	<= (others => '0');	
		count 		<= (others => '0');	
		

	when wait_for_uvc =>
		if  faddr = uvcin and raw_enable = '1' then
			ps <= uvc_wait;			
			uvc_in_free	<= '0';				
		end if;
		
	when uvc_send_data =>

	
		if empty = '0' and flag_full = '1' then 
			
			wrightcount <= wrightcount +1; 
			
			if header = '1' then 
				if wrightcount = X"400" then		
						ps <= uvc_wait;
						wrightcount <= (others => '0');
				elsif wrightcount = X"000" then
					slwr		<= '0';
					fdata <= X"0C"; -- header length

				elsif wrightcount = X"001" then	
					slwr		<= '0';
					
					fdata <= ( "100000" & eof & fid ); -- EOH  ERR  STI  RES  SCR  PTS  EOF  FID						
					eof <= '0';
					
					
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

				else -- header sent 
					

					total_send <= total_send + 1;												
					if total_send = to_send then
						fid 	<= not fid;
						ps <= uvc_in_pktend;						
						wrightcount <= (others => '0');
						total_send <= (others => '0');						
					else					
						slwr		<= '0';						
						count <= count+1;
						if count = "00" then							
							fdata <= dout(7 downto 0);													
						elsif count = "01" then
							fdata <= dout(15 downto 8);
							rd_en <= '1';	
						elsif count = "10" then							
							fdata <= dout(7 downto 0);																				
						else
							fdata <= dout(23 downto 16);
							rd_en <= '1';											
						end if;					
					end if; -- to_send
					
					if (total_send = to_send - 1012) then
						eof <= '1';
					end if;						
				end if;
			
			else -- if header not send 
			
				if wrightcount = X"400" then		
						ps <= uvc_wait;
						wrightcount <= (others => '0');			

				else
					
					total_send <= total_send + 1;							
					
					if total_send = to_send then
						fid 	<= not fid;
						ps <= uvc_in_pktend;
						wrightcount <= (others => '0');
						total_send <= (others => '0');						
					else					
						slwr		<= '0';						
						count <= count+1;
						if count = "00" then							
							fdata <= dout(7 downto 0);													
						elsif count = "01" then
							fdata <= dout(15 downto 8);
							rd_en <= '1';	
						elsif count = "10" then							
							fdata <= dout(7 downto 0);																				
						else
							fdata <= dout(23 downto 16);
							rd_en <= '1';											
						end if;				
					end if; -- to_send
					
				end if;			-- end if header
			end if; -- end if empty
			
		-- else
			-- ps <= uvc_wait;
		end if;	

	
	when uvc_wait =>		
		watchdog <= watchdog + 1;		
		if empty = '0' and flag_full = '1' then
			ps 	<= uvc_send_data;
			watchdog <= (others => '0');			
		elsif watchdog(watchdog'range) = (watchdog'range => '1') then
			ps 		<= free_uvc;	
			watchdog <= (others => '0');	
		end if;
		
	when uvc_in_pktend =>		
		pktend	<= '0';		
		ps 		<= free_uvc;
		
	when free_uvc =>
		uvc_in_free	<= '1';	
		ps <= s_skip;
		
	when s_skip =>	
		ps <= wait_for_uvc;		
	
	when others =>
		ps <= s_reset;
	end case;

end if;

end process;

raw_en_i <= (raw_en and raw_enable);

rawUVCfifo_Comp : rawUVCfifo
PORT MAP (
	rst => uvc_rst,
	wr_clk => raw_clk,
	rd_clk => ifclk,
	din => raw_bytes,
	wr_en => raw_en_i,
	rd_en => rd_en,
	dout => dout,
	full => full,
	-- almost_full => raw_fifo_full,
	prog_full => raw_fifo_full,
	empty => empty,
	almost_empty => almost_empty,
	valid => valid
);




end rtl;