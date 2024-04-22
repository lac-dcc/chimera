library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--use IEEE.STD_LOGIC_ARITH.All;
--You only need *either* Numeric_std *or* std_logic_arith. You can't have
--both at the same time, as they both design a type UNSIGNED.
--
--It's not clear to me which one you need as there's no arithmetic in your 
--code. Numeric_std is the official IEEE standard, so you might prefer to 
--use that.
use ieee.std_logic_unsigned.all; --przeciaza operator + dla std_logic_vector

entity video_generator is
    Port ( CLK_IN : in STD_LOGIC;
			  HSYNC_OUT : out  STD_LOGIC;
           VSYNC_OUT : out  STD_LOGIC;
           RGB_OUT : out  STD_LOGIC_VECTOR (2 downto 0);
			  VIDEORAM_ADDR : OUT std_logic_VECTOR(9 downto 0);
	        VIDEORAM_DATA : IN std_logic_VECTOR(7 downto 0)
			);
end video_generator;

architecture Behavioral of video_generator is

component CharTable_ROM is
    Port ( ADDR : in  STD_LOGIC_VECTOR (8 downto 0);
           DATA_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal char_rom_data : std_logic_vector(7 downto 0);
signal char_rom_addr : std_logic_vector(8 downto 0);

signal line_count_reg : integer range 0 to 2**10-1 := 0;
signal line_count_next : integer range 0 to 2**10-1 := 0;
signal pixel_count_reg : integer range 0 to 2**10-1 := 0;
signal pixel_count_next : integer range 0 to 2**10-1 := 0;

signal h_count_reg : integer range 0 to 1023 := 0;
signal h_count_next : integer range 0 to 1023 := 0;
signal v_count_reg : integer range 0 to 1023 := 0;
signal v_count_next : integer range 0 to 1023 := 0;

signal bit_pos_reg : integer range 0 to 7;
signal bit_pos_next : integer range 0 to 7;

signal ram_line_addr_reg : integer range 0 to 1023;
signal ram_line_addr_next : integer range 0 to 1023;
signal column_num_reg : integer range 0 to 31;
signal column_num_next : integer range 0 to 31;

signal char_rom_line_reg : std_logic_vector(2 downto 0);
signal char_rom_line_next : std_logic_vector(2 downto 0);


type state_type is (s0, s1);
signal curr_state, next_state : state_type;

begin

--inst_rom : CharTable_ROM 
--	port map (
--		ADDR => char_rom_addr,
--		DATA_OUT => char_rom_data
--	);

 inst_rom : entity work.inst_cg_rom
	port map (
		address => char_rom_addr,
		clock => CLK_IN,
		q => char_rom_data
	);


process (CLK_IN) is
begin
	if rising_edge(CLK_IN) then
		curr_state <= next_state;
		h_count_reg <= h_count_next;
		v_count_reg <= v_count_next;
		pixel_count_reg <= pixel_count_next;
		line_count_reg <= line_count_next;
		bit_pos_reg <= bit_pos_next;
		ram_line_addr_reg <= ram_line_addr_next;
		column_num_reg <= column_num_next;
		char_rom_line_reg <= char_rom_line_next;
	end if;
end process;


process (curr_state, h_count_reg, v_count_reg) is
begin
	case curr_state is
		when s0 =>
			v_count_next <= v_count_reg;
	
			if h_count_reg = 799 then --799@50MHz, 767@48
				h_count_next <= 0;
				if v_count_reg = 520 then
					v_count_next <= 0;
				else
					v_count_next <= v_count_reg + 1;
				end if;
			else
				h_count_next <= h_count_reg + 1;
			end if;
			next_state <= s1;
			
		when s1 =>
			v_count_next <= v_count_reg;
			h_count_next <= h_count_reg;
			next_state <= s0;
			
	end case;
end process;


process (curr_state, h_count_reg, v_count_reg, pixel_count_reg, line_count_reg, ram_line_addr_reg) is
variable pixel : std_logic_vector (9 downto 0);
variable line : std_logic_vector (9 downto 0);
begin
	ram_line_addr_next <= ram_line_addr_reg;
	
	case curr_state is
		when s0 =>
			pixel_count_next <= pixel_count_reg;
			line_count_next <= line_count_reg;
	
			if (h_count_reg >= 337) and (h_count_reg <= 591) then 
				pixel_count_next <= pixel_count_reg + 1;
			else
				pixel := std_logic_vector(to_unsigned(pixel_count_reg, 10));
				line := std_logic_vector(to_unsigned(line_count_reg, 10));			
				if (pixel = 255) and (line(2 downto 0) = 7) then
						ram_line_addr_next <= ram_line_addr_reg + 32;
				end if;			
				
				pixel_count_next <= 0;
				if (v_count_reg >= 181) and (v_count_reg <= 371) then
					line_count_next <= line_count_reg + 1;
				else
					line_count_next <= 0;
					ram_line_addr_next <= 0;
				end if;
			end if;
	
		when s1 =>
			pixel_count_next <= pixel_count_reg;
			line_count_next <= line_count_reg;
--			pixel := conv_std_logic_vector(pixel_count_reg, 10);
--			line := conv_std_logic_vector(line_count_reg, 10);			
--			--border_next <= border_reg;
--			if (pixel = 255) and (line(2 downto 0) = 7) then
--				ram_line_addr_next <= ram_line_addr_reg + 32;
--			elsif (pixel = 255) and (line = 191) then
--				ram_line_addr_next <= 0;
--			end if;
			
	end case;

end process;


process (curr_state, line_count_reg, pixel_count_reg, bit_pos_reg, column_num_reg, char_rom_line_reg) is
variable pixel : std_logic_vector (9 downto 0);
variable line : std_logic_vector (9 downto 0);
begin

	case curr_state is
		when s0 =>
			pixel := std_logic_vector(to_unsigned(pixel_count_reg, 10));
			line := std_logic_vector(to_unsigned(line_count_reg, 10));
	
			bit_pos_next <= 7 - to_integer(unsigned(pixel(2 downto 0)));
			column_num_next <= to_integer(unsigned(pixel(8 downto 3)));
			char_rom_line_next <= line(2 downto 0);
			
		when s1 =>
			bit_pos_next <=  bit_pos_reg;
			column_num_next <= column_num_reg;
			char_rom_line_next <= char_rom_line_reg;
	end case;
	
end process;


VSYNC_OUT <= '0' when v_count_reg < 2 else '1';
HSYNC_OUT <= '0' when h_count_reg < 96 else '1'; --96@50mhz, 92@48mhz

char_rom_addr <= VIDEORAM_DATA(5 downto 0) & char_rom_line_reg;

RGB_OUT <=  --"010" when (border_reg /= "00") else 
				"111" when (char_rom_data(bit_pos_reg)='1') else 
				"000";

VIDEORAM_ADDR <= std_logic_vector(to_unsigned(ram_line_addr_reg + column_num_reg, 10));

end Behavioral;
