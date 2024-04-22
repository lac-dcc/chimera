-- Listing 13.6
-- char-addr: 7 bits, the ASCII code of the character
-- row-addr: 4 bits, the row number in a particular font pattern
-- rom-addr: 11 bits, the address of the font ROM; the concatenation of char-addr
-- bit-addr: 3 bits, the column number in a particular font pattern
-- font-word: 8 bits, a row of pixels of the font pattern specified by rom-addr
-- font-bit : 1 bit, one pixel of font-word specified by bit-addr
-- see page 298 for explanatnion of font scaling
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
entity pong_text is
   port(
      clk, reset: in std_logic;
      pixel_x, pixel_y: in std_logic_vector(9 downto 0);
      dig0, dig1: in std_logic_vector(3 downto 0);
      ball: in std_logic_vector(1 downto 0);
      --text_on: out std_logic_vector(4 downto 0);	--! changed to add logo element
		text_on: out std_logic_vector(3 downto 0);	--! changed to add logo element
       text_rgb: out std_logic_vector(2 downto 0)
   );
end pong_text;

architecture arch of pong_text is
   signal pix_x, pix_y: unsigned(9 downto 0);
   signal rom_addr: std_logic_vector(10 downto 0);
   signal char_addr, char_addr_s, char_addr_l, char_addr_r,
          char_addr_o: std_logic_vector(6 downto 0);
   signal row_addr, row_addr_s, row_addr_l,row_addr_r,
          row_addr_o: std_logic_vector(3 downto 0);
   signal bit_addr, bit_addr_s, bit_addr_l,bit_addr_r,
          bit_addr_o: std_logic_vector(2 downto 0);
   signal font_word: std_logic_vector(7 downto 0);
   signal font_bit: std_logic;
	signal score_on, logo_on, rule_on, over_on: std_logic;	
   --signal score_on, logo1_on, logo2_on, rule_on, over_on: std_logic;		--!ADD another logo flag for new line
   signal rule_rom_addr: unsigned(5 downto 0);
   type rule_rom_type is array (0 to 63) of
       std_logic_vector (6 downto 0);
   -- rull text ROM definition
   constant RULE_ROM: rule_rom_type :=
   (
      -- row 1
      "1010010", -- R
      "1010101", -- U
      "1001100", -- L
      "1000101", -- E
      "0111010", -- :
      "0000000", --
      "0000000", --
      "0000000", --
      "0000000", --
      "0000000", --
      "0000000", --
      "0000000", --
      "0000000", --
      "0000000", --
      "0000000", --
      "0000000", --
      -- row 2
      "1010101", -- U
      "1110011", -- s
      "1100101", -- e
      "0000000", --
      "1110100", -- t
      "1110111", -- w
      "1101111", -- o
      "0000000", --
      "1100010", -- b
      "1110101", -- u
      "1110100", -- t
      "1110100", -- t
      "1101111", -- o
      "1101110", -- n
      "1110011", -- s
      "0000000", --
      -- row 3
      "1110100", -- t
      "1101111", -- o
      "0000000", --
      "1101101", -- m
      "1101111", -- o
      "1110110", -- v
      "1100101", -- e
      "0000000", --
      "1110000", -- p
      "1100001", -- a
      "1100100", -- d
      "1100100", -- d
      "1101100", -- l
      "1100101", -- e
      "0000000", --
      "0000000", --
      -- row 4
      "1110101", -- u
      "1110000", -- p
      "0000000", --
      "1100001", -- a
      "1101110", -- n
      "1100100", -- d
      "0000000", --
      "1100100", -- d
      "1101111", -- o
      "1110111", -- w
      "1101110", -- n
      "0101110", -- .
      "0000000", --
      "0000000", --
      "0000000", --
      "0000000"  --
   );
begin
   pix_x <= unsigned(pixel_x);
   pix_y <= unsigned(pixel_y);
   -- instantiate font rom
   font_unit: entity work.font_rom
      port map(clk=>clk, addr=>rom_addr, data=>font_word);

   ---------------------------------------------
   -- score region
   --  - display two-digit score, ball on top left
   --  - scale to 16-by-32 font
   --  - line 1, 16 chars: "Score:DD Ball:D"
   ---------------------------------------------
   score_on <=
      '1' when pix_y(9 downto 5)=0 and
               pix_x(9 downto 4)<16 else
      '0';
   row_addr_s <= std_logic_vector(pix_y(4 downto 1));
   bit_addr_s <= std_logic_vector(pix_x(3 downto 1));
   with pix_x(7 downto 4) select
     char_addr_s <=
        "1010011" when "0000", -- S x53
        "1100011" when "0001", -- c x63
        "1101111" when "0010", -- o x6f
        "1110010" when "0011", -- r x72
        "1100101" when "0100", -- e x65
        "0111010" when "0101", -- : x3a
        "011" & dig1 when "0110", -- digit 10
        "011" & dig0 when "0111", -- digit 1
        "0000000" when "1000",
        "0000000" when "1001",
        "1000010" when "1010", -- B x42
        "1100001" when "1011", -- a x61
        "1101100" when "1100", -- l x6c
        "1101100" when "1101", -- l x6c
        "0111010" when "1110", -- :
        "01100" & ball when others;


--ORIGINAL
--   ---------------------------------------------
--   -- logo region:
--   --   - display logo "PONG" on top center
--   --   - used as background
--   --   - scale to 64-by-128 font
--   ---------------------------------------------
--   logo_on <=
--      '1' when pix_y(9 downto 7)=2 and
--         (3<= pix_x(9 downto 6) and pix_x(9 downto 6)<=6) else
--      '0';
--   row_addr_l <= std_logic_vector(pix_y(6 downto 3));
--   bit_addr_l <= std_logic_vector(pix_x(5 downto 3));
--   with pix_x(8 downto 6) select
--     char_addr_l <=
--        "1010000" when "011", -- P x50
--        "1001111" when "100", -- O x4f
--        "1001110" when "101", -- N x4e
--        "1000111" when others; --G x47



---- FPGA
----   ---------------------------------------------
----   -- logo region:
----   --   - display logo "PONG" on top center
----   --   - used as background
----   --   - scale to 64-by-128 font
----   ---------------------------------------------
--   logo1_on <=
--      '1' when pix_y(9 downto 7)=2 and
--         (3<= pix_x(9 downto 6) and pix_x(9 downto 6)<=6) else
--      '0';
--   row_addr_l <= std_logic_vector(pix_y(6 downto 3));
--   bit_addr_l <= std_logic_vector(pix_x(5 downto 3));
--   with pix_x(8 downto 6) select
--     char_addr_l <=
--        "1000110" when "011", -- F x50
--        "1010000" when "100", -- P x4f
--        "1000111" when "101", -- G x4e
--        "1000001" when others; --A x47
		  
-- LOGI
--   ---------------------------------------------
--   -- logo region:
--   --   - display logo "PONG" on top center
--   --   - used as background
--   --   - scale to 64-by-128 font
--   ---------------------------------------------
   logo_on <=
      '1' when pix_y(9 downto 7)=2 and		--! 4 ROWS, select which - 0 based.
         (3<= pix_x(9 downto 6) and pix_x(9 downto 6)<=6) else
      '0';
   row_addr_l <= std_logic_vector(pix_y(6 downto 3));
   bit_addr_l <= std_logic_vector(pix_x(5 downto 3));
   with pix_x(8 downto 6) select
     char_addr_l <=
        "1001100" when "011", -- L x50
        "1001111" when "100", -- O x4f
        "1000111" when "101", -- G x4e
        "1101001" when others; --i x47


--MOD
--   logo_on <=	--this is mapping when to print the text
--      '1' when pix_y(9 downto 7)=2 and		--pix_y rows
--         (2<= pix_x(9 downto 6) and pix_x(9 downto 6)<=8) else	--pix_x = columns - places the given text in columns 2<=x<=8 locations
--      '0';
--   --row_addr_l <= std_logic_vector(pix_y(6 downto 3));
--   --bit_addr_l <= std_logic_vector(pix_x(5 downto 3));
--	row_addr_l <= std_logic_vector(pix_y(6 downto 3));
--   bit_addr_l <= std_logic_vector(pix_x(5 downto 3));
--   with pix_x(8 downto 6) select		--this is dividing the x screen by 3 bits = 8;
--     char_addr_l <=
----        "1010000" when "011", -- P x50
----        "1001111" when "100", -- O x4f
----        "1001110" when "101", -- N x4e
----        "1000111" when others; --G x47
--	
--				--add custom text here
--		  "1010011" when "001", -- S x50
--        "1010000" when "010", -- P x4f
--        --"1000001" when "011", -- A x4e
--        "1010010"  when "011", --R x47
--		  "1001011" when "100", -- K x4f
--        "1000110" when "101", -- F x4e
--		  "1010101" when "110", -- U x4e
--        "1001110"  when others; --N x47
--		
----			--add custom text here
----		  "1010011" when "001", -- S x50
----        "1010000" when "010", -- P x4f
----        "1000001" when "011", -- A x4e
----        "1010010"  when "100", --R x47
----		  "1001011" when "101", -- K x4f
----        "1000110" when "110", -- F x4e
----		  "1010101" when "111", -- U x4e
----        "1001110"  when others; --N x47

--
----			--add custom text here
----		  "1010011" when "000", -- S x50
----        "1010000" when "001", -- P x4f
----        "1000001" when "010", -- A x4e
----        "1010010"  when "011", --R x47
----		  "1001011" when "100", -- k x4f
----        "1000110" when "101", -- f x4e
----		  "1010101" when "110", -- u x4e
----        "1001110"  when others; --n x47

   ---------------------------------------------
   -- rule region
   --   - display rule (4-by-16 tiles)on center
   --   - rule text:
   --        Rule:
   --        Use two buttons
   --        to move paddle
   --        up and down
   ---------------------------------------------
   rule_on <= '1' when pix_x(9 downto 7) = "010" and
                       pix_y(9 downto 6)=  "0010"  else
              '0';
   row_addr_r <= std_logic_vector(pix_y(3 downto 0));
   bit_addr_r <= std_logic_vector(pix_x(2 downto 0));
   rule_rom_addr <= pix_y(5 downto 4) & pix_x(6 downto 3);
   char_addr_r <= RULE_ROM(to_integer(rule_rom_addr));
   ---------------------------------------------
   -- game over region
   --  - display }Game Over" on center
   --  - scale to 32-by-64 fonts
   ---------------------------------------------
   over_on <=
      '1' when pix_y(9 downto 6)=3 and
         5<= pix_x(9 downto 5) and pix_x(9 downto 5)<=13 else
      '0';
   row_addr_o <= std_logic_vector(pix_y(5 downto 2));
   bit_addr_o <= std_logic_vector(pix_x(4 downto 2));
   with pix_x(8 downto 5) select
     char_addr_o <=
        "1000111" when "0101", -- G x47
        "1100001" when "0110", -- a x61
        "1101101" when "0111", -- m x6d
        "1100101" when "1000", -- e x65
        "0000000" when "1001", --
        "1001111" when "1010", -- O x4f
        "1110110" when "1011", -- v x76
        "1100101" when "1100", -- e x65
        "1110010" when others; -- r x72
   ---------------------------------------------
   -- mux for font ROM addresses and rgb
   ---------------------------------------------
   process(score_on,logo_on,rule_on,pix_x,pix_y,font_bit,  --!
           char_addr_s,char_addr_l,char_addr_r,char_addr_o,
           row_addr_s,row_addr_l,row_addr_r,row_addr_o,
           bit_addr_s,bit_addr_l,bit_addr_r,bit_addr_o)
   begin
      text_rgb <= "110";  -- background, yellow
      if score_on='1' then
         char_addr <= char_addr_s;
         row_addr <= row_addr_s;
         bit_addr <= bit_addr_s;
         if font_bit='1' then
            text_rgb <= "001";
         end if;
      elsif rule_on='1' then
         char_addr <= char_addr_r;
         row_addr <= row_addr_r;
         bit_addr <= bit_addr_r;
         if font_bit='1' then
            text_rgb <= "001";
         end if;
--      elsif logo1_on='1' then				--!
--         char_addr <= char_addr_l;
--         row_addr <= row_addr_l;
--         bit_addr <= bit_addr_l;
--         if font_bit='1' then
--            text_rgb <= "011";
--         end if;
		elsif logo_on='1' then
         char_addr <= char_addr_l;
         row_addr <= row_addr_l;
         bit_addr <= bit_addr_l;
         if font_bit='1' then
            text_rgb <= "011";
         end if;
      else -- game over
         char_addr <= char_addr_o;
         row_addr <= row_addr_o;
         bit_addr <= bit_addr_o;
         if font_bit='1' then
            text_rgb <= "001";
         end if;
      end if;
   end process;
   --text_on <= score_on & logo1_on & logo2_on & rule_on & over_on;	--!
	text_on <= score_on & logo_on & rule_on & over_on;	--!
   ---------------------------------------------
   -- font rom interface
   ---------------------------------------------
   rom_addr <= char_addr & row_addr;
   font_bit <= font_word(to_integer(unsigned(not bit_addr)));
end arch;