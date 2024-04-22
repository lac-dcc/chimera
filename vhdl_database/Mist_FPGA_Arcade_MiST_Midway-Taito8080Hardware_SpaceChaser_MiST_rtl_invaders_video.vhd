library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;


entity invaders_video is
	port(
		Video             : in    std_logic;
		Overlay           : in    std_logic;
		CLK               : in    std_logic;
		Rst_n_s           : in    std_logic;
		HSync             : in    std_logic;
		VSync             : in    std_logic;
		O_VIDEO_R         : out   std_logic;
		O_VIDEO_G         : out   std_logic;
		O_VIDEO_B         : out   std_logic;
		O_HSYNC           : out   std_logic;
		O_VSYNC           : out   std_logic
		);
end invaders_video;

architecture rtl of invaders_video is

	signal HCnt            : std_logic_vector(11 downto 0);
	signal VCnt            : std_logic_vector(11 downto 0);
	signal HSync_t1        : std_logic;
	signal VideoRGB        : std_logic_vector(3 downto 0);
begin	
	process (Rst_n_s, Clk)
		variable cnt : unsigned(3 downto 0);
	begin
		if Rst_n_s = '0' then
			cnt := "0000";
		elsif Clk'event and Clk = '1' then
			if cnt = 9 then
				cnt := "0000";
			else
				cnt := cnt + 1;
			end if;
		end if;
	end process;
	

--  p_video_out_comb : process(Video, Overlay_G1, Overlay_G2, Overlay_R1)
--  begin
--	if (Video = '0') then
--	  VideoRGB  <= "000";
--	else
--	  if Overlay_G1 or Overlay_G2 then
--		VideoRGB  <= "010";
--	  elsif Overlay_R1 then
--		VideoRGB  <= "100";
--	  else
--		VideoRGB  <= "111";
--	  end if;
--	end if;
--  end process;

rom: entity work.col
		port map(
	clk => CLK,
	addr => VCnt(7 downto 3) & HCnt(7 downto 3),
	data => VideoRGB
);

  O_VIDEO_R <= Video;-- or VideoRGB(0);
  O_VIDEO_G <= Video;-- or VideoRGB(1);
  O_VIDEO_B <= Video;-- or VideoRGB(2);

--  O_VIDEO_R <= VideoRGB(2) when (Overlay = '1') else VideoRGB(0) or VideoRGB(1) or VideoRGB(2);
--  O_VIDEO_G <= VideoRGB(1) when (Overlay = '1') else VideoRGB(0) or VideoRGB(1) or VideoRGB(2);
--  O_VIDEO_B <= VideoRGB(0) when (Overlay = '1') else VideoRGB(0) or VideoRGB(1) or VideoRGB(2);
  O_HSYNC   <= not HSync;
  O_VSYNC   <= not VSync;


end;