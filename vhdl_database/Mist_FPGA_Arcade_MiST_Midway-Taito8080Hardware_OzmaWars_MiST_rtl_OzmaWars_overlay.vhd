library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity OzmaWars_overlay is
	port(
		Video             : in    std_logic;
		Overlay           : in    std_logic;
		CLK               : in    std_logic;
		Rst_n_s           : in    std_logic;
		HSync             : in    std_logic;
		VSync             : in    std_logic;
		CAB               : in    std_logic_vector(7 downto 0);
		O_VIDEO_R         : out   std_logic;
		O_VIDEO_G         : out   std_logic;
		O_VIDEO_B         : out   std_logic;
		O_HSYNC           : out   std_logic;
		O_VSYNC           : out   std_logic
		);
end OzmaWars_overlay;

architecture rtl of OzmaWars_overlay is

	signal HCnt            : std_logic_vector(11 downto 0);
	signal VCnt            : std_logic_vector(11 downto 0);
	signal HSync_t1        : std_logic;
	
	signal Overlay_A1      : boolean;
	signal Overlay_A2      : boolean;
	signal Overlay_A3      : boolean;
	signal Overlay_A3_VCnt : boolean;
	
	signal Overlay_B1      : boolean;
	signal Overlay_B2      : boolean;
	signal Overlay_B2_VCnt : boolean;
	
	signal Overlay_G1      : boolean;
	
	signal Overlay_P1      : boolean;
	
	signal Overlay_R1      : boolean;
	signal Overlay_R2      : boolean;
	
	signal Overlay_Y1      : boolean;
	signal Overlay_Y2      : boolean;
	signal Overlay_Y2_VCnt : boolean;

	signal VideoRGB        : std_logic_vector(2 downto 0);
	signal col_data        : std_logic_vector(3 downto 0);

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
	
  p_overlay : process(Rst_n_s, Clk)
	variable HStart : boolean;
  begin
	if Rst_n_s = '0' then
	  HCnt <= (others => '0');
	  VCnt <= (others => '0');
	  HSync_t1 <= '0';

	  Overlay_A1 <= false;
	  Overlay_A2 <= false;
	  Overlay_A3 <= false;
	  Overlay_A3_VCnt <= false;
	  
	  Overlay_B1 <= false;
	  Overlay_B2 <= false;
	  Overlay_B2_VCnt <= false;
	  
	  Overlay_G1 <= false;
	  
	  Overlay_P1 <= false;
	  
	  Overlay_R1 <= false;
	  Overlay_R2 <= false;
	  
	  Overlay_Y1 <= false;
	  Overlay_Y2 <= false;
	  Overlay_Y2_VCnt <= false;

	  
	elsif Clk'event and Clk = '1' then
	  HSync_t1 <= HSync;
	  HStart := (HSync_t1 = '0') and (HSync = '1');

	  if HStart then
		HCnt <= (others => '0');
	  else
		HCnt <= HCnt + "1";
	  end if;

	  if (VSync = '0') then
		VCnt <= (others => '0');
	  elsif HStart then
		VCnt <= VCnt + "1";
	  end if;

	  if HStart then
		if (Vcnt = 0) then
		  Overlay_A3_VCnt <= true;
		elsif (Vcnt = 86) then
		  Overlay_B2_VCnt <= true;
		  Overlay_A3_VCnt <= false;
		elsif (Vcnt = 168) then
		  Overlay_Y2_VCnt <= true;
		  Overlay_B2_VCnt <= false;
		elsif (Vcnt = 232) then
		  Overlay_Y2_VCnt <= false;
		end if;
	  end if;  
	  
	  if (HCnt = 500) and Overlay_A3_VCnt then
		Overlay_A3 <= true;
	  elsif (HCnt = 540) then
		Overlay_A3 <= false;
	  end if;
	  
	  if (HCnt = 486) and Overlay_B2_VCnt then
		Overlay_B2 <= true;
	  elsif (HCnt = 540) then
		Overlay_B2 <= false;
	  end if;

	  if (HCnt = 486) and Overlay_Y2_VCnt then
		Overlay_Y2 <= true;
	  elsif (HCnt = 540) then
		Overlay_Y2 <= false;
	  end if;

	  if (HCnt = 64) then
		Overlay_R2 <= true;
	  elsif (HCnt = 96) then
		Overlay_A2 <= true;
		Overlay_R2 <= false;
	  elsif (HCnt = 120) then
		Overlay_A2 <= false;
		Overlay_R1 <= true;
	  elsif (HCnt = 166) then
		Overlay_R1 <= false;
		Overlay_Y1 <= true;
	  elsif (HCnt = 228) then
	   Overlay_Y1 <= false;
		Overlay_P1 <= true;
	  elsif (HCnt = 292) then
		Overlay_P1 <= false;
		Overlay_A1 <= true;
	  elsif (HCnt = 358) then
		Overlay_G1 <= true;
		Overlay_A1 <= false;
	  elsif (HCnt = 430) then
		Overlay_G1 <= false;
		Overlay_B1 <= true;
	  elsif (HCnt = 486) then
		Overlay_B1 <= false;
--		if Overlay_A3_VCnt then 
--			Overlay_A2 <= true;
--		if Overlay_B2_VCnt then 
--			Overlay_B2 <= true;
--		if Overlay_Y2_VCnt then 
--			Overlay_Y2 <= true;
--	   elsif (HCnt = 500) then
--			Overlay_A3 <= false;	
--	   elsif (HCnt = 540) then
--			Overlay_B2 <= false;
--			Overlay_Y2 <= false;
	  end if; 
	end if;
  end process;

  p_video_out_comb : process(Video, Overlay_G1, Overlay_B1, Overlay_B2, Overlay_A1, Overlay_A2, Overlay_A3, Overlay_P1, Overlay_Y1, Overlay_Y2, Overlay_R1, Overlay_R2)
  begin
	if (Video = '0') then
	  VideoRGB  <= "000";
	else
	  if Overlay_A1 or Overlay_A2 or Overlay_A3 then--AQUA
		VideoRGB  <= "011";
		elsif Overlay_B1 or Overlay_B2 then--BLUE
		VideoRGB  <= "001";
	  elsif Overlay_G1 then--GREEN
		VideoRGB  <= "010";
	  elsif Overlay_P1 then--PINK
		VideoRGB  <= "101";
	  elsif Overlay_R1 or Overlay_R2 then--RED
		VideoRGB  <= "100";			
	  elsif Overlay_Y1 or Overlay_Y2 then--YELLOW
		VideoRGB  <= "110";	
	  else	  
		VideoRGB  <= "111";--WHITE
	  end if;
	end if;
  end process;
  
--  colPROM: entity work.clr
--port map(
--	clk  => Clk,
--	addr => CAB, --should be Video Counters 
--	data => col_data
--);

--  O_VIDEO_R <= col_data(2);
--  O_VIDEO_G <= col_data(1);
--  O_VIDEO_B <= col_data(0);
  
  O_VIDEO_R <= VideoRGB(2) when (Overlay = '1') else VideoRGB(0) or VideoRGB(1) or VideoRGB(2);
  O_VIDEO_G <= VideoRGB(1) when (Overlay = '1') else VideoRGB(0) or VideoRGB(1) or VideoRGB(2);
  O_VIDEO_B <= VideoRGB(0) when (Overlay = '1') else VideoRGB(0) or VideoRGB(1) or VideoRGB(2);
  O_HSYNC   <= HSync;
  O_VSYNC   <= VSync;


end;