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


-- 
-- Adds 
-- U = usb/uvc
-- J = jpeg encoder
-- S = source selector
-- H = Hdmi


LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;		 
USE ieee.std_logic_unsigned.all;



entity controller is
port
(
	status 				: out std_logic_vector(4 downto 0);
	usb_cmd				: out std_logic_vector(2 downto 0); -- UVCpayloadheader(0),  raw/jpeg(1), uvc on/off(2)
	jpeg_encoder_cmd	: out std_logic_vector(1 downto 0); -- encodingQuality(1 downto 0)	
	selector_cmd 		: out std_logic_vector(12 downto 0); -- (1:0 source ) (2 gray/color) (3 inverted/not-inverted) (4:5 blue depth) (6:7 green depth) (8:9 red depth) (10 blue on/off) (11 green on/off) (12 red on/off)
	HB_on		        : out std_logic;
	uart_rd			: out std_logic;
	uart_rx_empty  : in std_logic;
        uart_din       : in std_logic_vector(7 downto 0);
        uart_clk       : in std_logic;
        usb_or_uart    : in std_logic;	
	hdmi_cmd			: out std_logic_vector(1 downto 0); -- if 1 then dvi else hdmi	
	hdmi_dvi			: in std_logic_vector(1 downto 0); -- if 1 then dvi else hdmi	
	rdy_H				: in std_logic_vector(1 downto 0);	
	btnu				: in std_logic;
	btnd				: in std_logic;
	btnl				: in std_logic;
	btnr				: in std_logic;	
	uvc_rst				: out std_logic;	
	cmd_byte 			: in  std_logic_vector(7 downto 0);
	cmd_en 				: in std_logic;
	rst 				: in std_logic;
	ifclk 				: in std_logic;
	clk					: in std_logic
);
end entity;

ARCHITECTURE rtl OF controller is

COMPONENT cmdfifo
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    full : OUT STD_LOGIC;
    almost_full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    almost_empty : OUT STD_LOGIC;
    valid : OUT STD_LOGIC
  );
END COMPONENT;


signal usb_cmd_i			: std_logic_vector(2 downto 0); -- UVCpayloadheader(0),  raw/jpeg(1), uvc on/off(2)
signal jpeg_encoder_cmd_i	: std_logic_vector(1 downto 0); -- encodingQuality(1 downto 0)	
signal selector_cmd_i 		: std_logic_vector(12 downto 0); -- (1:0 source ) (2 gray/color) (3 inverted/not-inverted) (4:5 blue depth) (6:7 green depth) (8:9 red depth) (10 blue on/off) (11 green on/off) (12 red on/off)
signal HB_on_i			: std_logic;
signal hdmi_cmd_i			: std_logic_vector(1 downto 0); -- if 1 then dvi else hdmi
signal hdmi_dvi_q			: std_logic_vector(1 downto 0); -- if 1 then dvi else hdmi



signal counter			: std_logic_vector(7 downto 0);




signal cmd :  STD_LOGIC_VECTOR(7 DOWNTO 0);
signal add :  STD_LOGIC_VECTOR(7 DOWNTO 0);

signal rd_en :  STD_LOGIC;
signal dout :  STD_LOGIC_VECTOR(15 DOWNTO 0);
signal full :  STD_LOGIC;
signal almost_full :  STD_LOGIC;
signal empty :  STD_LOGIC;
signal almost_empty :  STD_LOGIC;
signal valid :  STD_LOGIC;
signal uvc_rst_i :  STD_LOGIC;
signal vsync_q :  STD_LOGIC;
signal vsync_rising_edge :  STD_LOGIC;
signal pressed :  STD_LOGIC;
signal toggle :  STD_LOGIC;
signal uart_rd_s : STD_LOGIC;
signal empty_s : STD_LOGIC;
signal fifo_din : STD_LOGIC_VECTOR(7 downto 0);
signal fifo_clk : STD_LOGIC;
signal fifo_wr : STD_LOGIC;


begin

-- comb logic 
usb_cmd <= usb_cmd_i;
jpeg_encoder_cmd <= jpeg_encoder_cmd_i;
selector_cmd <= selector_cmd_i;
hdmi_cmd <= hdmi_cmd_i;
HB_on <= HB_on_i;

-- CMD Decoder
process(rst,clk)
begin
if rst = '1' then


	usb_cmd_i					<= "001";  --   uvc on/off(2) raw/jpeg(1) UVCpayloadheader(0)
	jpeg_encoder_cmd_i			<= "00"; -- encodingQuality(1 downto 0)	
	selector_cmd_i(3 downto 0) 	<= "0111"; -- (1:0 source ) (2 gray/color) (3 inverted/not-inverted) 
	selector_cmd_i(12 downto 4) <= "111000000"; --(4:5 blue depth) (6:7 green depth) (8:9 red depth) (10 blue on/off) (11 green on/off) (12 red on/off)
	HB_on_i						<= '1';
	hdmi_cmd_i					<= "11"; -- if 1 then dvi else hdmi
	uvc_rst_i 					<= '1';
	pressed 					<= '0';
	hdmi_dvi_q 					<= "00";
	status 						<= (others => '0');	
	toggle 						<= '0';
	counter 					<= (others => '0');

elsif rising_edge(clk) then


	if uvc_rst_i = '1' then
		uvc_rst <= '1';
		counter <= (others => '0');
		toggle 	<= '1';
	else
		counter <= counter+1;
	end if;
	
	if counter = (counter'range => '1')  and toggle = '1' then
		uvc_rst <= '0';
		toggle 	<= '0';
	end if;
	
	uvc_rst_i <= '0';		
	status <= (others => '0');
	rd_en <= '0';	
	hdmi_dvi_q <= hdmi_dvi;
	
	if (hdmi_dvi_q(0) xor hdmi_dvi(0)) = '1' then 
		hdmi_cmd_i(0) <= hdmi_dvi(0);
	end if;
	
	if (hdmi_dvi_q(1) xor hdmi_dvi(1)) = '1' then 
		hdmi_cmd_i(1) <= hdmi_dvi(1);
	end if;
	

	
	if btnd = '1' and pressed = '0' then
		uvc_rst_i <= '1';
		selector_cmd_i(1 downto 0) <= "11"; 
		pressed <= '1';
	else
		pressed <= '0';
	end if;
		
	if btnl = '1' and pressed = '0' and rdy_H(1) = '1' then
		uvc_rst_i <= '1';
		selector_cmd_i(1 downto 0) <= "01"; 
		pressed <= '1';
	else
		pressed <= '0';
	end if;
		
	if btnu = '1' and pressed = '0' and rdy_H(0) = '1' then
		uvc_rst_i <= '1';
		selector_cmd_i(1 downto 0) <= "00"; 
		pressed <= '1';
	else
		pressed <= '0';
	end if;
	
	
	if empty = '0' and rd_en = '0' then 
		
		rd_en <= '1';
		case add is
			when X"55" | X"75" => -- U UVC/USB / UVCpayloadheader(0),  raw/jpeg(1), uvc on/off(2)
				case cmd is 
					when  X"4a" | X"6a" => -- J j
						usb_cmd_i(1) <= '1';
						uvc_rst_i <= '1';
					when X"52" | X"72" => -- Rr
						usb_cmd_i(1) <= '0';
						uvc_rst_i <= '1';
					when X"4e" | X"6e" => -- N n (on)
						usb_cmd_i(2) <= '1';
						uvc_rst_i <= '1';
					when X"46" | X"66" => -- Ff (off)
						usb_cmd_i(2) <= '0';
						uvc_rst_i <= '1';
					when X"56" | X"76" => -- V v (video) header on 
						usb_cmd_i(0) <= '1';					
						uvc_rst_i <= '1';
					when X"49" | X"69" => -- I i (image) header off 
						usb_cmd_i(0) <= '0';					
						uvc_rst_i <= '1';						
					when X"53" | X"73" => -- Status
						status(0) <= '1';
					when X"48" | X"68" => -- H 
						uvc_rst_i <= '1';						
						if    (selector_cmd_i(1 downto 0) = "00") then -- hdmi 0
							hdmi_cmd_i(0) <= '0'; -- HDMI
						elsif (selector_cmd_i(1 downto 0) = "01") then -- hdmi 1
							hdmi_cmd_i(1) <= '0'; -- HDMI
						end if;			
						
					when X"44" | X"64" => -- D  
						uvc_rst_i <= '1';						
						if    (selector_cmd_i(1 downto 0) = "00") then -- hdmi 0
							hdmi_cmd_i(0) <= '1'; -- DVI
						elsif (selector_cmd_i(1 downto 0) = "01") then -- hdmi 1
							hdmi_cmd_i(1) <= '1'; -- DVI
						end if;
					
					when others => 
				end case;
			
			when X"4a" | X"6a" => -- J Jpeg
				case cmd is 				
					when X"53" | X"73" => -- Status
						status(1) <= '1';
					when X"30" =>  -- quality 100 % 
						jpeg_encoder_cmd_i(1 downto 0) <= "00";
					when X"31" =>  -- quality 85%
						jpeg_encoder_cmd_i(1 downto 0) <= "01";
					when X"32" =>  -- quality 75%
						jpeg_encoder_cmd_i(1 downto 0) <= "10";
					when X"33" =>  -- quality 50%
						jpeg_encoder_cmd_i(1 downto 0) <= "11";						
					when others => 
				end case;

			when X"48" | X"68" => -- H Hdmi	
				case cmd is 				
					when X"53" | X"73" => -- Status
						status(3) <= '1';
					when X"30" =>  -- Force HDMI 0 to 720p
						hdmi_cmd_i(0) <= '0';
						uvc_rst_i <= '1';
					when X"31" =>  -- Force HDMI 0 to 1024
						hdmi_cmd_i(0) <= '1';
						uvc_rst_i <= '1';
					when X"32" =>  -- Force HDMI 1 to 720p
						hdmi_cmd_i(1) <= '0';
						uvc_rst_i <= '1';
					when X"33" =>  -- Force HDMI 1 to 1024
						hdmi_cmd_i(1) <= '1';
						uvc_rst_i <= '1';
					when others => 
				end case;
				
			when X"53" | X"73" => -- S Source Selector
				case cmd is 	-- (1:0 source ) (2 gray/color) (3 inverted/not-inverted) (4:5 blue depth) (6:7 green depth) (8:9 red depth) (10 blue on/off) (11 green on/off) (12 red on/off)
					when X"53" | X"73" => -- Status
						status(2) <= '1';					
					when X"55" | X"75" => -- U button force source to HDMI0
						if rdy_H(0) = '1' then
							selector_cmd_i(1 downto 0) <= "00";
							uvc_rst_i <= '1';
						end if;
					when X"4c" | X"6c" => -- L button force source to HDMI1
						if rdy_H(1) = '1' then
							selector_cmd_i(1 downto 0) <= "01";
							uvc_rst_i <= '1';
						end if;
					when X"52" | X"72" => -- V button force source to VGA
						-- selector_cmd_i(1 downto 0) <= "10";
					when X"44" | X"64" => -- D button force source to test pattern
						selector_cmd_i(1 downto 0) <= "11";
						uvc_rst_i <= '1';
					when X"47" | X"67" => -- Froce Gray
						selector_cmd_i(2) <= '0';
					when X"43" | X"63" => -- Froce Color
						selector_cmd_i(2) <= '1';
					when X"49" | X"69" => -- Invert Color					
						selector_cmd_i(3) <= not selector_cmd_i(3);
					when X"48" | X"68" => -- Heart Beat On/Off
						HB_on_i <= not HB_on_i;
					when others => 					
				end case;			
			
			-- RGB (4:5 blue depth) (6:7 green depth) (8:9 red depth) (10 blue on/off) (11 green on/off) (12 red on/off)
			when X"52" | X"72" => -- Red 	
				case cmd is
					when X"4e" | X"6e" => -- N n (on)
						selector_cmd_i(12) <= '1';
					when X"46" | X"66" => -- Ff (off)
						selector_cmd_i(12) <= '0';			
					when X"30" => 
						selector_cmd_i(9 downto 8) <= "00";			
					when X"31" => 
						selector_cmd_i(9 downto 8) <= "01";			
					when X"32" => 
						selector_cmd_i(9 downto 8) <= "10";			
					when X"33" => 
						selector_cmd_i(9 downto 8) <= "11";	
					when others => 	
				end case;
			when X"47" | X"67" => -- Green (4:5 blue depth) (6:7 green depth) (8:9 red depth) (10 blue on/off) (11 green on/off) (12 red on/off)
				case cmd is
					when X"4e" | X"6e" => -- N n (on)
						selector_cmd_i(11) <= '1';
					when X"46" | X"66" => -- Ff (off)
						selector_cmd_i(11) <= '0';			
					when X"30" => 
						selector_cmd_i(7 downto 6) <= "00";			
					when X"31" => 
						selector_cmd_i(7 downto 6) <= "01";			
					when X"32" => 
						selector_cmd_i(7 downto 6) <= "10";			
					when X"33" => 
						selector_cmd_i(7 downto 6) <= "11";	
					when others => 	
				end case;			
			when X"42" | X"62" => -- Blue
				case cmd is
					when X"4e" | X"6e" => -- N n (on)
						selector_cmd_i(10) <= '1';
					when X"46" | X"66" => -- Ff (off)
						selector_cmd_i(10) <= '0';			
					when X"30" => 
						selector_cmd_i(5 downto 4) <= "00";			
					when X"31" => 
						selector_cmd_i(5 downto 4) <= "01";			
					when X"32" => 
						selector_cmd_i(5 downto 4) <= "10";			
					when X"33" => 
						selector_cmd_i(5 downto 4) <= "11";	
					when others =>
				end case;
			when X"44" | X"64" => --Debug
				case cmd  is
					when X"53" | X"73" => --Status
						status(4) <= '1';
					when others =>
				end case;
					
			when others =>		
		end case; -- case add		
	end if; -- cmd_en 	
	
end if; -- clk
end process;

uart_rd <= uart_rd_s;

uart_ctrl : process(uart_clk, uart_rx_empty, empty_s)
begin
if rst = '1' then
	uart_rd_s <= '0';
elsif rising_edge(uart_clk) then
	empty_s <= uart_rx_empty;
end if;
if empty_s = '1' and uart_rx_empty = '0' then
		uart_rd_s <= '1';
end if;
if empty_s = uart_rx_empty then
		uart_rd_s <= '0';
end if;
end process;		

fifo_mux: process(usb_or_uart, uart_rd_s, cmd_en, uart_din, cmd_byte, uart_clk, ifclk)
begin
if usb_or_uart = '0' then
	fifo_din <= cmd_byte;
	fifo_wr <= cmd_en;
	fifo_clk <= ifclk;
else
	fifo_din <= uart_din;
	fifo_wr <= uart_rd_s;
	fifo_clk <= uart_clk;
end if;
end process;

cmd <= dout(7 downto 0);
add <= dout(15 downto 8);

cmdfifo_comp : cmdfifo
  PORT MAP (
    rst => rst,
    wr_clk => fifo_clk,
    rd_clk => clk,
    din => fifo_din, 
    wr_en => fifo_wr,
    rd_en => rd_en,
    dout => dout,
    full => full,
    almost_full => almost_full,
    empty => empty,
    almost_empty => almost_empty,
    valid => valid
  );


END ARCHITECTURE;
