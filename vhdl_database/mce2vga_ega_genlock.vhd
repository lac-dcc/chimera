-- CGA Genlock
-- 2017 Luis Antoniosi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ega_genlock is

    port(	
		clk 					: in std_logic;
		enable				: in std_logic;			
		vblank  				: in std_logic; 
		hblank 				: in std_logic;						
		pr						: in std_logic;
		sr						: in std_logic;
		pg						: in std_logic;
		sg						: in std_logic;
		pb						: in std_logic;
		sb						: in std_logic;
		wr_ack				: in std_logic;
		col_number			: buffer unsigned(9 downto 0); 
		row_number			: buffer unsigned(9 downto 0); 			
		wren					: out std_logic;
		wr_req				: buffer std_logic;
		pixel					: buffer unsigned(5 downto 0);
		sram_clk				: in std_logic;
		vsync					: in std_logic;
		hsync					: in std_logic;
		max_col				: out unsigned(9 downto 0);
		max_row				: out unsigned(9 downto 0);
		
		samples				: in unsigned(2 downto 0);
		top_border			: in unsigned(7 downto 0);
		left_border 		: in unsigned(7 downto 0)		
);
			
end ega_genlock;

architecture behavioral of ega_genlock is

signal hcount			 : unsigned (13 downto 0); 
signal vcount			 : unsigned (13 downto 0); 
signal rrggbb			 : unsigned (5 downto 0);
signal store_trg		 : std_logic := '0';
signal sample_adj		 : integer range 0 to 7 := 1;

signal s_col_begin	: integer range 0 to 2048 := 0;
signal s_col_end		: integer range 0 to 2048 := 752;
signal s_row_begin	: integer range 0 to 2048 := 0;
signal s_col_trg		: integer range 0 to 2048 := 656;
signal s_row_end		: integer range 0 to 2048 := 382;

begin

	
	process(clk, enable, samples, left_border, top_border)
	begin
		if (rising_edge(clk)) then	
			if (enable = '1') then
				s_col_begin <= to_integer(left_border);
				s_col_end <= to_integer(left_border) + 664;
				s_col_trg <= to_integer(left_border) + 656;
				s_row_begin <= to_integer(top_border);
				s_row_end <= to_integer(top_border) + 382;
				sample_adj <= to_integer(samples);
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
	process(clk, hcount, rrggbb, pixel, s_col_begin, s_col_end, s_row_begin, s_row_end, enable)
	begin	
		if (rising_edge(clk)) then		
			if (enable = '1') then
				wren <= '0';		
				if ((hcount(2 downto 0) = "000") and (hcount(hcount'length-1 downto 3) > s_col_begin and hcount(hcount'length-1 downto 3) < s_col_end) and (vcount > s_row_begin and vcount < s_row_end) ) then
					wren <= '1'; -- enable row RAM write
				end if;		
			end if;
		end if;
			
	end process;

	process(clk, vcount, hblank, hcount, s_row_begin, s_row_end, s_col_trg, enable)  --, s_col_begin, s_col_end
	begin		
		if (rising_edge(clk)) then		
			if (enable = '1') then
				if (wr_req = '1') then
					store_trg <= '0';
				end if;
				
				--if(hblank = '1') then			
				if((hcount(2 downto 0) = "000") and hcount(hcount'length-1 downto 3) = s_col_trg) then
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
		
	process(clk, pr, sr, pg, sg, pb, sb, enable) 
	begin
		if (rising_edge(clk)) then
			if (enable = '1') then		
				if (hcount(2 downto 0) = "111") then
					pixel <= pr & sr & pg & sg & pb & sb;
				end if;
			end if;
		end if;
	end process;	

end behavioral;
