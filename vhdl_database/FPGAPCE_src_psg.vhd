library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity psg is
	port (
		CLK 	: in std_logic;
		CLKEN	: in std_logic;
		RESET_N	: in std_logic;

		-- CPU Interface
		DI		: in std_logic_vector(7 downto 0);
		A 		: in std_logic_vector(3 downto 0);
		WE		: in std_logic;
		
		-- DAC Interface
		DAC_LATCH	: in std_logic;
		LDATA		: out std_logic_vector(23 downto 0);
		RDATA		: out std_logic_vector(23 downto 0)
	);
end psg;

architecture rtl of psg is

-- R0 - Channel Selection
signal CHSEL	: std_logic_vector(2 downto 0);
-- R1 - Main Volume Adjustement
signal LMAL		: std_logic_vector(3 downto 0);
signal RMAL		: std_logic_vector(3 downto 0);

-- R2-R7 - Channel specific registers
type wavedata_t is array(0 to 31) of std_logic_vector(4 downto 0);
type chan_t is
	record
		-- Registers
		FREQ	: std_logic_vector(11 downto 0);
		DDA		: std_logic;
		CHON	: std_logic;
		AL		: std_logic_vector(4 downto 0);
		LAL		: std_logic_vector(3 downto 0);
		RAL		: std_logic_vector(3 downto 0);
		
		NG_FREQ	: std_logic_vector(4 downto 0);
		NE		: std_logic;

		-- Waveform generator
		WF_DATA	: wavedata_t;
		WF_ADDR	: std_logic_vector(4 downto 0);
		WF_CNT	: std_logic_vector(12 downto 0);

		WF_RES	: std_logic;
		WF_INC	: std_logic;
		
		-- Noise generator
		LFSR	: std_logic_vector(17 downto 0);
		NG_CNT	: std_logic_vector(12 downto 0);
		
		-- Outputs
		DA_OUT	: std_logic_vector(4 downto 0);
		WF_OUT	: std_logic_vector(4 downto 0);
		NG_OUT	: std_logic_vector(4 downto 0);
		-- Global output
		GL_OUT	: std_logic_vector(4 downto 0);
	end record;
type chanarray_t is array(0 to 5) of chan_t;
signal CH		: chanarray_t;

-- R8 - LFO Frequency
signal LFO_FREQ	: std_logic_vector(7 downto 0);
signal LFCTL	: std_logic_vector(1 downto 0);
signal LFTRG	: std_logic;

signal LFO_CNT	: std_logic_vector(7 downto 0);

-- Channels mixing
signal LACC		: std_logic_vector(23 downto 0);
signal RACC		: std_logic_vector(23 downto 0);

signal VT_ADDR	: std_logic_vector(11 downto 0);
signal VT_DATA	: std_logic_vector(23 downto 0);

type mix_t is ( MIX_WAIT, MIX_LREAD, MIX_LREAD2, MIX_LNEXT, MIX_RREAD, MIX_RREAD2, MIX_RNEXT, MIX_END );
signal MIX		: mix_t;
signal MIX_CNT	: std_logic_vector(2 downto 0);

signal LDATA_FF	: std_logic_vector(23 downto 0);
signal RDATA_FF	: std_logic_vector(23 downto 0);

begin

-- CPU Interface
process( CLK )
begin
	if rising_edge( CLK ) then
	
		-- for i in 0 to 5 loop
			-- CH(i).WF_RES <= '0';
			-- CH(i).WF_INC <= '0';
		-- end loop;
CH(0).WF_RES <= '0';
CH(0).WF_INC <= '0';
CH(1).WF_RES <= '0';
CH(1).WF_INC <= '0';
CH(2).WF_RES <= '0';
CH(2).WF_INC <= '0';
CH(3).WF_RES <= '0';
CH(3).WF_INC <= '0';
CH(4).WF_RES <= '0';
CH(4).WF_INC <= '0';
CH(5).WF_RES <= '0';
CH(5).WF_INC <= '0';
	
		if RESET_N = '0' then
			
			CHSEL <= (others => '0');			
			LMAL <= (others => '0');
			RMAL <= (others => '0');
			
			-- for i in 0 to 5 loop
				-- CH(i).FREQ <= (others => '0');
				-- CH(i).DDA <= '0';
				-- CH(i).CHON <= '0';
				-- CH(i).LAL <= (others => '0');
				-- CH(i).RAL <= (others => '0');
				
				-- CH(i).NG_FREQ <= (others => '0');
				-- CH(i).NE <= '0';
				
				-- CH(i).DA_OUT <= (others => '0');
			-- end loop;

CH(0).FREQ <= (others => '0');
CH(0).DDA <= '0';
CH(0).CHON <= '0';
CH(0).AL <= (others => '0');
CH(0).LAL <= (others => '0');
CH(0).RAL <= (others => '0');
CH(0).DA_OUT <= (others => '0');

CH(1).FREQ <= (others => '0');
CH(1).DDA <= '0';
CH(1).CHON <= '0';
CH(1).AL <= (others => '0');
CH(1).LAL <= (others => '0');
CH(1).RAL <= (others => '0');
CH(1).DA_OUT <= (others => '0');

CH(2).FREQ <= (others => '0');
CH(2).DDA <= '0';
CH(2).CHON <= '0';
CH(2).AL <= (others => '0');
CH(2).LAL <= (others => '0');
CH(2).RAL <= (others => '0');
CH(2).DA_OUT <= (others => '0');

CH(3).FREQ <= (others => '0');
CH(3).DDA <= '0';
CH(3).CHON <= '0';
CH(3).AL <= (others => '0');
CH(3).LAL <= (others => '0');
CH(3).RAL <= (others => '0');
CH(3).DA_OUT <= (others => '0');

CH(4).FREQ <= (others => '0');
CH(4).DDA <= '0';
CH(4).CHON <= '0';
CH(4).AL <= (others => '0');
CH(4).LAL <= (others => '0');
CH(4).RAL <= (others => '0');
CH(4).NG_FREQ <= (others => '0');
CH(4).NE <= '0';
CH(4).DA_OUT <= (others => '0');

CH(5).FREQ <= (others => '0');
CH(5).DDA <= '0';
CH(5).CHON <= '0';
CH(5).AL <= (others => '0');
CH(5).LAL <= (others => '0');
CH(5).RAL <= (others => '0');
CH(5).NG_FREQ <= (others => '0');
CH(5).NE <= '0';
CH(5).DA_OUT <= (others => '0');
			
			LFO_FREQ <= (others => '0');
			LFCTL <= "00";
			LFTRG <= '0';
			
		else
			if WE = '1' then
				case A is
				when "0000" =>
					CHSEL <= DI(2 downto 0);
				when "0001" =>
					LMAL <= DI(7 downto 4);
					RMAL <= DI(3 downto 0);
				when "0010" =>
					-- if CHSEL >= 0 and CHSEL <= 5 then
						-- CH(conv_integer(CHSEL)).FREQ(7 downto 0) <= DI;
					-- end if;
					case CHSEL is
					when "000" => CH(0).FREQ(7 downto 0) <= DI;
					when "001" => CH(1).FREQ(7 downto 0) <= DI;
					when "010" => CH(2).FREQ(7 downto 0) <= DI;
					when "011" => CH(3).FREQ(7 downto 0) <= DI;
					when "100" => CH(4).FREQ(7 downto 0) <= DI;
					when "101" => CH(5).FREQ(7 downto 0) <= DI;
					when others => null;
					end case;
				when "0011" =>
					-- if CHSEL >= 0 and CHSEL <= 5 then
						-- CH(conv_integer(CHSEL)).FREQ(11 downto 8) <= DI(3 downto 0);
					-- end if;
					case CHSEL is
					when "000" => CH(0).FREQ(11 downto 8) <= DI(3 downto 0);
					when "001" => CH(1).FREQ(11 downto 8) <= DI(3 downto 0);
					when "010" => CH(2).FREQ(11 downto 8) <= DI(3 downto 0);
					when "011" => CH(3).FREQ(11 downto 8) <= DI(3 downto 0);
					when "100" => CH(4).FREQ(11 downto 8) <= DI(3 downto 0);
					when "101" => CH(5).FREQ(11 downto 8) <= DI(3 downto 0);
					when others => null;
					end case;
										
				when "0100" =>
					-- if CHSEL >= 0 and CHSEL <= 5 then
						-- CH(conv_integer(CHSEL)).CHON <= DI(7);
						-- CH(conv_integer(CHSEL)).DDA <= DI(6);
						-- CH(conv_integer(CHSEL)).AL <= DI(4 downto 0);
						-- if CH(conv_integer(CHSEL)).DDA = '1' and DI(6) = '0' then
							-- CH(conv_integer(CHSEL)).WF_RES <= '1';
						-- end if;
					-- end if;
					case CHSEL is
					when "000" =>
						CH(0).CHON <= DI(7);
						CH(0).DDA <= DI(6);
						CH(0).AL <= DI(4 downto 0);
						if CH(0).DDA = '1' and DI(6) = '0' then
							CH(0).WF_RES <= '1';
						end if;
					when "001" =>
						CH(1).CHON <= DI(7);
						CH(1).DDA <= DI(6);
						CH(1).AL <= DI(4 downto 0);
						if CH(1).DDA = '1' and DI(6) = '0' then
							CH(1).WF_RES <= '1';
						end if;
					when "010" =>
						CH(2).CHON <= DI(7);
						CH(2).DDA <= DI(6);
						CH(2).AL <= DI(4 downto 0);
						if CH(2).DDA = '1' and DI(6) = '0' then
							CH(2).WF_RES <= '1';
						end if;
					when "011" =>
						CH(3).CHON <= DI(7);
						CH(3).DDA <= DI(6);
						CH(3).AL <= DI(4 downto 0);
						if CH(3).DDA = '1' and DI(6) = '0' then
							CH(3).WF_RES <= '1';
						end if;
					when "100" =>
						CH(4).CHON <= DI(7);
						CH(4).DDA <= DI(6);
						CH(4).AL <= DI(4 downto 0);
						if CH(4).DDA = '1' and DI(6) = '0' then
							CH(4).WF_RES <= '1';
						end if;
					when "101" =>
						CH(5).CHON <= DI(7);
						CH(5).DDA <= DI(6);
						CH(5).AL <= DI(4 downto 0);
						if CH(5).DDA = '1' and DI(6) = '0' then
							CH(5).WF_RES <= '1';
						end if;					
					when others => null;
					end case;
						
				when "0101" =>
					-- if CHSEL >= 0 and CHSEL <= 5 then
						-- CH(conv_integer(CHSEL)).LAL <= DI(7 downto 4);
						-- CH(conv_integer(CHSEL)).RAL <= DI(3 downto 0);
					-- end if;
					case CHSEL is
					when "000" =>
						CH(0).LAL <= DI(7 downto 4);
						CH(0).RAL <= DI(3 downto 0);
					when "001" =>
						CH(1).LAL <= DI(7 downto 4);
						CH(1).RAL <= DI(3 downto 0);
					when "010" =>
						CH(2).LAL <= DI(7 downto 4);
						CH(2).RAL <= DI(3 downto 0);
					when "011" =>
						CH(3).LAL <= DI(7 downto 4);
						CH(3).RAL <= DI(3 downto 0);
					when "100" =>
						CH(4).LAL <= DI(7 downto 4);
						CH(4).RAL <= DI(3 downto 0);
					when "101" =>
						CH(5).LAL <= DI(7 downto 4);
						CH(5).RAL <= DI(3 downto 0);					
					when others => null;
					end case;					
					
				when "0110" =>
					-- if CHSEL >= 0 and CHSEL <= 5 then
						-- if CH(conv_integer(CHSEL)).DDA = '0' then
							-- CH(conv_integer(CHSEL)).WF_DATA(conv_integer(CH(conv_integer(CHSEL)).WF_ADDR)) <= DI(4 downto 0);
						-- end if;

						-- if CH(conv_integer(CHSEL)).CHON = '1' then
							-- CH(conv_integer(CHSEL)).DA_OUT <= DI(4 downto 0);
						-- end if;

						-- if CH(conv_integer(CHSEL)).DDA = '0' 
						-- and CH(conv_integer(CHSEL)).CHON = '0' 
						-- then
							-- CH(conv_integer(CHSEL)).WF_INC <= '1';
						-- end if;
					-- end if;
					case CHSEL is
					when "000" =>
						if CH(0).DDA = '0' then
							CH(0).WF_DATA(conv_integer(CH(0).WF_ADDR)) <= DI(4 downto 0);
						end if;

						if CH(0).CHON = '1' then
							CH(0).DA_OUT <= DI(4 downto 0);
						end if;

						if CH(0).DDA = '0' 
						and CH(0).CHON = '0' 
						then
							CH(0).WF_INC <= '1';
						end if;
					when "001" =>
						if CH(1).DDA = '0' then
							CH(1).WF_DATA(conv_integer(CH(1).WF_ADDR)) <= DI(4 downto 0);
						end if;

						if CH(1).CHON = '1' then
							CH(1).DA_OUT <= DI(4 downto 0);
						end if;

						if CH(1).DDA = '0' 
						and CH(1).CHON = '0' 
						then
							CH(1).WF_INC <= '1';
						end if;
					when "010" =>
						if CH(2).DDA = '0' then
							CH(2).WF_DATA(conv_integer(CH(2).WF_ADDR)) <= DI(4 downto 0);
						end if;

						if CH(2).CHON = '1' then
							CH(2).DA_OUT <= DI(4 downto 0);
						end if;

						if CH(2).DDA = '0' 
						and CH(2).CHON = '0' 
						then
							CH(2).WF_INC <= '1';
						end if;
					when "011" =>
						if CH(3).DDA = '0' then
							CH(3).WF_DATA(conv_integer(CH(3).WF_ADDR)) <= DI(4 downto 0);
						end if;

						if CH(3).CHON = '1' then
							CH(3).DA_OUT <= DI(4 downto 0);
						end if;

						if CH(3).DDA = '0' 
						and CH(3).CHON = '0' 
						then
							CH(3).WF_INC <= '1';
						end if;
					when "100" =>
						if CH(4).DDA = '0' then
							CH(4).WF_DATA(conv_integer(CH(4).WF_ADDR)) <= DI(4 downto 0);
						end if;

						if CH(4).CHON = '1' then
							CH(4).DA_OUT <= DI(4 downto 0);
						end if;

						if CH(4).DDA = '0' 
						and CH(4).CHON = '0' 
						then
							CH(4).WF_INC <= '1';
						end if;
					when "101" =>
						if CH(5).DDA = '0' then
							CH(5).WF_DATA(conv_integer(CH(5).WF_ADDR)) <= DI(4 downto 0);
						end if;

						if CH(5).CHON = '1' then
							CH(5).DA_OUT <= DI(4 downto 0);
						end if;

						if CH(5).DDA = '0' 
						and CH(5).CHON = '0' 
						then
							CH(5).WF_INC <= '1';
						end if;
					when others => null;
					end case;					
				
				when "0111" =>
					-- if CHSEL >= 4 and CHSEL <= 5 then
						-- CH(conv_integer(CHSEL)).NE <= DI(7);
						-- CH(conv_integer(CHSEL)).NG_FREQ <= DI(4 downto 0);
					-- end if;
					case CHSEL is
					when "100" =>
						CH(4).NE <= DI(7);
						CH(4).NG_FREQ <= DI(4 downto 0);
					when "101" =>
						CH(5).NE <= DI(7);
						CH(5).NG_FREQ <= DI(4 downto 0);						
					when others => null;
					end case;					
					
				when "1000" =>
					LFO_FREQ <= DI;
				when "1001" =>
					LFCTL <= DI(1 downto 0);
					LFTRG <= DI(7);
					-- if LFTRG = '0' and DI(7) = '1' then
						-- CH(1).WF_RES <= '1';
					-- end if;
				when others => null;
				end case;
			end if;
		end if;
	end if;
end process;

-- Channel 1 - LFO-Modulated Waveform
process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			CH(0).GL_OUT <= (others => '0');
			
			CH(0).WF_CNT <= (others => '0');			
		else
			if CH(0).WF_RES = '1' then
				CH(0).WF_ADDR <= (others => '0');
			end if;
			if CH(0).WF_INC = '1' then
				CH(0).WF_ADDR <= CH(0).WF_ADDR + 1;
			end if;
		
			if CH(0).CHON = '0' then
				-- TODO - LFO Modulation
				CH(0).WF_CNT <= (CH(0).FREQ - 1) & "1";
			elsif CH(0).DDA = '0' then
				CH(0).WF_OUT <= CH(0).WF_DATA(conv_integer(CH(0).WF_ADDR));
			
				if CLKEN = '1' then
					CH(0).WF_CNT <= CH(0).WF_CNT - 1;
					if CH(0).WF_CNT = "0000000000000" then
						-- TODO - LFO Modulation
						CH(0).WF_CNT <= (CH(0).FREQ - 1) & "1";
						CH(0).WF_ADDR <= CH(0).WF_ADDR + 1;
					end if;
				end if;
				
			end if;
			
			if CH(0).CHON = '0' then
				CH(0).GL_OUT <= (others => '0');
			elsif CH(0).DDA = '1' then
				CH(0).GL_OUT <= CH(0).DA_OUT;
			else
				CH(0).GL_OUT <= CH(0).WF_OUT;
			end if;
			
		end if;
	end if;
end process;

-- Channel 2 - Waveform - LFO
process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			CH(1).GL_OUT <= (others => '0');
			
			CH(1).WF_CNT <= (others => '0');
			
			LFO_CNT <= (others => '0');	
		else
			if CH(1).WF_RES = '1' then
				CH(1).WF_ADDR <= (others => '0');
			end if;
			if CH(1).WF_INC = '1' then
				CH(1).WF_ADDR <= CH(1).WF_ADDR + 1;
			end if;
		
			if LFCTL /= "00" then
				CH(1).WF_OUT <= CH(1).WF_DATA(conv_integer(CH(1).WF_ADDR));

				if LFTRG = '1' then
					CH(1).WF_ADDR <= (others => '0');
					CH(1).WF_CNT <= (CH(1).FREQ - 1) & "1";
					LFO_CNT <= LFO_FREQ - 1;
				else	
					if CLKEN = '1' then
						LFO_CNT <= LFO_CNT - 1;
						if LFO_CNT = "00000000" then
							LFO_CNT <= LFO_FREQ - 1;
							CH(1).WF_CNT <= CH(1).WF_CNT - 1;
							if CH(1).WF_CNT = "0000000000000" then
								CH(1).WF_CNT <= (CH(1).FREQ - 1) & "1";
								CH(1).WF_ADDR <= CH(1).WF_ADDR + 1;
							end if;							
						end if;
					end if;
				end if;
				
			elsif CH(1).CHON = '0' then
				CH(1).WF_CNT <= (CH(1).FREQ - 1) & "1";
			elsif CH(1).DDA = '0' then
				CH(1).WF_OUT <= CH(1).WF_DATA(conv_integer(CH(1).WF_ADDR));				
			
				if CLKEN = '1' then
					CH(1).WF_CNT <= CH(1).WF_CNT - 1;
					if CH(1).WF_CNT = "0000000000000" then
						CH(1).WF_CNT <= (CH(1).FREQ - 1) & "1";
						CH(1).WF_ADDR <= CH(1).WF_ADDR + 1;
					end if;
				end if;
				
			end if;
							
			if CH(1).CHON = '0' or LFCTL /= "00" then
				CH(1).GL_OUT <= (others => '0');
			elsif CH(1).DDA = '1' then
				CH(1).GL_OUT <= CH(1).DA_OUT;
			else
				CH(1).GL_OUT <= CH(1).WF_OUT;
			end if;
			
		end if;
	end if;
end process;

-- Channels 3-6 - Waveform + Noise (on channels 5-6)
-- process( CLK )
-- begin
	-- if rising_edge( CLK ) then
		-- for i in 2 to 5 loop
			-- if RESET_N = '0' then
				-- CH(i).GL_OUT <= (others => '0');
				
				-- CH(i).WF_CNT <= (others => '0');
				
				-- CH(i).LFSR <= (others => '0');
				-- CH(i).NG_CNT <= (others => '0');
			-- else
				-- if CH(i).WF_RES = '1' then
					-- CH(i).WF_ADDR <= (others => '0');
				-- end if;
				-- if CH(i).WF_INC = '1' then
					-- CH(i).WF_ADDR <= CH(i).WF_ADDR + 1;
				-- end if;
			
				-- if CH(i).CHON = '0' then
					-- CH(i).WF_CNT <= (CH(i).FREQ - 1) & "1";
				-- elsif CH(i).DDA = '0' then
					-- CH(i).WF_OUT <= CH(i).WF_DATA(conv_integer(CH(i).WF_ADDR));
				
					-- if CLKEN = '1' then
						-- CH(i).WF_CNT <= CH(i).WF_CNT - 1;
						-- if CH(i).WF_CNT = "0000000000000" then
							-- CH(i).WF_CNT <= (CH(i).FREQ - 1) & "1";
							-- CH(i).WF_ADDR <= CH(i).WF_ADDR + 1;
						-- end if;
					-- end if;
					
				-- end if;
				
				-- if CH(i).NE = '0' then
					-- CH(i).NG_CNT <= ( not(CH(i).NG_FREQ) - 1) & "00000001";
				-- else
					-- if CH(i).LFSR(0) = '0' then
						-- CH(i).NG_OUT <= "00000";
					-- else
						-- CH(i).NG_OUT <= "11111";
					-- end if;
					
					-- if CLKEN = '1' then
						-- CH(i).NG_CNT <= CH(i).NG_CNT - 1;
						-- if CH(i).NG_CNT = "0000000000000" then
							-- CH(i).NG_CNT <= ( not(CH(i).NG_FREQ) - 1) & "00000001";
							-- CH(i).LFSR <= ( CH(i).LFSR(0) 
									-- xor CH(i).LFSR(1) 
									-- xor CH(i).LFSR(11) 
									-- xor CH(i).LFSR(12) 
									-- xor CH(i).LFSR(17) ) 
									-- & CH(i).LFSR(17 downto 1); 
						-- end if;
					-- end if;
					
				-- end if;
				
				-- if CH(i).CHON = '0' then
					-- CH(i).GL_OUT <= (others => '0');
				-- elsif CH(i).DDA = '1' then
					-- CH(i).GL_OUT <= CH(i).DA_OUT;
				-- elsif CH(i).NE = '1' then
					-- CH(i).GL_OUT <= CH(i).NG_OUT;
				-- else
					-- CH(i).GL_OUT <= CH(i).WF_OUT;
				-- end if;
				
			-- end if;
		-- end loop;
	-- end if;
-- end process;


-- Channel 3 - Waveform
process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			CH(2).GL_OUT <= (others => '0');
			
			CH(2).WF_CNT <= (others => '0');				
		else
			if CH(2).WF_RES = '1' then
				CH(2).WF_ADDR <= (others => '0');
			end if;
			if CH(2).WF_INC = '1' then
				CH(2).WF_ADDR <= CH(2).WF_ADDR + 1;
			end if;
		
			if CH(2).CHON = '0' then
				CH(2).WF_CNT <= (CH(2).FREQ - 1) & "1";
			elsif CH(2).DDA = '0' then
				CH(2).WF_OUT <= CH(2).WF_DATA(conv_integer(CH(2).WF_ADDR));
			
				if CLKEN = '1' then
					CH(2).WF_CNT <= CH(2).WF_CNT - 1;
					if CH(2).WF_CNT = "0000000000000" then
						CH(2).WF_CNT <= (CH(2).FREQ - 1) & "1";
						CH(2).WF_ADDR <= CH(2).WF_ADDR + 1;
					end if;
				end if;
				
			end if;

			if CH(2).CHON = '0' then
				CH(2).GL_OUT <= (others => '0');
			elsif CH(2).DDA = '1' then
				CH(2).GL_OUT <= CH(2).DA_OUT;
			else
				CH(2).GL_OUT <= CH(2).WF_OUT;
			end if;
			
		end if;
	end if;
end process;

-- Channel 4 - Waveform
process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			CH(3).GL_OUT <= (others => '0');
			
			CH(3).WF_CNT <= (others => '0');				
		else
			if CH(3).WF_RES = '1' then
				CH(3).WF_ADDR <= (others => '0');
			end if;
			if CH(3).WF_INC = '1' then
				CH(3).WF_ADDR <= CH(3).WF_ADDR + 1;
			end if;
		
			if CH(3).CHON = '0' then
				CH(3).WF_CNT <= (CH(3).FREQ - 1) & "1";
			elsif CH(3).DDA = '0' then
				CH(3).WF_OUT <= CH(3).WF_DATA(conv_integer(CH(3).WF_ADDR));
			
				if CLKEN = '1' then
					CH(3).WF_CNT <= CH(3).WF_CNT - 1;
					if CH(3).WF_CNT = "0000000000000" then
						CH(3).WF_CNT <= (CH(3).FREQ - 1) & "1";
						CH(3).WF_ADDR <= CH(3).WF_ADDR + 1;
					end if;
				end if;
				
			end if;

			if CH(3).CHON = '0' then
				CH(3).GL_OUT <= (others => '0');
			elsif CH(3).DDA = '1' then
				CH(3).GL_OUT <= CH(3).DA_OUT;
			else
				CH(3).GL_OUT <= CH(3).WF_OUT;
			end if;
			
		end if;
	end if;
end process;



-- Channel 5 - Waveform + Noise
process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			CH(4).GL_OUT <= (others => '0');
			
			CH(4).WF_CNT <= (others => '0');
			
			CH(4).LFSR <= (others => '0');
			CH(4).NG_CNT <= (others => '0');
		else
			if CH(4).WF_RES = '1' then
				CH(4).WF_ADDR <= (others => '0');
			end if;
			if CH(4).WF_INC = '1' then
				CH(4).WF_ADDR <= CH(4).WF_ADDR + 1;
			end if;
		
			if CH(4).CHON = '0' then
				CH(4).WF_CNT <= (CH(4).FREQ - 1) & "1";
			elsif CH(4).DDA = '0' then
				CH(4).WF_OUT <= CH(4).WF_DATA(conv_integer(CH(4).WF_ADDR));
			
				if CLKEN = '1' then
					CH(4).WF_CNT <= CH(4).WF_CNT - 1;
					if CH(4).WF_CNT = "0000000000000" then
						CH(4).WF_CNT <= (CH(4).FREQ - 1) & "1";
						CH(4).WF_ADDR <= CH(4).WF_ADDR + 1;
					end if;
				end if;
				
			end if;
			
			if CH(4).NE = '0' then
				CH(4).NG_CNT <= ( not(CH(4).NG_FREQ) - 1) & "11111111";
			else
				if CH(4).LFSR(0) = '0' then
					CH(4).NG_OUT <= "00000";
				else
					CH(4).NG_OUT <= "11111";
				end if;
				
				if CLKEN = '1' then
					CH(4).NG_CNT <= CH(4).NG_CNT - 1;
					if CH(4).NG_CNT = "0000000000000" then
						CH(4).NG_CNT <= ( not(CH(4).NG_FREQ) - 1) & "11111111";
						CH(4).LFSR <= ( CH(4).LFSR(0) 
								xor CH(4).LFSR(1) 
								xor CH(4).LFSR(11) 
								xor CH(4).LFSR(12) 
								xor CH(4).LFSR(17) ) 
								& CH(4).LFSR(17 downto 1); 
					end if;
				end if;
				
			end if;
			
			if CH(4).CHON = '0' then
				CH(4).GL_OUT <= (others => '0');
			elsif CH(4).DDA = '1' then
				CH(4).GL_OUT <= CH(4).DA_OUT;
			elsif CH(4).NE = '1' then
				CH(4).GL_OUT <= CH(4).NG_OUT;
			else
				CH(4).GL_OUT <= CH(4).WF_OUT;
			end if;
			
		end if;
	end if;
end process;

-- Channel 6 - Waveform + Noise
process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			CH(5).GL_OUT <= (others => '0');
			
			CH(5).WF_CNT <= (others => '0');
			
			CH(5).LFSR <= (others => '0');
			CH(5).NG_CNT <= (others => '0');
		else
			if CH(5).WF_RES = '1' then
				CH(5).WF_ADDR <= (others => '0');
			end if;
			if CH(5).WF_INC = '1' then
				CH(5).WF_ADDR <= CH(5).WF_ADDR + 1;
			end if;
		
			if CH(5).CHON = '0' then
				CH(5).WF_CNT <= (CH(5).FREQ - 1) & "1";
			elsif CH(5).DDA = '0' then
				CH(5).WF_OUT <= CH(5).WF_DATA(conv_integer(CH(5).WF_ADDR));
			
				if CLKEN = '1' then
					CH(5).WF_CNT <= CH(5).WF_CNT - 1;
					if CH(5).WF_CNT = "0000000000000" then
						CH(5).WF_CNT <= (CH(5).FREQ - 1) & "1";
						CH(5).WF_ADDR <= CH(5).WF_ADDR + 1;
					end if;
				end if;
				
			end if;
			
			if CH(5).NE = '0' then
				CH(5).NG_CNT <= ( not(CH(5).NG_FREQ) - 1) & "11111111";
			else
				if CH(5).LFSR(0) = '0' then
					CH(5).NG_OUT <= "00000";
				else
					CH(5).NG_OUT <= "11111";
				end if;
				
				if CLKEN = '1' then
					CH(5).NG_CNT <= CH(5).NG_CNT - 1;
					if CH(5).NG_CNT = "0000000000000" then
						CH(5).NG_CNT <= ( not(CH(5).NG_FREQ) - 1) & "11111111";
						CH(5).LFSR <= ( CH(5).LFSR(0) 
								xor CH(5).LFSR(1) 
								xor CH(5).LFSR(11) 
								xor CH(5).LFSR(12) 
								xor CH(5).LFSR(17) ) 
								& CH(5).LFSR(17 downto 1); 
					end if;
				end if;
				
			end if;
			
			if CH(5).CHON = '0' then
				CH(5).GL_OUT <= (others => '0');
			elsif CH(5).DDA = '1' then
				CH(5).GL_OUT <= CH(5).DA_OUT;
			elsif CH(5).NE = '1' then
				CH(5).GL_OUT <= CH(5).NG_OUT;
			else
				CH(5).GL_OUT <= CH(5).WF_OUT;
			end if;
			
		end if;
	end if;
end process;


-- Channels mixing
VT : entity work.voltab port map (
	address		=> VT_ADDR,
	clock		=> CLK,
	q			=> VT_DATA
);

process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			LACC <= (others => '0');
			RACC <= (others => '0');
			
			LDATA_FF <= (others => '0');
			RDATA_FF <= (others => '0');
			
			VT_ADDR <= (others => '0');
			
			MIX_CNT <= (others => '0');
			MIX <= MIX_WAIT;
		else
			case MIX is
			when MIX_WAIT =>
				LACC <= (others => '0');
				RACC <= (others => '0');
				MIX_CNT <= (others => '0');
				VT_ADDR <= (others => '1');
				if DAC_LATCH = '1' then
					VT_ADDR <= CH(conv_integer(MIX_CNT)).GL_OUT 
						& ( "1011101" - CH(conv_integer(MIX_CNT)).AL 
						- (CH(conv_integer(MIX_CNT)).LAL & "1") 
						- (LMAL & "1") );
					MIX <= MIX_LREAD;
				end if;
			
			when MIX_LREAD =>
				MIX <= MIX_LREAD2;
			when MIX_LREAD2 =>
				MIX <= MIX_LNEXT;
				
			when MIX_LNEXT =>
				LACC <= LACC + VT_DATA;
				VT_ADDR <= CH(conv_integer(MIX_CNT)).GL_OUT 
					& ( "1011101" - CH(conv_integer(MIX_CNT)).AL
					- (CH(conv_integer(MIX_CNT)).RAL & "1") 
					- (RMAL & "1") );
				MIX <= MIX_RREAD;
				
			when MIX_RREAD =>
				MIX <= MIX_RREAD2;
			when MIX_RREAD2 =>
				MIX <= MIX_RNEXT;

			when MIX_RNEXT =>
				RACC <= RACC + VT_DATA;
				if MIX_CNT = "101" then
					MIX <= MIX_END;
				else
					VT_ADDR <= CH(conv_integer(MIX_CNT+1)).GL_OUT 
						& ( "1011101" - CH(conv_integer(MIX_CNT+1)).AL
						- (CH(conv_integer(MIX_CNT+1)).LAL & "1") 
						- (LMAL & "1") );
					MIX_CNT <= MIX_CNT + 1;
					MIX <= MIX_LREAD;
				end if;
			when MIX_END =>
				LDATA_FF <= LACC;
				RDATA_FF <= RACC;
				MIX <= MIX_WAIT;
			
			when others => null;
			end case;
		end if;
	end if;
end process;

LDATA <= LDATA_FF;
RDATA <= RDATA_FF;
	
end rtl;

