library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;



--Not Cleaned, iam to lazy for this


entity BalloonBomber_Overlay is
	port(
		Video             : in    std_logic;
		Overlay           : in    std_logic;
		CLK               : in    std_logic;
		Rst_n_s           : in    std_logic;
		HSync             : in    std_logic;
		VSync             : in    std_logic;
		CAB               : in    std_logic_vector(9 downto 0);
		O_VIDEO_R         : out   std_logic;
		O_VIDEO_G         : out   std_logic;
		O_VIDEO_B         : out   std_logic;
		O_HSYNC           : out   std_logic;
		O_VSYNC           : out   std_logic
		);
end BalloonBomber_Overlay;

architecture rtl of BalloonBomber_Overlay is

	signal HCnt            : std_logic_vector(11 downto 0);
	signal VCnt            : std_logic_vector(11 downto 0);
	signal HSync_t1        : std_logic;
	signal Overlay_A1      : boolean;
	signal Overlay_A1_VCnt : boolean;
	signal Overlay_A2      : boolean;
	signal Overlay_A3      : boolean;
	signal Overlay_A3_VCnt : boolean;	
	signal Overlay_A4      : boolean;
	signal Overlay_A4_VCnt : boolean;	
	
	signal Overlay_R1      : boolean;
	signal Overlay_R1_VCnt : boolean;
	signal Overlay_R2      : boolean;
	signal Overlay_R3      : boolean;

	signal Overlay_Y1      : boolean;
	signal Overlay_Y1_VCnt : boolean;
	signal Overlay_Y2      : boolean;
	signal Overlay_Y3      : boolean;
	signal Overlay_Y4      : boolean;
	signal Overlay_Y4_VCnt : boolean;	
	signal Overlay_Y5      : boolean;	
	signal Overlay_Y5_VCnt : boolean;

	signal Overlay_G1      : boolean;
	signal Overlay_G1_VCnt : boolean;	
	signal Overlay_G2      : boolean;
   signal Overlay_G3      : boolean;
	signal Overlay_G4      : boolean;
	signal Overlay_G4_VCnt : boolean;	

   signal Overlay_P1      : boolean;
	signal Overlay_P2      : boolean;
	signal Overlay_P2_VCnt : boolean;	
	signal Overlay_P3      : boolean;
	signal Overlay_P3_VCnt : boolean;
	signal Overlay_P4      : boolean;
	signal Overlay_P4_VCnt : boolean;
	
	signal VideoRGB        : std_logic_vector(2 downto 0);
	signal COLOR        : std_logic_vector(3 downto 0);

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
	  
	  Overlay_G1 <= false;
	  Overlay_G1_VCnt <= false;
	  Overlay_G2 <= false;
	  Overlay_G3 <= false;
	  Overlay_G4 <= false;
	  Overlay_G4_VCnt <= false;
	  
	  Overlay_A1 <= false;
	  Overlay_A1_VCnt <= false;
	  Overlay_A2 <= false;
	  Overlay_A3 <= false;
	  Overlay_A3_VCnt <= false;
	  Overlay_A4 <= false;
	  Overlay_A4_VCnt <= false;
	  
	  Overlay_R1 <= false;
	  Overlay_R1_VCnt <= false;	  
	  Overlay_R2 <= false;
	  Overlay_R3 <= false;
	  
	  Overlay_Y1 <= false;
	  Overlay_Y1_VCnt <= false;	  
	  Overlay_Y2 <= false;
	  Overlay_Y3 <= false;
	  Overlay_Y4 <= false;
	  Overlay_Y4_VCnt <= false;	  
	  Overlay_Y5 <= false;
	  Overlay_Y5_VCnt <= false;
	  
	  Overlay_P1 <= false;
	  Overlay_P3 <= false;
	  Overlay_P3_VCnt <= false;
	  Overlay_P4 <= false;
	  Overlay_P4_VCnt <= false;
	  
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
		if (Vcnt >= 0) and (Vcnt <= 99) then
		  Overlay_A1_VCnt <= true;
		else
		  Overlay_A1_VCnt <= false;
		end if;

		if (Vcnt >= 100) and (Vcnt <= 149 ) then
		  Overlay_R1_VCnt <= true;
		else
		  Overlay_R1_VCnt <= false;
		end if;

		if (Vcnt >= 150) and (Vcnt <= 240) then
		  Overlay_Y1_VCnt <= true;
		else
		  Overlay_Y1_VCnt <= false;
		end if;

		if (Vcnt >= 236) and (Vcnt <= 16) then
		  Overlay_G1_VCnt <= true;
		else
		  Overlay_G1_VCnt <= false;
		end if;

		if (Vcnt >= 0) and (Vcnt <= 72) then
		  Overlay_G4_VCnt <= true;
		  Overlay_Y5_VCnt <= true;
		else
		  Overlay_G4_VCnt <= false;
		  Overlay_Y5_VCnt <= false;
		end if;

		if (Vcnt >= 73) and (Vcnt <= 200) then
		  Overlay_P3_VCnt <= true;
		else
		  Overlay_P3_VCnt <= false;
		end if;

		if (Vcnt >= 224) and (Vcnt <= 230) then
		  Overlay_P4_VCnt <= true;
		else
		  Overlay_P4_VCnt <= false;
		end if;

		if (Vcnt >= 160) and (Vcnt <= 166 ) then
		  Overlay_A3_VCnt <= true;
		else
		  Overlay_A3_VCnt <= false;
		end if;

		if (Vcnt >= 24 ) and (Vcnt <= 230 ) then
		  Overlay_A4_VCnt <= true;
		else
		  Overlay_A4_VCnt <= false;
		end if;
	  
	  	if (Vcnt >= 32 ) and (Vcnt <= 222 ) then
		  Overlay_P2_VCnt <= true;
		else
		  Overlay_P2_VCnt <= false;
		end if;
	  end if;
	  
	  	if (Vcnt >= 42 ) and (Vcnt <= 216 ) then------------------------------------
		  Overlay_Y4_VCnt <= true;
		else
		  Overlay_Y4_VCnt <= false;
		end if;
	  
	  if (HCnt = 518)then--ok
		if  Overlay_A1_VCnt then Overlay_A1 <= true; end if;
		if  Overlay_R1_VCnt then Overlay_R1 <= true; end if;
		if  Overlay_Y1_VCnt then Overlay_Y1 <= true; end if;
	  elsif (HCnt >= 540) then
		if  Overlay_A1_VCnt then Overlay_A1 <= false; end if;
		if  Overlay_R1_VCnt then Overlay_R1 <= false; end if;
		if  Overlay_Y1_VCnt then Overlay_Y1 <= false; end if;
	  end if;
	  
	  if (HCnt = 528)then--check
		if  Overlay_G1_VCnt then Overlay_G1 <= true; end if;
	  elsif (HCnt >= 540) then
		if  Overlay_G1_VCnt then Overlay_G1 <= false; end if;
	  end if;
	    
	  if (HCnt = 486) then--ok
		Overlay_R2 <= true;
	  elsif (HCnt = 502) then
		Overlay_R2 <= false;
	  end if;

	  if (HCnt = 438) then--ok
		Overlay_Y2 <= true;
	  elsif (HCnt = 470) then
		Overlay_Y2 <= false;	
	  end if;
	  
	  if (HCnt = 373) then--ok
		Overlay_G2 <= true;
	  elsif (HCnt = 445) then
		Overlay_G2 <= false;
	  end if;
	  
	  if (HCnt = 324) then--ok
		Overlay_P1 <= true;
	  elsif (HCnt = 380) then
		Overlay_P1 <= false;
	  end if;
	  
	  if (HCnt = 275) then--ok
		Overlay_A2 <= true;
	  elsif (HCnt = 327) then
		Overlay_A2 <= false;
	  end if;

	  if (HCnt = 210) then--ok
		Overlay_Y3 <= true;
	  elsif (HCnt = 274) then
		Overlay_Y3 <= false;
	  end if;
	  
	  if (HCnt = 166) then--ok
		Overlay_R3 <= true;
	  elsif (HCnt = 214) then
		Overlay_R3 <= false;
	  end if;	  

	  if (HCnt = 70) then--ok
		Overlay_G3 <= true;
	  elsif (HCnt = 170) then
		Overlay_G3 <= false;
	  end if;
	  
	  if (HCnt = 70) then--check
		if  Overlay_P4_VCnt then Overlay_P4 <= true; end if;
	  elsif (HCnt = 86) then
		if  Overlay_P4_VCnt then Overlay_P4 <= false; end if;
	  end if;
	  
	  if (HCnt = 0) then--ok
		if  Overlay_Y5_VCnt then Overlay_Y5 <= true; end if;
		if  Overlay_P3_VCnt then Overlay_P3 <= true; end if;
	  elsif (HCnt = 70) then
		if  Overlay_Y5_VCnt then Overlay_Y5 <= false; end if;
		if  Overlay_P3_VCnt then Overlay_P3 <= false; end if;
	  end if;
	  
	  if (HCnt = 164) then--check
		if  Overlay_A3_VCnt then Overlay_A3 <= true; end if;
	  elsif (HCnt = 172) then
		if  Overlay_A3_VCnt then Overlay_A3 <= false; end if;
	  end if;
	  
	  if (HCnt = 118) then--check
		if  Overlay_A4_VCnt then Overlay_A4 <= true; end if;
	  elsif (HCnt = 134) then
		if  Overlay_A4_VCnt then Overlay_A4 <= false; end if;
	  end if;
	 
	  if (HCnt = 102) then--check
		if  Overlay_P2_VCnt then Overlay_P2 <= true; end if;
	  elsif (HCnt = 118) then
		if  Overlay_P2_VCnt then Overlay_P2 <= false; end if;
	  end if;
	  
	  if (HCnt = 86) then--check
		if  Overlay_Y4_VCnt then Overlay_Y4 <= true; end if;
	  elsif (HCnt = 102) then
		if  Overlay_Y4_VCnt then Overlay_Y4 <= false; end if;
	  end if; 
	  
	  if (HCnt = 486) then--ok
		if  Overlay_G4_VCnt then Overlay_G4 <= true; end if;
	  elsif (HCnt = 470) then
		if  Overlay_G4_VCnt then Overlay_G4 <= false; end if;
	  end if;

	end if;
  end process;

  p_video_out_comb : process(Video)
  begin
	if (Video = '0') then
		VideoRGB  <= "000";
	elsif Overlay_R1 or Overlay_R2 or (Overlay_R3 and not Overlay_A3) then--Red      
		VideoRGB  <= "100";
	elsif Overlay_A1 or Overlay_A2 or Overlay_A3 or Overlay_A4 then--Aqua
		VideoRGB  <= "011";
	elsif (Overlay_Y1 and not Overlay_G1) or Overlay_Y2 or Overlay_Y3 or Overlay_Y4 or Overlay_Y5 then--Yellow
		VideoRGB  <= "110";	
	elsif Overlay_G1 or Overlay_G2 or (Overlay_G3 and not (Overlay_P4 or Overlay_A4 or Overlay_P2 or Overlay_Y4))-- or Overlay_G4 
	then
		VideoRGB  <= "010";	
	elsif Overlay_P1 or Overlay_P2 or Overlay_P3 or Overlay_P4 then--Purple
		VideoRGB  <= "101";		
--	elsif not (Overlay_G4) then--white 
	else
		VideoRGB  <= "111";-- end if;
	end if;
  end process;
  
--colPROM: entity work.col
--port map(
--	clk  => Clk,
--	addr => CAB, --should be Video Counters 
--	data => COLOR
--);
  O_VIDEO_R <= VideoRGB(2) when (Overlay = '1') else VideoRGB(0) or VideoRGB(1) or VideoRGB(2);
  O_VIDEO_G <= VideoRGB(1) when (Overlay = '1') else VideoRGB(0) or VideoRGB(1) or VideoRGB(2);
  O_VIDEO_B <= VideoRGB(0) when (Overlay = '1') else VideoRGB(0) or VideoRGB(1) or VideoRGB(2);
  
--  O_VIDEO_R <= COLOR(2);
--  O_VIDEO_G <= COLOR(1);
--  O_VIDEO_B <= COLOR(0);
  O_HSYNC   <= HSync;
  O_VSYNC   <= VSync;


end;