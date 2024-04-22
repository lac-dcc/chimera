LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity Game_CHDISPLAY is
	-- Coordinate del box
	generic
	(
		XPOS 		: IN NATURAL;
		YPOS 		: IN NATURAL
	);
	port
	(
		-- INPUT
		pixel_x 	: IN INTEGER RANGE 0 to 1000;
		pixel_y 	: IN INTEGER RANGE 0 to 500;
		char_code	: IN CHARACTER;
		
		-- OUTPUT
		drawChar	: OUT STD_LOGIC := '0' -- disegna il char quando drawChar = 1
	);
end Game_CHDISPLAY;

architecture arch of Game_CHDISPLAY is
	-- Dimensioni fisse di tutti i caratteri
	constant larghezza 	: integer range 0 to 10 := 9; 	
	constant altezza 	: integer range 0 to 20 := 16;
	-- Coordinate finali del carattere sullo schermo
	constant MAX_X 		: integer range 0 to 1000 := XPOS + larghezza; -- larghezza
	constant MAX_Y 		: integer range 0 to 500 := YPOS + altezza; -- altezza
	
	-- Segnali per il disegno dei caratteri su schermo
	signal charAddr : STD_LOGIC_VECTOR(6 downto 0); -- Indirizzo del carattere sulla ROM
	signal rowAddr	: STD_LOGIC_VECTOR(3 downto 0); -- Numero della riga di pixel del singolo carattere (0-15)
	signal charOut 	: STD_LOGIC_VECTOR(7 downto 0); -- Vettore di visualizzazione del carattere alla linea impostata

begin

CHROM: entity work.GAME_CHROM
	port map
	(
		char_addr 	=> charAddr,
		row_addr	=> rowAddr,
		data 		=> charOut
	);
	
	codeChange : process(char_code, pixel_x, pixel_y)
	begin
		rowAddr	 <= std_logic_vector(to_unsigned(pixel_y-YPOS, rowAddr'length)); -- i-esima riga (0-15)
		charAddr <= std_logic_vector(to_unsigned(character'pos(char_code), charAddr'length)); -- codice carattere (0-127)
	end process codeChange;
	
	drawChar <= '1' 
		when 
			pixel_x >= XPOS and -- limite alto del carattere
			pixel_x < MAX_X and -- limite basso del carattere
			pixel_y >= YPOS and -- limite sinistro del carattere
			pixel_y < MAX_Y and -- limite destro del carattere
			charOut(pixel_x-XPOS-1) = '1'
		else
			'0';

end arch;