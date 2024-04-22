library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity lcdctl is
    Port ( clk,reset : in  STD_LOGIC;
    vramaddr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    vramdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			ud : out  STD_LOGIC;
			rl : out  STD_LOGIC;
			enab : out  STD_LOGIC;
			vsync : out  STD_LOGIC;
			hsync : out  STD_LOGIC;
			ck : out  STD_LOGIC;
			r : out std_logic_vector(5 downto 0);
			g : out std_logic_vector(5 downto 0);
			b : out std_logic_vector(5 downto 0)
	);
end lcdctl;
architecture Behavioral of lcdctl is
signal clk_fast : std_logic := '0';
signal ired : std_logic_vector(5 downto 0) := "000000";
signal igreen : std_logic_vector(5 downto 0) := "000000";
signal iblue : std_logic_vector(5 downto 0) := "000000";
signal fg_r : std_logic_vector(5 downto 0) := "000000";
signal fg_g : std_logic_vector(5 downto 0) := "000000";
signal fg_b : std_logic_vector(5 downto 0) := "000000";
signal bg_r : std_logic_vector(5 downto 0) := "000000";
signal bg_g : std_logic_vector(5 downto 0) := "000000";
signal bg_b : std_logic_vector(5 downto 0) := "000000";
signal lcdvsync : STD_LOGIC;
signal lcdhsync : STD_LOGIC;

	signal char_addr: std_logic_vector(6 downto 0);
	signal char_attr: std_logic_vector(7 downto 0) := x"42";
	signal attr_not_char: std_logic := '1';
	signal rom_addr: std_logic_vector(10 downto 0);
	signal row_addr: std_logic_vector(3 downto 0);
	signal bit_addr: std_logic_vector(2 downto 0);
	signal font_word: std_logic_vector(7 downto 0);
	signal font_bit: std_logic;
	signal video_on: std_logic;
	signal dout: std_logic_vector(7 downto 0) := "01100010";
	signal addr_read: std_logic_vector(12 downto 0);
	signal pixel_x, pixel_y: std_logic_vector(9 downto 0);
	signal ipixel_x, ipixel_y: std_logic_vector(9 downto 0);

begin
	ud <= '1';
	rl <= '1';
	enab <= '0';
	ck <= clk_fast;
	r <= ired;
	g <= igreen;
	b <= iblue;
	hsync<=lcdhsync;
	vsync<=lcdvsync;
	sync0: entity work.vga_sync 
	port map(
		clock=>clk_fast,
		reset=>reset,
		hsync=>lcdhsync, vsync=>lcdvsync,
		video_on=>video_on,
		pixel_tick=>open,
		pixel_x=>pixel_x, pixel_y=>pixel_y
	);
    -- instantiate frame buffer
--    frame_buffer_unit: entity work.blk_mem_gen_v7_3
--        port map (
--            clka => clk,
--            wea => (others => '0'),
--            addra => (others => '0'),
--            dina => (others => '0'),
--            clkb => clk,
--            addrb => addr_read,
--            doutb => dout
--        );
	vramaddr <= "000" & addr_read;
	dout <= vramdata;
	-- instantiate font ROM
	font_unit: entity work.font_rom
		port map(
			clock => clk_fast,
			addr => rom_addr,
			data => font_word
		);
	-- tile RAM read
--	addr_read <= ((pixel_y(9 downto 4) & "000000") + ("00" & pixel_y(9 downto 4) & "0000") + ("00000" & pixel_x(9 downto 3))) & attr_not_char;
	addr_read <= ((pixel_y(9 downto 4) * "000101") + ("00000" & pixel_x(9 downto 3))) & attr_not_char;
	process(clk,clk_fast,video_on)
	begin
		if rising_edge(clk) then
			if video_on='0' then
				attr_not_char <= '0';
				clk_fast <= '0';
			else
				if clk_fast='0' then
					char_attr <= dout(7 downto 0);
					attr_not_char <= '1';
				else
					char_addr <= dout(6 downto 0);
					attr_not_char <= '0';
				end if;
			end if;
			clk_fast <= not clk_fast;
		end if;
	end process;
	fg_r <= (others => '1') when char_attr(0)='1' else (others => '0');
	fg_g <= (others => '1') when char_attr(1)='1' else (others => '0');
	fg_b <= (others => '1') when char_attr(2)='1' else (others => '0');
	bg_r <= (others => '1') when char_attr(3)='1' else (others => '0');
	bg_g <= (others => '1') when char_attr(4)='1' else (others => '0');
	bg_b <= (others => '1') when char_attr(5)='1' else (others => '0');
	
	-- font ROM interface
	row_addr <= pixel_y(3 downto 0);
	rom_addr <= char_addr & row_addr;
--	bit_addr <= std_logic_vector(unsigned(pixel_x(2 downto 0)) - 1);
	bit_addr <= std_logic_vector(unsigned(pixel_x(2 downto 0))-2);
	font_bit <= font_word(to_integer(unsigned(not bit_addr)));

	-- rgb multiplexing
	process(font_bit,video_on,fg_r,fg_g,fg_b,bg_r,bg_g,bg_b)
	begin
		if video_on='0' then
			ired <= (others => '0');
			igreen <= (others => '0');
			iblue <= (others => '0');
		elsif font_bit = '1' then
			ired <= fg_r;
			igreen <= fg_g;
			iblue <= fg_b;
--			ired <= (others => '1');
--			igreen <= (others => '1');
--			iblue <= (others => '1');
		else
			ired <= bg_r;
			igreen <= bg_g;
			iblue <= bg_b;
--			ired <= (others => '0');
--			igreen <= (others => '0');
--			iblue <= (others => '0');
		end if;
	end process;
end Behavioral;
