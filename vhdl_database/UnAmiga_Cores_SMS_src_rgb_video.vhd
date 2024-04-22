library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rgb_video is
	port (
		clk16:			in  std_logic;
		clk8:				in	 std_logic;
		x: 				out unsigned(8 downto 0);
		y:					out unsigned(7 downto 0);
		vblank:			out std_logic;
		hblank:			out std_logic;
		color:			in  std_logic_vector(5 downto 0);
		hsync:			out std_logic;
		vsync:			out std_logic;
		red:				out std_logic_vector(2 downto 0);
		green:			out std_logic_vector(2 downto 0);
		blue:				out std_logic_vector(2 downto 0)
--		; blank:			out std_logic
		);
end rgb_video;

architecture Behavioral of rgb_video is

	signal hcount:		unsigned (8 downto 0) := (others=>'0');
	signal vcount:		unsigned (8 downto 0) := (others=>'0');
	signal visible:	boolean;
	
	signal y9:			unsigned (8 downto 0);
	
	signal in_vbl:			std_logic;
	signal screen_sync:	std_logic;
	signal vbl_sync:		std_logic;

	
begin
	
	process (clk8)
	begin
		if rising_edge(clk8) then
			if hcount=511 then
				hcount <= (others => '0');
				if vcount=261 then --PAL = 311 / NTSC = 261
					vcount <= (others=>'0');
				else
					vcount <= vcount + 1;
				end if;
			else
				hcount <= hcount + 1;
			end if;
		end if;
	end process;
	
	visible		<= vcount>=35 and vcount<255 and hcount>=91 and hcount<509-38;
											--PAL = 302, NTSC = 255
	process (hcount)
	begin
		if hcount<38 then
			screen_sync <= '0';
		else
			screen_sync <= '1';
		end if;
	end process;
	
	in_vbl <= '1' when vcount<9 else '0';
	
	x					<= hcount-151;
	y9					<= vcount-40;  --PAL = -70 , NTSC = -40
	y					<= y9(7 downto 0);
	vblank			<= '1' when hcount=0 and vcount=0 else '0';
	hblank			<= '1' when hcount=0 else '0';
	
	process (vcount,hcount)
	begin
		if vcount<3 or (vcount>=6 and vcount<9) then
			-- _^^^^^_^^^^^ : low pulse = 2.35us
			if hcount<19 or (hcount>=254 and hcount<254+19) then
				vbl_sync <= '0';
			else
				vbl_sync <= '1';
			end if;
		else
			-- ____^^ : high pulse = 4.7us
			if hcount<(254-38) or (hcount>=254 and hcount<509-38) then
				vbl_sync <= '0';
			else
				vbl_sync <= '1';
			end if;
		end if;
	end process;
	
	process (in_vbl,screen_sync,vbl_sync)
	begin
		if in_vbl='1' then
			hsync <= vbl_sync;
		else
			hsync <= screen_sync;
		end if;
	end process;

vsync <= '1';
	
	process (clk16)
	begin
		if rising_edge(clk16) then
			if visible then
				red	<= color(1 downto 0) & color(1);  --Q & color;
				green	<= color(3 downto 2) & color(3);  --Q & color;
				blue	<= color(5 downto 4) & color(4);  --Q & color;
--				blank <= '0';
			else
				red	<= (others=>'0');
				green	<= (others=>'0');
				blue	<= (others=>'0');
--				blank <= '1';
			end if;
		end if;
	end process;

end Behavioral;

