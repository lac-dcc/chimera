----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:06:36 06/20/2020 
-- Design Name: 
-- Module Name:    Mapper - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SPI is
	  Port ( 
	   DIN : in  STD_LOGIC_VECTOR (7 downto 0);
	   DOUT : out  STD_LOGIC_VECTOR (7 downto 0);
	   RS: in std_logic_vector(1 downto 0);
	   RWB: in std_logic;
	   CS: in std_logic;	-- includes clock
	   
	   serin: in std_logic;
	   serout: out std_logic;
	   serclk: out std_logic;
	   sersel: out std_logic_vector(2 downto 0);	   -- 8 combinations (0= none)
	   spiclk : in std_logic;
	   spislowclk : in std_logic;
	   
	   ipl: in std_logic;
	   reset : in std_logic
	 );
end SPI;

architecture Behavioral of SPI is

	signal sr: std_logic_vector(7 downto 0);	-- rx/tx shift register
	signal txd: std_logic_vector(7 downto 0);	-- tx data register
	signal sel: std_logic_vector(2 downto 0);	
	signal stat: std_logic_vector(3 downto 0);	-- phase counter
	
	signal cpol: std_logic;				-- clock polarity
	signal cpha: std_logic;				-- clock phase
	
	signal start_rx: std_logic;
	signal run_sr_d: std_logic;
	signal run_sr: std_logic;
	signal txd_valid: std_logic;			-- txd is full
	signal ack_txd: std_logic;			-- ack txd is now taken and empty
	signal ack_rxtx: std_logic;
	signal serin_d: std_logic;
	
	signal spiclk_int: std_logic;
	
	function To_Std_Logic(L: BOOLEAN) return std_ulogic is
	begin
		if L then
			return('1');
		else
			return('0');
		end if;
	end function To_Std_Logic;
	
begin
	
	spiclk_int <= spiclk when sel(2) = '0' or sel(0) = '0' else
			spislowclk;
		
	-- read registers
	read_p: process (rs, rwb, cs, sr, sel, cpol, cpha, run_sr, txd_valid, start_rx, ack_rxtx, ipl, reset)
	begin
		if (reset = '1') then
			start_rx <= '0';
		elsif (ack_rxtx = '1') then
			start_rx <= '0';
		elsif (falling_edge(cs) and rwb = '1' and rs = "01") then
			start_rx <= '1';
		end if;

		if (ipl = '1') then
			DOUT <= sr;
		elsif (cs = '1' and rwb = '1') then
			case rs is
			when "00" =>
				DOUT(7) <= run_sr or txd_valid;
				DOUT(6) <= txd_valid;
				DOUT(5) <= cpol;
				DOUT(4) <= cpha;
				DOUT(3) <= '0';
				DOUT(2 downto 0) <= sel(2 downto 0);
			when "01" =>
				DOUT <= sr;
			when "10" =>
				DOUT <= sr;
			when others =>
				DOUT <= (others => '0');
			end case;
		else
			DOUT <= (others => '0');
		end if;
	end process;
	
	write_p: process (rs, rwb, cs, ack_txd, reset)
	begin
		if (reset = '1') then
			txd_valid <= '0';
		elsif (ack_txd = '1') then
			txd_valid <= '0';
		elsif (falling_edge(cs) 
			-- with falling memclk
			and rs = "01"
			and rwb = '0') then
			txd_valid <= '1';
		end if;
		
		if (reset = '1') then
			sel <= (others => '0');
			txd <= (others => '0');
			cpol <= '0';
			cpha <= '0';
		elsif (falling_edge(cs) 
			and rwb = '0') then
			
			case rs is
			when "00" =>
				cpol <= DIN(5);
				cpha <= DIN(4);
				sel <= DIN(2 downto 0);
			when "01" =>
				txd <= DIN;
			when others => 
				null;
			end case;
		end if;	
	end process;
	
	sersel <= sel;
	
	rxtx_p: process(sr, spiclk_int, serin, ack_rxtx, reset)
	begin
		if (reset = '1') then
			stat <= (others => '0');
			ack_txd <= '0';
			run_sr <= '0';
		elsif (rising_edge(spiclk_int)) then
			-- with rising memclk

			ack_txd <= '0';
			
			-- load SR
			if (run_sr_d = '0' and txd_valid = '1') then
				ack_txd <= '1';
				sr <= txd;
				run_sr <= '1';

			elsif (run_sr_d = '0' and start_rx = '1') then
				run_sr <= '1';
				
			elsif (ipl = '1' or run_sr_d = '1') then

				if (stat(0) = '0') then
					-- sample at rising edge of spiclk
					serin_d <= serin;
				end if;
				
				if (stat(0) = '1') then
					-- falling edge of spiclk
					sr(7) <= sr(6);
					sr(6) <= sr(5);
					sr(5) <= sr(4);
					sr(4) <= sr(3);
					sr(3) <= sr(2);
					sr(2) <= sr(1);
					sr(1) <= sr(0);
					sr(0) <= serin_d;
				end if;

				if (stat = "1111") then
					run_sr <= '0';
				end if;
				
				stat <= stat + 1;

			end if;
		end if;
	end process;
	
	ack_p: process(spiclk_int, stat)
	begin
		if (falling_edge(spiclk_int)) then
			run_sr_d <= run_sr; -- or run_rx;
			if (stat = "1111") then
				ack_rxtx <= '1';
			else 
				ack_rxtx <= '0';
			end if;
		end if;
	end process;
	
	serout <= sr(7);
	serclk <= stat(0) xor cpol xor (run_sr and cpha);
	
end Behavioral;

