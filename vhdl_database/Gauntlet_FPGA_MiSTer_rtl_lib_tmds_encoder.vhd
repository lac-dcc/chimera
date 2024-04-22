----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
--
-- Description: TMDS Encoder
--     8 bits colour, 2 control bits and one blanking bits in
--       10 bits of TMDS encoded data out
--     Clocked at the pixel clock
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TMDS_encoder is
	port (
		clk     : in  std_logic;
		data    : in  std_logic_vector (7 downto 0);
		c       : in  std_logic_vector (1 downto 0);
		blank   : in  std_logic;
		encoded : out std_logic_vector (9 downto 0) := (others => '0')
	);
end TMDS_encoder;

architecture RTL of TMDS_encoder is
	signal xored  : std_logic_vector (8 downto 0) := (others => '0');
	signal xnored : std_logic_vector (8 downto 0) := (others => '0');

	signal ones                : std_logic_vector (3 downto 0) := (others => '0');
	signal data_word           : std_logic_vector (8 downto 0) := (others => '0');
	signal data_word_inv       : std_logic_vector (8 downto 0) := (others => '0');
	signal data_word_disparity : std_logic_vector (3 downto 0) := (others => '0');
	signal dc_bias             : std_logic_vector (3 downto 0) := (others => '0');
begin
	-- Work our the two different encodings for the byte
	xored(0) <= data(0);
	xored(1) <= data(1) xor xored(0);
	xored(2) <= data(2) xor xored(1);
	xored(3) <= data(3) xor xored(2);
	xored(4) <= data(4) xor xored(3);
	xored(5) <= data(5) xor xored(4);
	xored(6) <= data(6) xor xored(5);
	xored(7) <= data(7) xor xored(6);
	xored(8) <= '1';

	xnored(0) <= data(0);
	xnored(1) <= data(1) xnor xnored(0);
	xnored(2) <= data(2) xnor xnored(1);
	xnored(3) <= data(3) xnor xnored(2);
	xnored(4) <= data(4) xnor xnored(3);
	xnored(5) <= data(5) xnor xnored(4);
	xnored(6) <= data(6) xnor xnored(5);
	xnored(7) <= data(7) xnor xnored(6);
	xnored(8) <= '0';

	-- Count how many ones are set in data
	ones <= "0000"
		+ data(0) + data(1) + data(2) + data(3)
		+ data(4) + data(5) + data(6) + data(7);

	-- Decide which encoding to use
	process(ones, data(0), xnored, xored)
	begin
		if ones > 4 or (ones = 4 and data(0) = '0') then
			data_word     <= xnored;
			data_word_inv <= not(xnored);
		else
			data_word     <= xored;
			data_word_inv <= not(xored);
		end if;
	end process;

	-- Work out the DC bias of the dataword;
	data_word_disparity  <= "1100"
		+ data_word(0) + data_word(1) + data_word(2) + data_word(3)
		+ data_word(4) + data_word(5) + data_word(6) + data_word(7);

	-- Now work out what the output should be
	process(clk)
	begin
		if rising_edge(clk) then
			if blank = '1' then
				-- In the control periods, all values have and have balanced bit count
				case c is
					when "00"   => encoded <= "1101010100";
					when "01"   => encoded <= "0010101011";
					when "10"   => encoded <= "0101010100";
					when others => encoded <= "1010101011";
				end case;
				dc_bias <= (others => '0');
			else
				if dc_bias = "00000" or data_word_disparity = 0 then
					-- dataword has no disparity
					if data_word(8) = '1' then
						encoded <= "01" & data_word(7 downto 0);
						dc_bias <= dc_bias + data_word_disparity;
					else
						encoded <= "10" & data_word_inv(7 downto 0);
						dc_bias <= dc_bias - data_word_disparity;
					end if;
				elsif (dc_bias(3) = '0' and data_word_disparity(3) = '0') or
						(dc_bias(3) = '1' and data_word_disparity(3) = '1') then
					encoded <= '1' & data_word(8) & data_word_inv(7 downto 0);
					dc_bias <= dc_bias + data_word(8) - data_word_disparity;
				else
					encoded <= '0' & data_word;
					dc_bias <= dc_bias - data_word_inv(8) + data_word_disparity;
				end if;
			end if;
		end if;
	end process;
end RTL;
