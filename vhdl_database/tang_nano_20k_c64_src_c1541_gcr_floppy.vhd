---------------------------------------------------------------------------------
-- Commodore 1541 gcr floppy (read/write) by Dar (darfpga@aol.fr) 23-May-2017
-- http://darfpga.blogspot.fr
--
-- produces GCR data, byte(ready) and sync signal to feed c1541_logic from current
-- track buffer ram which contains D64 data
--
-- gets GCR data from c1541_logic, while producing byte(ready) signal. Data feed 
-- track buffer ram after conversion
--
-- Input clk 32MHz
--     
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity gcr_floppy is
port(
	clk32  : in  std_logic;
	c1541_logic_din  : out std_logic_vector(7 downto 0);   -- data from ram to 1541 logic
	c1541_logic_dout : in  std_logic_vector(7 downto 0);   -- data from 1541 logic to ram 
	mode   : in  std_logic;                      -- read/write
--	stp    : in  std_logic_vector(1 downto 0);   -- stepper motor control
	mtr    : in  std_logic;                      -- stepper motor on/off
	freq   : in  std_logic_vector(1 downto 0);   -- motor (gcr_bit) frequency
	sync_n : out std_logic;                      -- reading SYNC bytes
	byte_n : out std_logic;                      -- byte ready
	
	track_num   : in  std_logic_vector(5 downto 0);
	id1         : in  std_logic_vector(7 downto 0);
	id2         : in  std_logic_vector(7 downto 0);
	raw_freq    : in  std_logic_vector(1 downto 0);
	mounted     : in  std_logic;
	raw         : in  std_logic;
	raw_track_len : in  std_logic_vector(15 downto 0);

	ram_addr    : out std_logic_vector(12 downto 0);
	ram_do      : in  std_logic_vector(7 downto 0);
	ram_di      : out std_logic_vector(7 downto 0);
	ram_we      : out std_logic;
	ram_ready   : in  std_logic;
	
	dbg_sector  : out std_logic_vector(4 downto 0)
);
end gcr_floppy;

architecture struct of gcr_floppy is

signal bit_clk_en  : std_logic;
signal bit_clk_div : std_logic_vector(7 downto 0);
signal sync_cnt    : std_logic_vector(5 downto 0) := (others => '0');
signal byte_cnt    : std_logic_vector(8 downto 0) := (others => '0');
signal byte_in     : std_logic_vector(7 downto 0);
signal byte_out    : std_logic_vector(7 downto 0);
signal byte_we     : std_logic;
signal byte_addr   : std_logic_vector(12 downto 0);
signal nibble      : std_logic := '0';
signal gcr_bit_cnt : std_logic_vector(3 downto 0) := (others => '0');
signal bit_cnt     : std_logic_vector(2 downto 0) := (others => '0');

signal sync_in_n   : std_logic;
signal byte_in_n   : std_logic;

signal sector      : std_logic_vector(4 downto 0) := (others => '0');
signal state       : std_logic                    := '0';

signal data_header : std_logic_vector(7 downto 0);
signal data_body   : std_logic_vector(7 downto 0);
signal data        : std_logic_vector(7 downto 0);
signal data_cks    : std_logic_vector(7 downto 0);
signal gcr_nibble  : std_logic_vector(4 downto 0);
signal gcr_bit     : std_logic;
signal gcr_byte    : std_logic_vector(7 downto 0);

signal mode_r1     : std_logic;
signal mode_r2     : std_logic;

signal old_track   : std_logic_vector(5 downto 0);

signal raw_bit_clk_en : std_logic;
signal raw_bit_clk_div: std_logic_vector(7 downto 0);
signal raw_byte_cnt   : std_logic_vector(12 downto 0);
signal raw_bit_cnt    : std_logic_vector( 2 downto 0);
signal raw_byte_in    : std_logic_vector( 7 downto 0);
signal raw_byte_we    : std_logic;
signal synced_bit_cnt : std_logic_vector( 2 downto 0);
signal shift_reg      : std_logic_vector(17 downto 0);
signal sync_in_n_raw  : std_logic;
signal byte_in_n_raw  : std_logic;

type gcr_array is array(0 to 15) of std_logic_vector(4 downto 0);

signal gcr_lut : gcr_array := 
	("01010","11010","01001","11001",
	 "01110","11110","01101","11101",
	 "10010","10011","01011","11011",
	 "10110","10111","01111","10101");
	 
signal sector_max : std_logic_vector(4 downto 0);

signal gcr_byte_out   : std_logic_vector(7 downto 0);
signal gcr_bit_out    : std_logic;
signal gcr_nibble_out : std_logic_vector(4 downto 0);
signal nibble_out     : std_logic_vector(3 downto 0);

signal autorise_write : std_logic;
signal autorise_count : std_logic;

signal lfsr : std_logic_vector(3 downto 0) := "0001";

begin

ram_addr <=       raw_byte_cnt when raw = '1' else byte_addr;
ram_we <=          raw_byte_we when raw = '1' else byte_we;
ram_di <=     c1541_logic_dout when raw = '1' else byte_out;
c1541_logic_din <= raw_byte_in when raw = '1' else byte_in;

sync_n <= '1' when ram_ready = '0' or mtr = '0' else
	sync_in_n_raw when raw = '1' else
	sync_in_n;

dbg_sector <= sector;

with byte_cnt select
  data_header <= 
		X"08"                          when "000000000",
	  "00"&track_num xor "000"&sector xor id1 xor id2 when "000000001",
	  "000"&sector                    when "000000010",
	  "00"&track_num                  when "000000011",
	  id2                             when "000000100",
	  id1                             when "000000101",
	  X"0F"                           when others;

with byte_cnt select
	data_body <=
		X"07"     when "000000000",
		data_cks  when "100000001",
		X"00"     when "100000010",
		X"00"     when "100000011",
		X"0F"     when "100000100",
		X"0F"     when "100000101",
		X"0F"     when "100000110",
		X"0F"     when "100000111",
		X"0F"     when "100001000",
		X"0F"     when "100001001",
		X"0F"     when "100001010",
		X"0F"     when "100001011",
		X"0F"     when "100001100",
		X"0F"     when "100001101",
		X"0F"     when "100001110",
		X"0F"     when "100001111",
		X"0F"     when "100010000",
		X"0F"     when "100010001",
		ram_do    when others;
	
with state select
	data <= data_header when '0', data_body when others;

with nibble select
	gcr_nibble <=
		gcr_lut(to_integer(unsigned(data(7 downto 4)))) when '0',
		gcr_lut(to_integer(unsigned(data(3 downto 0)))) when others;

gcr_bit <= gcr_nibble(to_integer(unsigned(gcr_bit_cnt)));

sector_max <=  "10100" when track_num < std_logic_vector(to_unsigned(18,6)) else
               "10010" when track_num < std_logic_vector(to_unsigned(25,6)) else
               "10001" when track_num < std_logic_vector(to_unsigned(31,6)) else
               "10000";

gcr_bit_out <= gcr_byte_out(to_integer(unsigned(not bit_cnt)));

with gcr_nibble_out select
	nibble_out <= 	X"0" when "01010",--"01010",
						X"1" when "01011",--"11010",
						X"2" when "10010",--"01001",
						X"3" when "10011",--"11001",
						X"4" when "01110",--"01110",
						X"5" when "01111",--"11110",
						X"6" when "10110",--"01101",
						X"7" when "10111",--"11101",
						X"8" when "01001",--"10010",
						X"9" when "11001",--"10011",
						X"A" when "11010",--"01011",
						X"B" when "11011",--"11011",
						X"C" when "01101",--"10110",
						X"D" when "11101",--"10111",
						X"E" when "11110",--"01111",
						X"F" when others; --"10101",			

with freq select
    bit_clk_div <= x"67" when "11",
                   x"6F" when "10",
                   x"77" when "01",
                   x"7F" when others;

with raw_freq select
raw_bit_clk_div <= x"67" when "11",
                   x"6F" when "10",
                   x"77" when "01",
                   x"7F" when others;

process (clk32)
	variable bit_clk_cnt : std_logic_vector(7 downto 0) := (others => '0');
	variable raw_bit_clk_cnt : std_logic_vector(7 downto 0) := (others => '0');
begin
	if rising_edge(clk32) then

		mode_r1 <= mode;

		bit_clk_en <= '0';
		raw_bit_clk_en <= '0';
		byte_n <= '1';
		if (mode_r1 xor mode) = '1' then -- read <-> write change
			bit_clk_cnt := (others => '0');
			raw_bit_clk_cnt := (others => '0');
		elsif mtr = '1' then
			if bit_clk_cnt = 0 then
				bit_clk_en <= '1';
				bit_clk_cnt := bit_clk_div;
			else
				bit_clk_cnt := bit_clk_cnt - '1';
			end if;

			if raw_bit_clk_cnt = 0 then
				raw_bit_clk_en <= '1';
				raw_bit_clk_cnt := raw_bit_clk_div;
			else
				raw_bit_clk_cnt := raw_bit_clk_cnt - '1';
			end if;

			if ((byte_in_n = '0' and raw = '0') or (byte_in_n_raw = '0' and raw = '1')) and ram_ready = '1' then
				if bit_clk_cnt > X"10" and bit_clk_cnt < X"5E" then
					byte_n <= '0';
				end if;
			end if;
		end if;
	end if;
end process;

lfsr_process : process(clk32)
begin
	if rising_edge(clk32) then
		lfsr <= (lfsr(0) xor lfsr(1)) & lfsr(3 downto 1);
	end if;
end process;

sync_in_n_raw <= '0' when shift_reg(17 downto 8) = "11"&x"FF" and raw_track_len /= 0 and mode = '1' else '1';

-- G64 handling
raw_read_write_process : process(clk32)
begin
	if rising_edge(clk32) then
		raw_byte_we <= '0';
		if mtr = '0' or mounted = '0' or raw = '0' then
			raw_byte_cnt <= '0'&x"202";
			synced_bit_cnt <= "000";
			raw_bit_cnt <= "000";
			byte_in_n_raw <= '1';
			shift_reg <= (others => '0');
		else
			if bit_clk_en = '1' then
				byte_in_n_raw <= '1';
				shift_reg(17 downto 8) <= shift_reg(16 downto 7);

				if shift_reg(10 downto 7) /= "0000" or lfsr(0) = '1' then
					-- not weak GCR (or randomly shift and insert '1' if weak)
					if shift_reg(10 downto 7) = "0000" then
						shift_reg(8) <= '1';
					end if;
					if synced_bit_cnt = "111" then
						byte_in_n_raw <= '0';
						raw_byte_in <= shift_reg(15 downto 8);
					end if;

					synced_bit_cnt <= synced_bit_cnt + 1;
				end if;

				if sync_in_n_raw = '0' or ram_ready = '0' or raw_track_len = 0 then
					synced_bit_cnt <= "000";
				end if;
			end if;

			if raw_bit_clk_en = '1' then
				raw_bit_cnt <= raw_bit_cnt + '1';
				if raw_bit_cnt = 0 then
					shift_reg(7 downto 0) <= ram_do;
				else
					shift_reg(7 downto 0) <= shift_reg(6 downto 0) & '0';
				end if;

				if raw_bit_cnt = "111" then
					if raw_track_len /= 0 then
						raw_byte_we <= not mode;
					end if;
					raw_byte_cnt <= raw_byte_cnt + 1;
					if raw_byte_cnt >= raw_track_len + 1 and raw_track_len /= 0 then
						raw_byte_cnt <= '0'&x"002";
					end if;
				end if;
			end if;
		end if;
	end if;
end process;

-- D64 handling
read_write_process : process (clk32, raw)
begin
	if rising_edge(clk32) and raw = '0' then

	  old_track <= track_num;

	  if old_track /= track_num then
	    sector <= (others => '0'); --reset sector number on track change
	  elsif mounted = '1' and bit_clk_en = '1' then

		mode_r2 <= mode;
		if mode = '1' then autorise_write <= '0'; end if;

		if (mode xor mode_r2) = '1' then 
			if mode = '1' then  -- leaving write mode
				sync_in_n <= '0';
				sync_cnt <= (others => '0');
				state <= '0';
			else                -- entering write mode
				byte_cnt    <= (others => '0');
				nibble      <= '0';
				gcr_bit_cnt <= (others => '0');
				bit_cnt     <= (others => '0');
				gcr_byte    <= (others => '0');
				data_cks    <= (others => '0');
			end if;	
		end if;

		if sync_in_n = '0' and mode = '1' then

			byte_cnt        <= (others => '0');
			nibble          <= '0';
			gcr_bit_cnt     <= (others => '0');
			bit_cnt         <= (others => '0');
			byte_in         <= (others => '1');
			gcr_byte        <= (others => '0');
			data_cks        <= (others => '0');

			if sync_cnt = X"27" then 
				sync_cnt <= (others => '0');
				sync_in_n <= '1';
			else
				sync_cnt <= sync_cnt + '1';
			end if;

		end if;

		if sync_in_n = '1' or mode = '0' then

			gcr_bit_cnt <= gcr_bit_cnt + '1';
			if gcr_bit_cnt = X"4" then
				gcr_bit_cnt <= (others => '0');
				if nibble = '1' then 
					nibble    <= '0';
					byte_addr <= sector & byte_cnt(7 downto 0);
					if byte_cnt = "000000000" then
						data_cks <= (others => '0');
					else
						data_cks <= data_cks xor data;
					end if;
					if mode = '1' or (mode = '0' and autorise_count = '1') then
						byte_cnt  <= byte_cnt + '1';
					end if;
				else
					nibble <= '1';
					if mode = '0' and byte_out = X"07" then
						autorise_write <= '1';
						autorise_count <= '1';
					end if;
					if byte_cnt >= "100000000" then
						autorise_write <= '0';
						autorise_count <= '0';
					end if;
				end if;
			end if;

			bit_cnt <= bit_cnt + '1';
			byte_in_n  <= '1';
			if bit_cnt = X"7" then
				byte_in_n <= '0';
				gcr_byte_out <= c1541_logic_dout;
			end if;

			if state = '0' then
				-- header
				if byte_cnt = "000001111" and bit_cnt = 0 then
					sync_in_n <= '0';
					state<= '1';
				end if;
			else
				-- data
				if byte_cnt = "100010001" then 
					sync_in_n <= '0';
					state <= '0';
					if sector = sector_max then 
						sector <= (others=>'0');
					else
						sector <= sector + '1';
					end if;
				end if;
			end if;

			-- demux byte from floppy (ram)			
			gcr_byte <= gcr_byte(6 downto 0) & gcr_bit;

			if bit_cnt = X"7" then
				byte_in <= gcr_byte(6 downto 0) & gcr_bit;
			end if;

			-- serialise/convert byte to floppy (ram)				
			gcr_nibble_out <= gcr_nibble_out(3 downto 0) & gcr_bit_out;

			if gcr_bit_cnt = X"0" then
				if nibble = '0' then 
					byte_out(3 downto 0) <= nibble_out;
				else
					byte_out(7 downto 4) <= nibble_out;
				end if;
			end if;

			if gcr_bit_cnt = X"1" and nibble = '0' then
				if autorise_write = '1' then
					byte_we <= '1';
				end if;	
			else
				byte_we <= '0';
			end if;

		end if;
	  end if;
	end if;
end process;

end struct;
