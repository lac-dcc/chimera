library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity rom_ctl is
generic (
			constant data_width : integer := 8;
            constant addr_cnt	:integer := 20;
			constant img_width	: integer := 320;
			constant rom_depth	: integer := 256;
			constant img_height	: integer := 240
);
port (
		clk : in std_logic;
		en : in std_logic;
		rst : in std_logic;
		addr : out std_logic_vector(addr_cnt-1 downto 0);
		pix_addr : out std_logic_vector(addr_cnt-1 downto 0);
		stream_on: out std_logic;
		col : out std_logic_vector(addr_cnt -1 downto 0);
	    row : out std_logic_vector(addr_cnt -1 downto 0)
	  );
end rom_ctl;

architecture control of rom_ctl is

	signal s_en, s_count ,s_stream_on: std_logic;
	signal s_col : std_logic_vector(addr_cnt -1 downto 0);
	signal s_row : std_logic_vector(addr_cnt -1 downto 0);
	signal s_addr :std_logic_vector(addr_cnt -1 downto 0);
	signal s_pix_addr :std_logic_vector(addr_cnt -1 downto 0);

	begin
	s_en <= en;
	addr <= s_addr;
	pix_addr <= s_pix_addr;
	col <= s_col ;
	row <= s_row ;
	stream_on <= s_stream_on;
	
	addr_gen : process(rst, clk)
	begin
		if rst = '0' then			
			s_addr <= (others => '0');
			--s_col <= (others => '0');
	        --s_row <= (others => '0');
			s_count <= '0';
			s_stream_on <= '0';
		elsif rising_edge(clk) then
			if s_en = '1' then
				if s_addr < rom_depth - 1 then
					s_addr <= s_addr + 1;
					s_stream_on <= '1';
				else
					s_stream_on <= '0';
				end if;
				s_count <= '1';				
			end if;			
		end if;
	end process;
	
	col_row_gen : process(rst, clk)
	begin
		if rst = '0' then			    
			s_col <= (others => '0');
			s_row <= (others => '0');
			s_pix_addr<=(others => '0');
		elsif rising_edge(clk) then
			if s_count = '1' then
				if s_col >= img_width - 1 then
					s_col <= (others => '0');
					if s_row >= img_height - 1 then
						s_row <= (others => '0');
					else
						s_row <= s_row + 1;
					end if;
				else
					s_col <= s_col + 1;
				end if;
				
				if s_pix_addr < rom_depth - 1 then
					s_pix_addr <= s_pix_addr + 1;
				end if;
			end if;			
		end if;
	end process;
				
	
end control;

