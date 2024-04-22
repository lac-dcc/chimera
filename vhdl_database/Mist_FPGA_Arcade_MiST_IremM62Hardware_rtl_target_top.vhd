library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.pace_pkg.all;
use work.video_controller_pkg.all;
use work.platform_pkg.all;
use work.platform_variant_pkg.all;

entity target_top is port(
		clock_sys       : in std_logic;
		vid_clk_en      : out std_logic;
		clk_aud         : in std_logic;
		reset_in        : in std_logic;
		hwsel           : in HWSEL_t;
		palmode         : in std_logic;
		audio_out       : out std_logic_vector(11 downto 0);
		switches_i      : from_SWITCHES_t;

		usr_coin1       : in std_logic;
		usr_coin2       : in std_logic;
		usr_service     : in std_logic;
		usr_start1      : in std_logic;
		usr_start2      : in std_logic;
		p1_up           : in std_logic;
		p1_dw           : in std_logic;
		p1_lt           : in std_logic;
		p1_rt           : in std_logic;
		p1_f1           : in std_logic;
		p1_f2           : in std_logic;
		
		p2_up           : in std_logic;
		p2_dw           : in std_logic;
		p2_lt           : in std_logic;
		p2_rt           : in std_logic;
		p2_f1           : in std_logic;
		p2_f2           : in std_logic;

		VGA_VS          : out std_logic;
		VGA_HS          : out std_logic;
		VGA_R           : out std_logic_vector(3 downto 0);
		VGA_G           : out std_logic_vector(3 downto 0);
		VGA_B           : out std_logic_vector(3 downto 0);

		dl_addr         : in std_logic_vector(11 downto 0);
		dl_data         : in std_logic_vector(7 downto 0);
		dl_wr           : in std_logic;

		cpu_rom_addr    : out std_logic_vector(16 downto 0);
		cpu_rom_do      : in std_logic_vector(7 downto 0);
		snd_rom_addr    : out std_logic_vector(15 downto 0);
		snd_rom_do      : in std_logic_vector(7 downto 0);
		snd_vma         : out std_logic;
		gfx1_addr       : out std_logic_vector(17 downto 2);
		gfx1_do         : in std_logic_vector(31 downto 0);
		gfx2_addr       : out std_logic_vector(17 downto 2);
		gfx2_do         : in std_logic_vector(31 downto 0);
		gfx3_addr       : out std_logic_vector(17 downto 2);
		gfx3_do         : in std_logic_vector(31 downto 0)
  );
end target_top;

architecture SYN of target_top is 
  
  signal clkrst_i       : from_CLKRST_t;
  signal buttons_i      : from_BUTTONS_t;
  signal leds_o         : to_LEDS_t;
  signal inputs_i       : from_INPUTS_t;
  signal video_i        : from_VIDEO_t;
  signal video_o        : to_VIDEO_t;
  signal platform_i     : from_PLATFORM_IO_t;
  signal platform_o     : to_PLATFORM_IO_t;
  signal sound_data     : std_logic_vector(7 downto 0);

  signal hires          : std_logic;
  signal count          : std_logic_vector(1 downto 0);
  signal cpu_clk        : std_logic;
  signal cpu_clk_en     : std_logic;

begin

  hires <= '0' when hwsel = HW_KUNGFUM or hwsel = HW_HORIZON or hwsel = HW_BATTROAD or hwsel = HW_YOUJYUDN else '1';

  process(clock_sys) begin
    if rising_edge(clock_sys) then
      -- video clock enable: 24MHz/3 when hires, else 24MHz/4
      if hires = '1' and count = 2 then
        count <= "00";
      else
        count <= count + 1;
      end if;

      -- CPU clock = vidclk / 2
      if count = "00" then
        cpu_clk <= not cpu_clk;
      end if;
    end if;
  end process;

  cpu_clk_en <= '1' when count = "00" and cpu_clk = '1' else '0';

	clkrst_i.clk(0) <= clock_sys;
--	clkrst_i.clk(1) <= clock_vid;
	clkrst_i.clk(1) <= clock_sys;
	clkrst_i.arst <= reset_in;
	clkrst_i.arst_n <= not clkrst_i.arst;

GEN_RESETS : for i in 0 to 3 generate
	process (clkrst_i.clk(i), clkrst_i.arst)
		variable rst_r : std_logic_vector(2 downto 0) := (others => '0');
			begin
				if clkrst_i.arst = '1' then
					rst_r := (others => '1');
				elsif rising_edge(clkrst_i.clk(i)) then
					rst_r := rst_r(rst_r'left-1 downto 0) & '0';
				end if;
				clkrst_i.rst(i) <= rst_r(rst_r'left);
    end process;
end generate GEN_RESETS;

 vid_clk_en <= video_i.clk_ena;

 video_i.clk <= clkrst_i.clk(1);
-- video_i.clk_ena <= '1';
 video_i.clk_ena <= '1' when count = "00" else '0';
 video_i.reset <= clkrst_i.rst(1);
 VGA_R <= video_o.rgb.r(9 downto 6);
 VGA_G <= video_o.rgb.g(9 downto 6);
 VGA_B <= video_o.rgb.b(9 downto 6);
 VGA_HS <= video_o.hsync;
 VGA_VS <= video_o.vsync;

Sound_Board : entity work.Sound_Board
	port map(
		clock_E       => clk_aud,
		areset        => clkrst_i.rst(1),
		select_sound  => sound_data,
		audio_out     => audio_out,
		snd_rom_addr  => snd_rom_addr,
		snd_rom_do    => snd_rom_do,
		snd_vma       => snd_vma,
		dbg_cpu_addr  => open
	);

pace_inst : entity work.pace
	port map(
		clkrst_i        => clkrst_i,
		cpu_clk_en_i    => cpu_clk_en,
		hwsel           => hwsel,
		palmode         => palmode,
		hires           => hires,
		buttons_i         => buttons_i,
		switches_i        => switches_i,
		inputs_i          => inputs_i,
		video_i           => video_i,
		video_o           => video_o,
		sound_data_o      => sound_data,
		platform_i        => platform_i,
		platform_o        => platform_o,

		dl_addr           => dl_addr,
		dl_data           => dl_data,
		dl_wr             => dl_wr,

		cpu_rom_addr      => cpu_rom_addr,
		cpu_rom_do        => cpu_rom_do,
		gfx1_addr         => gfx1_addr,
		gfx1_do           => gfx1_do,
		gfx2_addr         => gfx2_addr,
		gfx2_do           => gfx2_do,
		gfx3_addr         => gfx3_addr,
		gfx3_do           => gfx3_do
    );

		inputs_i.jamma_n.coin(1) <= not usr_coin1;
		inputs_i.jamma_n.coin(2) <= not usr_coin2;
		inputs_i.jamma_n.service <= not usr_service;
		inputs_i.jamma_n.p(1).start <= not usr_start1;
		inputs_i.jamma_n.p(2).start <= not usr_start2;
		
		inputs_i.jamma_n.p(1).up <= not p1_up;
		inputs_i.jamma_n.p(1).down <= not p1_dw;
		inputs_i.jamma_n.p(1).left <= not p1_lt;
		inputs_i.jamma_n.p(1).right <= not p1_rt;
		inputs_i.jamma_n.p(1).button(1) <= not p1_f1; 
		inputs_i.jamma_n.p(1).button(2) <= not p1_f2; 
		inputs_i.jamma_n.p(1).button(3) <= '1';
		inputs_i.jamma_n.p(1).button(4) <= '1';
		inputs_i.jamma_n.p(1).button(5) <= '1';

		inputs_i.jamma_n.p(2).up <= not p2_up;
		inputs_i.jamma_n.p(2).down <= not p2_dw;
		inputs_i.jamma_n.p(2).left <= not p2_lt;
		inputs_i.jamma_n.p(2).right <= not p2_rt;		
		inputs_i.jamma_n.p(2).button(1) <= not p2_f1; 
		inputs_i.jamma_n.p(2).button(2) <= not p2_f2; 
		inputs_i.jamma_n.p(2).button(3) <= '1';
		inputs_i.jamma_n.p(2).button(4) <= '1';
		inputs_i.jamma_n.p(2).button(5) <= '1';
 
	-- not currently wired to any inputs
	inputs_i.jamma_n.coin_cnt <= (others => '1');
--	inputs_i.jamma_n.coin(2) <= '1';
--	inputs_i.jamma_n.service <= '1';
	inputs_i.jamma_n.tilt <= '1';
	inputs_i.jamma_n.test <= '1';
end SYN;
