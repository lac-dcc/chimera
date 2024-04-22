library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;
use work.vga_font_init.all;
use work.vga_text_init.all;
use work.vga_color_init.all;

entity vga_wb8 is
	generic(
		EN_COLOR: boolean := true
	);
	Port(
		-- naming according to Wishbone B4 spec
		ADR_I: in std_logic_vector(31 downto 0);
		CLK_I: in std_logic;
		DAT_I: in std_logic_vector(7 downto 0);
		STB_I: in std_logic;
		WE_I: in std_logic;
		ACK_O: out std_logic;
		DAT_O: out std_logic_vector(7 downto 0);

		I_vga_clk: in std_logic := '0';
		O_vga_vsync, O_vga_hsync, O_vga_r, O_vga_g, O_vga_b: out std_logic := '0'
	);
end vga_wb8;


architecture Behavioral of vga_wb8 is
	--	timings for 640x480, 60 Hz, 25.175 MHz pixel clock
	constant h_visible: integer := 640;
	constant h_front_porch: integer := 16;
	constant h_pulse: integer := 96;
	constant h_back_porch: integer := 48;
	constant v_visible: integer := 480																												;
	constant v_front_porch: integer := 10;
	constant v_pulse: integer := 2;
	constant v_back_porch: integer := 33;

	constant text_cols: integer := 40;
	constant text_rows: integer := 30;

	signal col: integer range 0 to (h_visible + h_front_porch + h_pulse + h_back_porch) := 0;
	signal row: integer range 0 to (v_visible + v_front_porch + v_pulse + v_back_porch) := 0;

	signal ram_font: font_store_t := FONT_RAM_INIT;
	signal ram_text: text_store_t := TEXT_RAM_INIT;
	signal ram_color: color_store_t := COLOR_RAM_INIT;
	signal font_byte, text_char, color_next, color: std_logic_vector(7 downto 0) := X"00";
	
begin


	ctrl_logic: process(CLK_I)
		variable ack: std_logic := '0';
		variable addr: integer range 0 to 2047;
	begin
		if rising_edge(CLK_I) then
			ack := '0';
			addr := to_integer(unsigned(ADR_I(10 downto 0)));
			
			if STB_I = '1' then
				case ADR_I(12 downto 11) is
					when "00" =>
						if WE_I = '1' then
							ram_text(addr) <= DAT_I;
						else
							DAT_O <= ram_text(addr);
						end if;
					
					when "01" =>
						if EN_COLOR then
							if WE_I = '1' then
								ram_color(addr) <= DAT_I;
							else
								DAT_O <= ram_color(addr);
							end if;
						else
							null;
						end if;
					
					when others =>
						if WE_I = '1' then
							ram_font(addr) <= DAT_I;
						else
							DAT_O <= ram_font(addr);
						end if;
				end case;
				
				ack := '1';
			end if;
		end if;
		
		ACK_O <= STB_I and ack;
		
	end process;
	
	vga_out: process(I_vga_clk)
		variable col_vec: std_logic_vector(11 downto 0);
		variable row_vec: std_logic_vector(10 downto 0);
		variable font_addr: integer range 0 to 2047;
		
		variable font_address: std_logic_vector(10 downto 0);
		variable font_row: std_logic_vector(2 downto 0);
		variable font_pixel: std_logic;
		
		variable text_col: integer range 0 to text_cols;
		variable text_offset: integer range 0 to (text_cols * text_rows);
		variable text_color_addr: integer range 0 to (ram_text'length - 1);

		variable col_next: integer range 0 to (h_visible + h_front_porch + h_pulse + h_back_porch) := 0;
		variable row_next: integer range 0 to (v_visible + v_front_porch + v_pulse + v_back_porch) := 0;
	begin
		if rising_edge(I_vga_clk) then
		
			col_vec := std_logic_vector(to_unsigned(col, col_vec'length));
			row_vec := std_logic_vector(to_unsigned(row, row_vec'length));
			
			if col < h_visible and row < v_visible then

				-- pick font pixel from font byte for current column
				case col_vec(3 downto 1) is
					when "000" =>
						font_pixel := font_byte(7);
					when "001" =>
						font_pixel := font_byte(6);
					when "010" =>
						font_pixel := font_byte(5);
					when "011" =>
						font_pixel := font_byte(4);
					when "100" =>
						font_pixel := font_byte(3);
					when "101" =>
						font_pixel := font_byte(2);
					when "110" =>
						font_pixel := font_byte(1);
					when others =>
						font_pixel := font_byte(0);
				end case;
				
				if font_pixel = '1' then
					O_vga_r <= color(6);
					O_vga_g <= color(5);
					O_vga_b <= color(4);
				else
					O_vga_r <= color(2);
					O_vga_g <= color(1);
					O_vga_b <= color(0);
				end if;
				
				if col_vec(3 downto 0) = "1110" then
					-- increment 2 clocks early, so there's time to fetch the
					-- text character and then the font byte
						text_col := text_col + 1;
				end if;
				
			else
				-- not in visible region
				O_vga_r <= '0';
				O_vga_g <= '0';
				O_vga_b <= '0';
				
				text_col := 0;
			end if;
			
			-- fetch char from text RAM and color from color RAM
			text_color_addr := text_offset + text_col;
			text_char <= ram_text(text_color_addr);
			if EN_COLOR then
				color_next <= ram_color(text_color_addr);
			else
				color_next <= X"F0";
			end if;
			color <= color_next; -- delay color for one clock
	
			---------------------------------------------
			-- generate sync signals, update row and col
			---------------------------------------------
			col_next := col + 1;	
			row_next := row;
		
			if col = (h_visible + h_front_porch - 1) then
				O_vga_hsync <= '0';
				
				if row_vec(3 downto 0) = "1111" then
					-- we're in last row of text row, increment memory offset
					text_offset := text_offset + text_cols;
				end if;
			end if;
		
			if col = (h_visible + h_front_porch + h_pulse - 1) then
				O_vga_hsync <= '1';
			end if;

			if col = (h_visible + h_front_porch + h_pulse + h_back_porch - 1) then
				col_next := 0;
				row_next := row + 1;
			end if;
			
			if row >= (v_visible + v_front_porch) and row < (v_visible + v_front_porch + v_pulse) then
				O_vga_vsync <= '0';
			else
				O_vga_vsync <= '1';
			end if;
			
			
			if row = (v_visible + v_front_porch + v_pulse + v_back_porch - 1) then
				row_next := 0;
			end if;
			
			if row > v_visible then
				-- reset memory offset when in vertical blanking
				text_offset := 0;
			end if;
			
			col <= col_next;
			row <= row_next;
			
			----------------------------------
			-- fetch font byte for next pixel
			----------------------------------
			col_vec := std_logic_vector(to_unsigned(col_next, col_vec'length));
			row_vec := std_logic_vector(to_unsigned(row_next, row_vec'length));
			
			font_row := row_vec(3 downto 1);
			font_address := text_char & font_row;
			font_byte <= ram_font(to_integer(unsigned(font_address)));
		
		end if;
	end process;
	
	
end Behavioral;