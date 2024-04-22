library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity font_generator is
	port(
		clock: in std_logic;
    vramaddr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    vramdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		video_on: in std_logic;
		buttons: in std_logic_vector(3 downto 0);
		pixel_x, pixel_y: in std_logic_vector(9 downto 0);
		rgb_text: out std_logic_vector(2 downto 0)
	);
end font_generator;

architecture Behavioral of font_generator is
--	component blk_mem_gen_v7_3
--		port (
--			clka: in std_logic;
--			wea: in std_logic_vector(0 downto 0);
--			addra: in std_logic_vector(11 downto 0);
--			dina: in std_logic_vector(6 downto 0);
--			clkb: in std_logic;
--			addrb: in std_logic_vector(11 downto 0);
--			doutb: out std_logic_vector(6 downto 0)
--		);
--	end component;
	
	signal char_addr: std_logic_vector(6 downto 0);
	signal rom_addr: std_logic_vector(10 downto 0);
	signal row_addr: std_logic_vector(3 downto 0);
	signal bit_addr: std_logic_vector(2 downto 0);
	signal font_word: std_logic_vector(7 downto 0);
	signal font_bit: std_logic;
	
	signal addr_write: std_logic_vector(11 downto 0) := (others => '0');
	signal addr_read: std_logic_vector(11 downto 0);
	signal din: std_logic_vector(6 downto 0) := "1000001";
	signal dout: std_logic_vector(6 downto 0) := "1000010";
	signal bbut0: std_logic_vector(3 downto 0) := "0000";
	signal bbut1: std_logic_vector(3 downto 0) := "0000";
begin
	-- instantiate font ROM
	font_unit: entity work.font_rom
		port map(
			clock => clock,
			addr => rom_addr,
			data => font_word
		);

	-- instantiate frame buffer
--	frame_buffer_unit: blk_mem_gen_v7_3
--		port map (
--			clka => clock,
--			wea => (others => '1'),
--			addra => addr_write,
--			dina => din,
--			clkb => clock,
--			addrb => addr_read,
--			doutb => dout
--		);
    vramaddr <= x"0" & addr_read;
    dout <= vramdata(6 downto 0);
--	dout <= "1000010";
	
	din(3 downto 0) <= buttons;
	addr_write(3 downto 0) <= buttons;
--	addr_write <= to_unsigned(addr_write,12) + 1 when bbut0="1110" else addr_write;
	process(clock, buttons) begin
		if rising_edge(clock) then
			bbut0 <= bbut0(2 downto 0) & buttons(0);
		end if;
	end process;

	-- tile RAM read
	addr_read <= pixel_y(8 downto 4) & pixel_x(9 downto 3);
	char_addr <= dout;
	
	-- font ROM interface
	row_addr <= pixel_y(3 downto 0);
	rom_addr <= char_addr & row_addr;
	bit_addr <= std_logic_vector(unsigned(pixel_x(2 downto 0)) - 1);
	font_bit <= font_word(to_integer(unsigned(not bit_addr)));

	-- rgb multiplexing
	process(video_on, font_bit)
	begin
		if video_on = '0' then
			rgb_text <= "000";
		elsif font_bit = '1' then
			rgb_text <= "111";
		else
			rgb_text <= "000";
		end if;
	end process;
end Behavioral;
