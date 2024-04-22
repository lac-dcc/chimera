-- Space Invaders top level for
-- ps/2 keyboard interface with sound and scan doubler MikeJ
--
-- Version : 0300
--
-- Copyright (c) 2002 Daniel Wallner (jesus@opencores.org)
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-- The latest version of this file can be found at:
--      http://www.fpgaarcade.com
--
-- Limitations :
--
-- File history :
--
--      0241 : First release
--
--      0242 : added the ROM from mw8080.vhd
--
--      0300 : MikeJ tidy up for audio release

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity invaders_top is
	port(
    I_BUTTON          : in    std_logic_vector(7 downto 0);
		--
		O_VIDEO_R         : out   std_logic;
		O_VIDEO_G         : out   std_logic;
		O_VIDEO_B         : out   std_logic;
		O_HSYNC           : out   std_logic;
		O_VSYNC           : out   std_logic;
		--
		O_AUDIO_L         : out   std_logic;
		O_AUDIO_R         : out   std_logic;
		--
		JOYSTICK_GND      : out   std_logic;
		--
		I_RESET           : in    std_logic;
		OSC_IN            : in    std_logic
		);
end invaders_top;

architecture rtl of invaders_top is

	signal I_RESET_L       : std_logic;
	signal Clk             : std_logic;
	signal Clk_x2          : std_logic;
	signal Rst_n_s         : std_logic;

	signal DIP             : std_logic_vector(8 downto 1);
	signal RWE_n           : std_logic;
	signal Video           : std_logic;
	signal VideoRGB        : std_logic_vector(2 downto 0);
	signal VideoRGB_X2     : std_logic_vector(7 downto 0);
	signal HSync           : std_logic;
	signal VSync           : std_logic;
	signal HSync_X2        : std_logic;
	signal VSync_X2        : std_logic;

	signal AD              : std_logic_vector(15 downto 0);
	signal RAB             : std_logic_vector(12 downto 0);
	signal RDB             : std_logic_vector(7 downto 0);
	signal RWD             : std_logic_vector(7 downto 0);
	signal IB              : std_logic_vector(7 downto 0);
	signal SoundCtrl3      : std_logic_vector(5 downto 0);
	signal SoundCtrl5      : std_logic_vector(5 downto 0);

	signal Buttons         : std_logic_vector(8 downto 0);
	signal Buttons_n       : std_logic_vector(8 downto 1);

	signal Tick1us         : std_logic;

	signal Reset           : std_logic;

	signal rom_data_0      : std_logic_vector(7 downto 0);
	signal rom_data_1      : std_logic_vector(7 downto 0);
	signal rom_data_2      : std_logic_vector(7 downto 0);
	signal rom_data_3      : std_logic_vector(7 downto 0);
	signal ram_we          : std_logic;
	--
	signal HCnt            : std_logic_vector(11 downto 0);
	signal VCnt            : std_logic_vector(11 downto 0);
	signal HSync_t1        : std_logic;
	signal Overlay_G1      : boolean;
	signal Overlay_G2      : boolean;
	signal Overlay_R1      : boolean;
	signal Overlay_G1_VCnt : boolean;
  --
  signal button_in        : std_logic_vector(7 downto 0);
  signal button_debounced : std_logic_vector(7 downto 0);
	--
	signal Audio           : std_logic_vector(7 downto 0);
	signal AudioPWM        : std_logic;
begin

  JOYSTICK_GND <= '0';

  ----------------------------------------------------------------------------------------------------------------------------------
  -- Disable unused components
  ----------------------------------------------------------------------------------------------------------------------------------
  --
  --StrataFLASH must be disabled to prevent it conflicting with the LCD display
  --
  --
  I_RESET_L <= not I_RESET;
  --
  u_clocks : entity work.INVADERS_CLOCKS
	port map (
	   I_CLK_REF  => OSC_IN,
	   I_RESET_L  => I_RESET_L,
	   --
	   O_CLK      => Clk,
	   O_CLK_X2   => Clk_x2
	 );

	Buttons_n <= not Buttons(8 downto 1);
	DIP <= "00000000";

	core : entity work.invaders
		port map(
			Rst_n      => I_RESET_L,
			Clk        => Clk,
			MoveLeft   => Buttons(0),
			MoveRight  => Buttons(1),
			Coin       => Buttons(2),
			Sel1Player => Buttons(3),
			Sel2Player => Buttons(5), --added 2p start
			Fire       => Buttons(4),
			DIP        => DIP,
			RDB        => RDB,
			IB         => IB,
			RWD        => RWD,
			RAB        => RAB,
			AD         => AD,
			SoundCtrl3 => SoundCtrl3,
			SoundCtrl5 => SoundCtrl5,
			Rst_n_s    => Rst_n_s,
			RWE_n      => RWE_n,
			Video      => Video,
			HSync      => HSync,
			VSync      => VSync
			);
	--
	-- ROM
	--
	u_rom : entity work.INVADERS_ROM
	  port map (
		CLK         => Clk,
		ENA         => '1',
		ADDR        => AD(12 downto 0),
		DATA        => IB
		);

--	u_rom_h : entity work.INVADERS_ROM_H
--	  port map (
--		CLK         => Clk,
--		ENA         => '1',
--		ADDR        => AD(10 downto 0),
--		DATA        => rom_data_0
--		);
--	--
--	u_rom_g : entity work.INVADERS_ROM_G
--	  port map (
--		CLK         => Clk,
--		ENA         => '1',
--		ADDR        => AD(10 downto 0),
--		DATA        => rom_data_1
--		);
--	--
--	u_rom_f : entity work.INVADERS_ROM_F
--	  port map (
--		CLK         => Clk,
--		ENA         => '1',
--		ADDR        => AD(10 downto 0),
--		DATA        => rom_data_2
--		);
--	--
--	u_rom_e : entity work.INVADERS_ROM_E
--	  port map (
--		CLK         => Clk,
--		ENA         => '1',
--		ADDR        => AD(10 downto 0),
--		DATA        => rom_data_3
--		);
--	--
--	p_rom_data : process(AD, rom_data_0, rom_data_1, rom_data_2, rom_data_3)
--	begin
--	  IB <= (others => '0');
--	  case AD(12 downto 11) is
--		when "00" => IB <= rom_data_0;
--		when "01" => IB <= rom_data_1;
--		when "10" => IB <= rom_data_2;
--		when "11" => IB <= rom_data_3;
--		when others => null;
--	  end case;
--	end process;
	--
	-- SRAM
	--
	ram_we <= not RWE_n;

	rams : for i in 0 to 3 generate
	  u_ram : component RAMB16_S2
	  port map (
		do   => RDB((i*2)+1 downto (i*2)),
		addr => RAB,
		clk  => Clk,
		di   => RWD((i*2)+1 downto (i*2)),
		en   => '1',
		ssr  => '0',
		we   => ram_we
		);
	end generate;
	--
	-- Glue
	--
	process (Rst_n_s, Clk)
		variable cnt : unsigned(3 downto 0);
	begin
		if Rst_n_s = '0' then
			cnt := "0000";
			Tick1us <= '0';
		elsif Clk'event and Clk = '1' then
			Tick1us <= '0';
			if cnt = 9 then
				Tick1us <= '1';
				cnt := "0000";
			else
				cnt := cnt + 1;
			end if;
		end if;
	end process;


  button_in(7 downto 0) <= I_BUTTON(7 downto 0);

  u_debounce : entity work.BUTTON_DEBOUNCE
  generic map (
    G_WIDTH => 8
    )
  port map (
    I_BUTTON => button_in,
    O_BUTTON => button_debounced,
    CLK      => clk
    );

  p_input_registers : process
	begin
    wait until rising_edge(Clk);
	  if I_RESET = '1' then
			Buttons <= (others => '0');
		end if;
		if Rst_n_s = '0' then
			Buttons <= (others => '0');
		else
			Buttons(0) <= button_debounced(2); -- Left
			Buttons(1) <= button_debounced(3); -- Right
			Buttons(2) <= button_debounced(6); -- Coin
			Buttons(3) <= button_debounced(7); -- Player1
			Buttons(4) <= button_debounced(4); -- Fire
			Buttons(5) <= button_debounced(5); --2Player start
		end if;
	end process;
  --
  -- Video Output
  --
  p_overlay : process(Rst_n_s, Clk)
	variable HStart : boolean;
  begin
	if Rst_n_s = '0' then
	  HCnt <= (others => '0');
	  VCnt <= (others => '0');
	  HSync_t1 <= '0';
	  Overlay_G1_VCnt <= false;
	  Overlay_G1 <= false;
	  Overlay_G2 <= false;
	  Overlay_R1 <= false;
	elsif Clk'event and Clk = '1' then
	  HSync_t1 <= HSync;
	  HStart := (HSync_t1 = '0') and (HSync = '1');-- rising

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
		if (Vcnt = x"1F") then
		  Overlay_G1_VCnt <= true;
		elsif (Vcnt = x"95") then
		  Overlay_G1_VCnt <= false;
		end if;
	  end if;

	  if (HCnt = x"027") and Overlay_G1_VCnt then
		Overlay_G1 <= true;
	  elsif (HCnt = x"046") then
		Overlay_G1 <= false;
	  end if;

	  if (HCnt = x"046") then
		Overlay_G2 <= true;
	  elsif (HCnt = x"0B6") then
		Overlay_G2 <= false;
	  end if;

	  if (HCnt = x"1A6") then
		Overlay_R1 <= true;
	  elsif (HCnt = x"1E6") then
		Overlay_R1 <= false;
	  end if;

	end if;
  end process;

  p_video_out_comb : process(Video, Overlay_G1, Overlay_G2, Overlay_R1)
  begin
	if (Video = '0') then
	  VideoRGB  <= "000";
	else
	  if Overlay_G1 or Overlay_G2 then
		VideoRGB  <= "010";
	  elsif Overlay_R1 then
		VideoRGB  <= "100";
	  else
		VideoRGB  <= "111";
	  end if;
	end if;
  end process;

  u_dblscan : entity work.DBLSCAN
	port map (
	  RGB_IN(7 downto 3) => "00000",
	  RGB_IN(2 downto 0) => VideoRGB,
	  HSYNC_IN           => HSync,
	  VSYNC_IN           => VSync,

	  RGB_OUT            => VideoRGB_X2,
	  HSYNC_OUT          => HSync_X2,
	  VSYNC_OUT          => VSync_X2,
	  --  NOTE CLOCKS MUST BE PHASE LOCKED !!
	  CLK                => Clk,
	  CLK_X2             => Clk_x2
	);

  O_VIDEO_R <= VideoRGB_X2(2);
  O_VIDEO_G <= VideoRGB_X2(1);
  O_VIDEO_B <= VideoRGB_X2(0);
  O_HSYNC   <= not HSync_X2;
  O_VSYNC   <= not VSync_X2;
  --
  -- Audio
  --
  u_audio : entity work.invaders_audio
	port map (
	  Clk => Clk,
	  P3  => SoundCtrl3,
	  P5  => SoundCtrl5,
	  Aud => Audio
	  );

  u_dac : entity work.dac
	generic map(
	  msbi_g => 7
	)
	port  map(
	  clk_i   => Clk,
	  res_n_i => Rst_n_s,
	  dac_i   => Audio,
	  dac_o   => AudioPWM
	);

  O_AUDIO_L <= AudioPWM;
  O_AUDIO_R <= AudioPWM;

end;
