-- CGA Genlock
-- 2017 Luis Antoniosi


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cga_genlock is
    port(	
		clk 					: in std_logic;
		enable				: in std_logic;			
		vblank  				: in std_logic; 
		hblank 				: in std_logic;						
		r  					: in std_logic;
		g   					: in std_logic;
		b  					: in std_logic;
		int					: in std_logic;
		wr_ack				: in std_logic;
		col_number			: buffer unsigned(9 downto 0); 
		row_number			: buffer unsigned(9 downto 0); 			
		wren					: out std_logic;
		wr_req				: buffer std_logic;
		pixel					: out unsigned(5 downto 0);
		sram_clk				: in std_logic;
		vsync					: in std_logic;
		hsync					: in std_logic;
		max_col				: out unsigned(9 downto 0);
		max_row				: out unsigned(9 downto 0);
		
		samples				: in unsigned(2 downto 0);
		top_border			: in unsigned(7 downto 0);
		left_border 		: in unsigned(7 downto 0);
		reset					: in std_logic;
		composite			: out std_logic
		
);
			
end cga_genlock;

architecture behavioral of cga_genlock is

constant black					: unsigned(3 downto 0) := "0000";
constant white					: unsigned(3 downto 0) := "1111";
constant lcyan					: unsigned(3 downto 0) := "0111";
constant lmagn					: unsigned(3 downto 0) := "1011";

constant dcyan					: unsigned(3 downto 0) := "0110";
constant dmagn  				: unsigned(3 downto 0) := "1010";
constant lgray					: unsigned(3 downto 0) := "1110";
constant dkred					: unsigned(3 downto 0) := "1000";
constant ltred					: unsigned(3 downto 0) := "1001";
constant green					: unsigned(3 downto 0) := "0101";
constant dgren					: unsigned(3 downto 0) := "0100";
constant yello					: unsigned(3 downto 0) := "1101";
constant dyell					: unsigned(3 downto 0) := "1100";



signal hcount	  			: unsigned (13 downto 0); 
signal vcount	  			: unsigned (13 downto 0); 
signal rgbi					: unsigned (3 downto 0);

signal store_trg		 	: std_logic := '0';
signal sample_adj			: integer range 0 to 7 := 1;

signal s_col_begin		: integer range 0 to 2048 := 90;
signal s_col_end			: integer range 0 to 2048 := 90+800;
signal s_row_begin		: integer range 0 to 2048 := 20;
signal s_row_end			: integer range 0 to 2048 := 20+232;
signal s_trg_reset		: std_logic := '0';
signal s_composite		: std_logic := '0';
signal s_pixel_queue 	: unsigned(15 downto 0);	
signal s_rgbcomp			: unsigned(5 downto 0);
signal s_rgbcomp_avg		: unsigned(5 downto 0);
signal s_phase				: unsigned(1 downto 0);

begin

	process(clk, enable, samples, left_border, top_border)
	begin
		if (rising_edge(clk)) then	
			if (enable = '1') then
				s_col_begin <= to_integer(left_border);
				s_col_end <= to_integer(left_border) + 800;
				s_row_begin <= to_integer(top_border);
				s_row_end <= to_integer(top_border) + 261;
				sample_adj <= to_integer(samples);
			end if;
		end if;
	end process;
	
	process(clk, reset, enable)
	variable latch : std_logic := '0';
	variable peak: integer range 0 to 255*1024 := 255*1024;
	begin
		if (rising_edge(clk)) then			
			s_trg_reset <= '0';
			if (enable = '1') then			
				if (reset /= latch) then				
					if (peak > 0) then
						peak := peak - 1;
					else
						latch := reset;
						peak := 255*1024;
						
						if (reset = '0') then
							s_trg_reset <= '1';
						end if;
						
					end if;	
				else
				
					peak := 255*1024;
					
				end if;
				
			end if;		
		end if;
	end process;

	process(clk, s_trg_reset, enable)
	begin
	if (rising_edge(clk)) then
		if (enable = '1') then
			if (s_trg_reset = '1') then
				s_composite <= not s_composite;
			end if;
		end if;
	end if;
	end process;

	-- colum counter
	process(clk, hblank, enable)
	begin		
		if (rising_edge(clk)) then
			if (enable = '1') then		
				if (hblank = '1') then
					max_col <= col_number;
					if (col_number >= 759) then
						max_col <= to_unsigned(759, max_col'length);
					end if;					
					hcount <= (others => '0');
				else
					hcount <= hcount + 1;
				end if;
			end if;
		end if;
		
	end process;

	-- line counter
	process(clk, hblank, vblank, enable)
	begin

		if (rising_edge(clk)) then
			if (enable = '1') then		
				if (hblank = '1') then
					vcount <= vcount + 1;
				elsif (vblank = '1') then
					max_row <= row_number;
					vcount <= (others => '0');
				end if;
			end if;
		end if;
		
	end process;

	-- sram sync
	process(sram_clk, hcount, hblank, wr_ack)
	begin
		if (wr_ack = '1') then
			wr_req <= '0';
		elsif (rising_edge(sram_clk)) then
			if (store_trg = '1') then
				wr_req <= '1'; -- dispatch row to SRAM
			end if;
		end if;
	end process;

	-- col / row adjustment
	process(clk, hcount, s_col_begin, s_col_end, s_row_begin, s_row_end, enable)
	begin	
		if (rising_edge(clk)) then		
			if (enable = '1') then
				wren <= '0';		
				if ((hcount(2 downto 0) = "111") and (hcount(hcount'length-1 downto 3) > s_col_begin and hcount(hcount'length-1 downto 3) < s_col_end) and (vcount > s_row_begin and vcount < s_row_end) ) then
					wren <= '1'; -- enable row RAM write
				end if;		
			end if;
		end if;
			
	end process;
	
	process(clk, vcount, hblank, enable)
	begin		
		if (rising_edge(clk)) then		
			if (enable = '1') then
				if (wr_req = '1') then
					store_trg <= '0';
				end if;
				
				if (hblank = '1') then			
					if (vcount > s_row_begin and vcount < s_row_end) then
						row_number <= row_number + 1;
						store_trg <= '1';
					end if;				
				end if;
				
				if (vblank = '1') then				
					row_number <= (others => '0');				
				end if;
			end if;
		end if;
	
	end process;
	
	process(clk, hcount, hblank, s_col_begin, s_col_end, enable)
	begin		
		if (rising_edge(clk)) then		
			if (enable = '1') then
				if (hcount(2 downto 0) = "111" and hcount(hcount'length-1 downto 3) > s_col_begin and hcount(hcount'length-1 downto 3) < s_col_end) then
					col_number <= col_number + 1;
				end if;
					
				if (hblank = '1') then
					col_number <= (others => '0');
				end if;
			end if;
		end if;	
	end process;

	process(clk, hcount, r, g, b, int, enable, s_composite) 
	begin
		if (rising_edge(clk)) then	
			if (enable = '1') then -- and s_composite = '1') then		
				if (hcount(2 downto 0) = "111") then			
					-- rotate the pixel queue
					s_pixel_queue(15 downto 4) <= s_pixel_queue(11 downto 0);
					s_pixel_queue(3 downto 0) <=  r & g & b & int;	
				end if;
			end if;
		end if;
	end process;	
	
	process(clk, hcount, s_col_begin, enable, s_composite) 
	begin
		if (rising_edge(clk)) then	
			if (enable = '1') then -- and s_composite = '1') then		
				s_phase <= to_integer(hcount(4 downto 3)) + to_unsigned(s_col_begin, 11)(1 downto 0);
			end if;
		end if;
	end process;

	process(clk, hcount, s_pixel_queue, s_phase, enable, s_composite)
	variable shifted : unsigned(15 downto 0);
	begin
		if (rising_edge(clk)) then	
			if (enable = '1') then -- and s_composite = '1') then		
				if (hcount(2 downto 0) = "111") then
				
					-- shifts the queue based on current column position
					case (s_phase) is
						when "00" =>
							shifted := s_pixel_queue;
						when "01" =>
							shifted(15 downto 12) := s_pixel_queue(3 downto 0);
							shifted(11 downto 0) := s_pixel_queue(15 downto 4);
						when "10" =>
							shifted(15 downto 8) := s_pixel_queue(7 downto 0);
							shifted(7 downto 0) := s_pixel_queue(15 downto 8);
						when "11" =>
							shifted(15 downto 4) := s_pixel_queue(11 downto 0);
							shifted(3 downto 0) := s_pixel_queue(15 downto 12);
					end case;
				
					case (shifted) is
						-- black and white 640x200
						when black&black&black&black 						=> s_rgbcomp <= "000000"; -- black
						when black&black&black&white						=> s_rgbcomp <= "001001"; -- green
						when black&black&white&black						=> s_rgbcomp <= "010011"; -- blue
						when black&black&white&white						=> s_rgbcomp <= "001011"; -- ligth blue
						when black&white&black&black						=> s_rgbcomp <= "100000"; -- red
						when black&white&black&white						=> s_rgbcomp <= "101010"; -- gray
						when black&white&white&black						=> s_rgbcomp <= "110011"; -- dmagn
						when black&white&white&white						=> s_rgbcomp <= "111011"; -- pink
						when white&black&black&black						=> s_rgbcomp <= "000100"; -- dark green
						when white&black&black&white						=>	s_rgbcomp <= "001100"; -- light green
						when white&black&white&black						=> s_rgbcomp <= "010101"; -- dark gray
						when white&black&white&white						=> s_rgbcomp <= "011110"; -- acqua
						when white&white&black&black						=> s_rgbcomp <= "110100"; -- orange
						when white&white&black&white						=> s_rgbcomp <= "111100"; -- light yellow
						when white&white&white&black						=> s_rgbcomp <= "111010"; -- salmon
						when white&white&white&white						=> s_rgbcomp <= "111111"; -- white
						
						-- black and lgray 640x200
	--					when black&black&black&black 						=> s_rgbcomp <= "000000"; -- black
						when black&black&black&lgray						=> s_rgbcomp <= "001000"; -- green
						when black&black&lgray&black						=> s_rgbcomp <= "000011"; -- blue
						when black&black&lgray&lgray						=> s_rgbcomp <= "001011"; -- ligth blue
						when black&lgray&black&black						=> s_rgbcomp <= "100000"; -- red
						when black&lgray&black&lgray						=> s_rgbcomp <= "010101"; -- gray
						when black&lgray&lgray&black						=> s_rgbcomp <= "110011"; -- dmagn
						when black&lgray&lgray&lgray						=> s_rgbcomp <= "011011"; -- pink
						when lgray&black&black&black						=> s_rgbcomp <= "010100"; -- dark brown
						when lgray&black&black&lgray						=>	s_rgbcomp <= "001100"; -- light green
						when lgray&black&lgray&black						=> s_rgbcomp <= "010001"; -- dark brown
						when lgray&black&lgray&lgray						=> s_rgbcomp <= "001110"; -- acqua green
						when lgray&lgray&black&black						=> s_rgbcomp <= "110100"; -- orange
						when lgray&lgray&black&lgray						=> s_rgbcomp <= "101000"; -- yellow
						when lgray&lgray&lgray&black						=> s_rgbcomp <= "110011"; -- magenta
						when lgray&lgray&lgray&lgray						=> s_rgbcomp <= "111111"; -- lgray										

						
	--
						-- pallete 1 (high) 320x200
	--					when black&black&black&black 						=> s_rgbcomp <= "000000"; -- black
						when black&black&lcyan&lcyan						=> s_rgbcomp <= "000111"; -- light blue
						when black&black&lmagn&lmagn						=> s_rgbcomp <= "000011"; -- blue
	--					when black&black&white&white						=> s_rgbcomp <= "001011"; -- light blue
						when lcyan&lcyan&black&black						=> s_rgbcomp <= "100000"; -- red
						when lcyan&lcyan&lcyan&lcyan						=> s_rgbcomp <= "011110"; -- acqua;
						when lcyan&lcyan&lmagn&lmagn						=> s_rgbcomp <= "101010"; -- gray
						when lcyan&lcyan&white&white						=> s_rgbcomp <= "011111"; -- light cyan
						when lmagn&lmagn&black&black						=> s_rgbcomp <= "110000"; -- light red
						when lmagn&lmagn&lcyan&lcyan						=> s_rgbcomp <= "101111"; -- light cyan
						when lmagn&lmagn&lmagn&lmagn						=> s_rgbcomp <= "111011"; -- light dmagn
						when lmagn&lmagn&white&white						=> s_rgbcomp <= "001111"; -- light purple
	--					when white&white&black&black						=> s_rgbcomp <= "110100"; -- orange
						when white&white&lcyan&lcyan						=> s_rgbcomp <= "111110"; -- light yellow
						when white&white&lmagn&lmagn						=> s_rgbcomp <= "111010"; -- salmon
	--					when white&white&white&white						=> s_rgbcomp <= "111111"; -- white;
					
						-- tandy 1000 / old cga
						when dcyan&dcyan&white&white						=> s_rgbcomp <= "011111"; -- light cyan
						when dmagn&dmagn&white&white						=> s_rgbcomp <= "001111"; -- light purple
						when white&white&dcyan&dcyan						=> s_rgbcomp <= "111110"; -- light yellow
						when white&white&dmagn&dmagn						=> s_rgbcomp <= "111010"; -- salmon

						-- pallete 1 (low) 320x200
	--					when black&black&black&black 						=> composite <= "000000"; -- black
						when black&black&dcyan&dcyan						=> s_rgbcomp <= "001011"; -- blue
						when black&black&dmagn&dmagn						=> s_rgbcomp <= "000011"; -- blue
	--					when black&black&lgray&lgray						=> s_rgbcomp <= "001011"; -- blue
						when dcyan&dcyan&black&black						=> s_rgbcomp <= "010000"; -- dark red
						when dcyan&dcyan&dcyan&dcyan						=> s_rgbcomp <= "001110"; -- acqua
						when dcyan&dcyan&dmagn&dmagn						=> s_rgbcomp <= "010001"; -- some brown/blue
						when dcyan&dcyan&lgray&lgray						=> s_rgbcomp <= "011111"; -- dcyan
						when dmagn&dmagn&black&black						=> s_rgbcomp <= "100000"; -- red
						when dmagn&dmagn&dcyan&dcyan						=> s_rgbcomp <= "011011"; -- blue
						when dmagn&dmagn&dmagn&dmagn						=> s_rgbcomp <= "100011"; -- purple
						when dmagn&dmagn&lgray&lgray						=> s_rgbcomp <= "001011"; -- blue
	--					when lgray&lgray&black&black						=> s_rgbcomp <= "110000"; -- red
						when lgray&lgray&dcyan&dcyan						=> s_rgbcomp <= "111010"; -- salmon
						when lgray&lgray&dmagn&dmagn						=> s_rgbcomp <= "110101"; -- red
	--					when lgray&lgray&lgray&lgray						=> s_rgbcomp <= "111111"; -- white;					

						-- pallete 0 320x200
						--when black&black&black&black 					=> s_rgbcomp <= "000000"; -- black
						when black&black&green&green						=> s_rgbcomp <= "001011"; -- light blue
						when black&black&ltred&ltred						=> s_rgbcomp <= "000010"; -- blue
						when black&black&yello&yello						=> s_rgbcomp <= "000111"; -- light blue
						when green&green&black&black						=> s_rgbcomp <= "100000"; -- red
						when green&green&green&green						=> s_rgbcomp <= "011100"; -- acqua;
						when green&green&ltred&ltred						=> s_rgbcomp <= "101000"; -- dark yello
						when green&green&yello&yello						=> s_rgbcomp <= "101101"; -- light cyan
						when ltred&ltred&black&black						=> s_rgbcomp <= "100000"; -- red
						when ltred&ltred&green&green						=> s_rgbcomp <= "101010"; -- gray
						when ltred&ltred&ltred&ltred						=> s_rgbcomp <= "110110"; -- light dmagn
						when ltred&ltred&yello&yello						=> s_rgbcomp <= "111010"; -- salmon
						when yello&yello&black&black						=> s_rgbcomp <= "110000"; -- red
						when yello&yello&green&green						=> s_rgbcomp <= "111100"; -- yello
						when yello&yello&ltred&ltred						=> s_rgbcomp <= "111000"; -- light orange
						when yello&yello&yello&yello						=> s_rgbcomp <= "111101"; -- light yellow;
						
						-- pallete 0 320x200
						--when black&black&black&black 					=> s_rgbcomp <= "000000"; -- black
						when black&black&dgren&dgren						=> s_rgbcomp <= "001010"; -- cyan
						when black&black&dkred&dkred						=> s_rgbcomp <= "000001"; -- blue
						when black&black&dyell&dyell						=> s_rgbcomp <= "000111"; -- light blue
						when dgren&dgren&black&black						=> s_rgbcomp <= "100000"; -- red
						when dgren&dgren&dgren&dgren						=> s_rgbcomp <= "001100"; -- green
						when dgren&dgren&dkred&dkred						=> s_rgbcomp <= "100000"; -- red
						when dgren&dgren&dyell&dyell						=> s_rgbcomp <= "001100"; -- green
						when dkred&dkred&black&black						=> s_rgbcomp <= "110000"; -- red
						when dkred&dkred&dgren&dgren						=> s_rgbcomp <= "101001"; -- light brown
						when dkred&dkred&dkred&dkred						=> s_rgbcomp <= "110000"; -- red        
						when dkred&dkred&dyell&dyell						=> s_rgbcomp <= "101010"; -- gray
						when dyell&dyell&black&black						=> s_rgbcomp <= "110000"; -- red
						when dyell&dyell&dgren&dgren						=> s_rgbcomp <= "101101"; -- greenish
						when dyell&dyell&dkred&dkred						=> s_rgbcomp <= "110000"; -- red
						when dyell&dyell&dyell&dyell						=> s_rgbcomp <= "111101"; -- light yellw;										
						
						when others 											=> s_rgbcomp <= s_pixel_queue(3) & s_pixel_queue(0) & s_pixel_queue(2) & s_pixel_queue(0) & s_pixel_queue(1) & s_pixel_queue(0); -- default non coded color
						
					end case;
				
				end if;
			end if;
		end if;
	end process;	
	
	process(clk, hcount, r, g, b, int, s_rgbcomp, enable, s_composite) 
	variable rgb : unsigned(5 downto 0);	
	begin
		if (rising_edge(clk)) then				
			if (enable = '1') then		
				if (hcount(2 downto 0) = "111") then
				
					if (s_composite = '0') then
						rgb := r & int & g & int & b & int;	
						case(rgb) is
							when "101000" => pixel <= "100100"; -- BROWN
							when others => pixel <= rgb; 
						end case;
					else
						pixel <= s_rgbcomp;
					end if;							
				end if;				
			end if;
		end if;
		
	end process;
	
	composite <= s_composite;
	
end behavioral;
