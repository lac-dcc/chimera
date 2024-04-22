-- Midway 8080 main board
-- 9.984MHz Clock
--
-- Version : 0242
--
-- Copyright (c) 2002 Daniel Wallner (jesus@opencores.org)
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-- The latest version of this file can be found at:
--      http://www.fpgaarcade.com
--
-- Limitations :
--
-- File history :
--
--      0241 : First release
--
--      0242 : Removed the ROM
--
--      0300 : MikeJ tidyup for audio release
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mw8080 is
	port(
		Rst_n           : in  std_logic;
		Clk             : in  std_logic;
		ENA             : out std_logic;
		RWE_n           : out std_logic;
		RDB             : in  std_logic_vector(7 downto 0);
		RAB             : out std_logic_vector(12 downto 0);
		Sounds          : out std_logic_vector(7 downto 0);
		Ready           : out std_logic;
		GDB             : in  std_logic_vector(7 downto 0);
		IB              : in  std_logic_vector(7 downto 0);
		DB              : out std_logic_vector(7 downto 0);
		AD              : out std_logic_vector(15 downto 0);
		Status          : out std_logic_vector(7 downto 0);
		Systb           : out std_logic;
		Int             : out std_logic;
		Hold_n          : in  std_logic;
		IntE            : out std_logic;
		DBin_n          : out std_logic;
		Vait            : out std_logic;
		HldA            : out std_logic;
		Sample          : out std_logic;
		Wr              : out std_logic;
		RED             : out std_logic;
		GREEN           : out std_logic;
		BLUE            : out std_logic;
		HSync           : out std_logic;
		VSync           : out std_logic;
		VBlank          : out std_logic;
		HBlank          : out std_logic;
		VShift		    : in  std_logic_vector(3 downto 0);
		HShift		    : in  std_logic_vector(3 downto 0)
		);
end mw8080;

architecture struct of mw8080 is

	signal Ready_i      : std_logic;
	signal Hold         : std_logic;
	signal IntTrig      : std_logic;
	signal IntTrigOld   : std_logic;
	signal Int_i        : std_logic;
	signal IntE_i       : std_logic;
	signal DBin         : std_logic;
	signal Sync         : std_logic;
	signal Wr_n, Rd_n   : std_logic;
	signal ClkEnCnt     : unsigned(2 downto 0);
	signal Status_i     : std_logic_vector(7 downto 0);
	signal A            : std_logic_vector(15 downto 0);
	signal ISel         : std_logic_vector(1 downto 0);
	signal DI           : std_logic_vector(7 downto 0);
	signal DO           : std_logic_vector(7 downto 0);
	signal RR           : std_logic_vector(9 downto 0);

	signal VidEn        : std_logic;
	signal CntD5        : unsigned(3 downto 0); -- Horizontal counter / 320
	signal CntE5        : unsigned(4 downto 0); -- Horizontal counter 2
	signal CntE6        : unsigned(3 downto 0); -- Vertical counter / 262
	signal CntE7        : unsigned(4 downto 0); -- Vertical counter 2
	signal Shift        : std_logic_vector(7 downto 0);
	signal HSync_Start  :  std_logic_vector(8 downto 0);
	signal HSync_End    :  std_logic_vector(8 downto 0);
	signal VSync_Start  :  std_logic_vector(8 downto 0);
	signal VSync_End    :  std_logic_vector(8 downto 0);
	
	signal Video        : std_logic;
	signal col_ram_do   : std_logic_vector(7 downto 0);
	
begin
	ENA <= ClkEnCnt(2);
	Status <= Status_i;
	Ready <= Ready_i;
	DB <= DO;
	Systb <= Sync;
	Int <= Int_i;
	Hold <= not Hold_n;
	IntE <= IntE_i;
	DBin_n <= not DBin;
	Sample <= not Wr_n and Status_i(4);
	Wr <= not Wr_n;
	AD <= A;
	Sounds(0) <= CntE7(3);
	Sounds(1) <= CntE7(2);
	Sounds(2) <= CntE7(1);
	Sounds(3) <= CntE7(0);
	Sounds(4) <= CntE6(3);
	Sounds(5) <= CntE6(2);
	Sounds(6) <= CntE6(1);
	Sounds(7) <= CntE6(0);

	IntTrig <= (not CntE7(2) nand CntE7(3)) nand not CntE7(4);

	ISel(0) <= Status_i(0) nor (Status_i(6) nor A(13));
	ISel(1) <= Status_i(0) nor Status_i(6);

	with ISel select
		DI <= "110" & CntE7(2) & not CntE7(2) & "111" when "00",
			GDB when "01",
			IB when "10",
			RR(7 downto 0) when others;

	RWE_n <= Wr_n or not (RR(8) xor RR(9)) or not CntD5(2);
	RAB <= A(12 downto 0) when CntD5(2) = '1' else
		std_logic_vector(CntE7(3 downto 0) & CntE6(3 downto 0) & CntE5(3 downto 0) & CntD5(3));

	u_8080: entity work.T8080se
		generic map (
			Mode => 2,
			T2Write => 1)
		port map (
			RESET_n => Rst_n,
			CLK => Clk,
			CLKEN => ClkEnCnt(2),
			READY => Ready_i,
			HOLD => Hold,
			INT => Int_i,
			INTE => IntE_i,
			DBIN => DBin,
			SYNC => Sync,
			VAIT => Vait,
			HLDA => HLDA,
			WR_n => Wr_n,
			A => A,
			DI => DI,
			DO => DO);

	-- Clock enables
	process (Rst_n, Clk)
	begin
		if Rst_n = '0' then
			ClkEnCnt <= "000";
			VidEn <= '0';
		elsif Clk'event and Clk = '1' then
			VidEn <= not VidEn;
			if ClkEnCnt = 4 then
				ClkEnCnt <= "000";
			else
				ClkEnCnt <= ClkEnCnt + 1;
			end if;
		end if;
	end process;

	-- Glue
	process (Rst_n, Clk)
		variable OldASEL : std_logic;
	begin
		if Rst_n = '0' then
			Status_i <= (others => '0');
			IntTrigOld <= '0';
			Int_i <= '0';
			OldASEL := '0';
			Ready_i <= '0';
			RR <= (others => '0');
		elsif Clk'event and Clk = '1' then
			-- E3
			-- Interrupt
			IntTrigOld <= IntTrig;
			if Status_i(0) = '1' then
				Int_i <= '0';
			elsif IntTrigOld = '0' and IntTrig = '1' then
				Int_i <= IntE_i;
			end if;

			-- D7
			-- Status register
			if Sync = '1' then
				Status_i <= DO;
			end if;

			-- A3, C3, E3
			-- RAM register/ready logic
			if Sync = '1' and A(13) = '1' then
				Ready_i <= '0';
			elsif Ready_i = '1' then
				Ready_i <= '1';
			else
				Ready_i <= RR(9);
			end if;
			if Sync = '1' and A(13) = '1' then
				RR <= (others => '0');
			elsif (CntD5(2) = '1' and OldASEL = '0') or                                 -- ASEL pos edge
				(CntD5(2) = '0' and OldASEL = '1' and RR(8) = '1') then -- ASEL neg edge
				RR(7 downto 0) <= RDB;
				RR(8) <= '1';
				RR(9) <= RR(8);
			end if;
			OldASEL := CntD5(2);
		end if;
	end process;

	-- Video counters
	process (Rst_n, Clk)
	begin
		if Rst_n = '0' then
			CntD5 <= (others => '0');
			CntE5 <= (others => '0');
			CntE6 <= (others => '0');
			CntE7 <= (others => '0');
		elsif Clk'event and Clk = '1' then
			if VidEn = '1' then
				CntD5 <= CntD5 + 1;
				if CntD5 = 15 then

					CntE5 <= CntE5 + 1;
					if CntE5(3 downto 0) = 15 then
						if CntE5(4) = '0' then
							CntE5 <= "11100";

							CntE6 <= CntE6 + 1;
							if CntE6 = 15 then

								CntE7 <= CntE7 + 1;
								if CntE7(3 downto 0) = 15 then
									if CntE7(4) = '0' then
										CntE6 <= "1010";
										CntE7 <= "11101";
									else
										CntE7 <= "00010";
									end if;
								end if;
							end if;
						end if;
					else
					end if;
				end if;
			end if;
		end if;
	end process;

	-- Video shift register
	process (Rst_n, Clk)
	begin
		if Rst_n = '0' then
			Shift <= (others => '0');
			Video <= '0';
		elsif Clk'event and Clk = '1' then
			if VidEn = '1' then
				if CntE7(4) = '0' and CntE5(4) = '0' and CntD5(2 downto 0) = "011" then
					Shift(7 downto 0) <= RDB(7 downto 0);
				else
					Shift(6 downto 0) <= Shift(7 downto 1);
					Shift(7) <= '0';
				end if;
				Video <= Shift(0);
			end if;
		end if;
	end process;

	-- Sync
	
	process (HShift, VShift, Rst_n)
	begin
		-- Defaults are centred on my CRT
		HSync_Start <= std_logic_vector(469 + resize(signed(HShift),9));
		HSync_End   <= std_logic_vector(485 + resize(signed(HShift),9));
		VSync_Start <= std_logic_vector(484 + resize(signed(VShift),9));
		VSync_End   <= std_logic_vector(488 + resize(signed(VShift),9));	
	end process;
	
	process (Rst_n, Clk)
		variable TimeH, TimeV : std_logic_vector(8 downto 0);
	begin
		if Rst_n = '0' then

			HSync <= '1';
			VSync <= '1';
			HBlank <='1';
			VBlank <='1';

		elsif Clk'event and Clk = '1' then
		
			if VidEn = '1' then
			
				-- Convert SI counters into single fields to make comparisons easier
				
				TimeH := std_logic_vector(CntE5(4 downto 0)) & std_logic_vector(CntD5(3 downto 0));
				TimeV := std_logic_vector(CntE7(4 downto 0)) & std_logic_vector(CntE6(3 downto 0));
				
				-- Syncs
				
				if (TimeH = HSync_Start) then
					HSync <= '0';
				elsif (TimeH = HSync_End) then
					HSync <= '1';
				end if;

				if (TimeV = VSync_Start) then
					VSync <= '0';
				elsif (TimeV = VSync_End) then
					VSync <= '1';
				end if;

				-- Blanks
				
				if (TimeH = 	"000000101") then
					HBlank <= '0';
				elsif (TimeH = "111001001") then
					HBlank <= '1';
				end if;

				if (TimeV = 	"011111111") then
					VBlank <= '1';
				elsif (TimeV = "111111111") then
					VBlank <= '0';
				end if;
				
			end if;

		end if;
end process;

--COLRAM: entity work.spram
--	generic map(
--		addr_width_g => 10,
--		data_width_g => 8)
--	port map(
--		address => RAM_A10 & RAM_A9 & RAM_A8 & RAM_A7 & RAM_A6 & RAM_A3 & RAM_A2 & RAM_A1 & RAM_A0 & RAM_A4,
--		clken =>  '1',-- CS RAM_A11
--		clock => Clk,
--		data => "111111111",
--		wren => Wr,
--		q => col_ram_do
--	);


	RED <= video;-- or col_ram_do(2);
	GREEN <= video;-- or col_ram_do(1);
	BLUE <= video;-- or col_ram_do(0);



end;
