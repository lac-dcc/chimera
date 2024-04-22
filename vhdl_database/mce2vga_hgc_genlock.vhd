-- MDA Genlock
-- 2017 Luis Antoniosi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hgc_genlock is
    port(	
		clk 					: in std_logic;
		enable				: in std_logic;			
		vblank  				: in std_logic; 
		hblank 				: in std_logic;						
		video					: in std_logic;
		intensity			: in std_logic;
		wr_ack				: in std_logic;
		col_number			: buffer unsigned(9 downto 0); 
		row_number			: buffer unsigned(9 downto 0); 			
		wren					: out std_logic;
		wr_req				: buffer std_logic;
		pixel					: out unsigned(5 downto 0);
		sram_clk				: in std_logic;
		adjust_x				: buffer unsigned(4 downto 0);
		adjust_y				: buffer unsigned(4 downto 0);
		vsync					: in std_logic;
		hsync					: in std_logic;
		max_col				: out unsigned(9 downto 0);
		max_row				: out unsigned(9 downto 0);
		
		samples				: in unsigned(2 downto 0);
		top_border			: in unsigned(7 downto 0);
		left_border 		: in unsigned(7 downto 0)	
);
			
end hgc_genlock;

architecture behavioral of hgc_genlock is

signal hcount			 : unsigned (13 downto 0); 
signal vcount			 : unsigned (13 downto 0); 
signal vi	 			 : unsigned (1 downto 0);
signal store_trg		 : std_logic := '0';

signal hgc_tick	 : unsigned (5 downto 0);

signal sample_adj: integer range 0 to 7 := 1;

signal s_col_begin	: integer range 0 to 2048 := 0;
signal s_col_end		: integer range 0 to 2048 := 760;
signal s_row_begin	: integer range 0 to 2048 := 0;
signal s_row_end		: integer range 0 to 2048 := 382;

begin

	process(clk, enable, samples, left_border, top_border)
	begin
		if (rising_edge(clk)) then	
			if (enable = '1') then
				s_col_begin <= to_integer(left_border);
				s_col_end <= to_integer(left_border) + 760;
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
					hgc_tick <= (others => '0');
				else
					hgc_tick <= hgc_tick + 1;
				end if;
			end if;
		end if;
	end process;
	
	-- colum counter
	process(clk, hblank, hgc_tick, enable)
	begin		
		if (rising_edge(clk)) then
			if (enable = '1') then	
				if (hblank = '1') then
					max_col <= col_number + 1;
					if (col_number >= 807) then
						max_col <= to_unsigned(807, max_col'length);
					end if;					
					hcount <= (others => '0');
				elsif (hgc_tick(5 downto 0) /= "111111") then
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
					max_row <= row_number + 1;
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
				if ((hcount(2 downto 0) = "000") and (hcount(hcount'length-1 downto 3) > s_col_begin and hcount(hcount'length-1 downto 3) < s_col_end) and (vcount > s_row_begin and vcount < s_row_end) ) then
					wren <= '1'; -- enable row RAM write
				end if;		
			end if;
		end if;
	end process;
	
	process(clk, vcount, hblank, s_row_begin, s_row_end, enable)
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
				-- hgc is 16.000 Mhz while MDA is 16.257Mhz. This can be approximated to 63/64. So each 64 ticks skip one
				if (hgc_tick(5 downto 0) /= "111111") then
					if (hcount(2 downto 0) = "111" and hcount(hcount'length-1 downto 3) > s_col_begin and hcount(hcount'length-1 downto 3) < s_col_end) then
						col_number <= col_number + 1;
					end if;
				end if;				
				if (hblank = '1') then
					col_number <= (others => '0');
				end if;			
			end if;
		end if;
	end process;	

	process(clk, hcount, video, intensity, col_number, enable)
	variable rgbi : unsigned(3 downto 0);		
	begin	
		if (rising_edge(clk)) then
			if (enable = '1') then
				if (hcount(2 downto 0) = "111") then		
					pixel <= video & intensity & video & intensity & video & intensity;					
				end if;
			end if;
		end if;
	end process;


end behavioral;
