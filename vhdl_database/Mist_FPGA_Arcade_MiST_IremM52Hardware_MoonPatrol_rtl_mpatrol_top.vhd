library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.pace_pkg.all;
use work.video_controller_pkg.all;
use work.project_pkg.all;
use work.platform_pkg.all;
use work.target_pkg.all;

entity mpatrol_top is
	port(
		clk_sys		: in std_logic;--6
		clk_vid		: in std_logic;--24
		clk_aud	: in std_logic;-- 3.58/4
		reset			: in std_logic;
		dn_addr		: in  std_logic_vector(15 downto 0);
		dn_data		: in  std_logic_vector(7 downto 0);
		dn_wr			: in  std_logic;
		AUDIO			: out std_logic_vector(11 downto 0);
		IN0			: in std_logic_vector(7 downto 0);
		IN1			: in std_logic_vector(7 downto 0);
		IN2			: in std_logic_vector(7 downto 0);
		DIP1			: in std_logic_vector(7 downto 0);
		DIP2			: in std_logic_vector(7 downto 0);
		VBLANK		: out std_logic;
		HBLANK		: out std_logic;
		VSYNC			: out std_logic;
		HSYNC			: out std_logic;
		R				: out std_logic_vector(3 downto 0);
		G				: out std_logic_vector(3 downto 0);
		B				: out std_logic_vector(3 downto 0);
		PAL			: in  std_logic--;
	--	rst_aud     : out std_logic
);
end mpatrol_top;

architecture SYN of mpatrol_top is
	signal init       		: std_logic := '1';  
	signal clkrst_i			:	from_CLKRST_t;
	signal buttons_i			:	from_BUTTONS_t;
	signal switches_i			:	from_SWITCHES_t;
	signal leds_o				:	to_LEDS_t;
	signal inputs_i			:	from_INPUTS_t;
	signal video_i				:	from_VIDEO_t;
	signal video_o				:	to_VIDEO_t;
	signal project_i			:	from_PROJECT_IO_t;
	signal project_o			:	to_PROJECT_IO_t;
	signal platform_i			:	from_PLATFORM_IO_t;
	signal platform_o			:	to_PLATFORM_IO_t;
	signal target_i			:	from_TARGET_IO_t;
	signal target_o			:	to_TARGET_IO_t;
	signal sound_data			:	std_logic_vector(7 downto 0);
	signal rst_audD       	: 	std_logic;
	signal rst_aud        	: 	std_logic;
begin

	clkrst_i.clk(0) <= clk_sys;
	clkrst_i.clk(1) <= clk_sys;
--	clkrst_i.arst <= reset;
--	clkrst_i.arst_n <= not clkrst_i.arst;
  
	process (clk_sys)
		variable count : std_logic_vector (11 downto 0) := (others => '0');
	begin
		if rising_edge(clk_sys) then
			if count = X"FFF" then
				init <= '0';
			else
				count := count + 1;
				init <= '1';
			end if;
		end if;
	end process;

	process (clk_sys) begin
		if rising_edge(clk_sys) then
			clkrst_i.arst    <= init or reset;
			clkrst_i.arst_n  <= not clkrst_i.arst;
		end if;
	end process;

	process (clk_aud) begin
		if rising_edge(clk_aud) then
			rst_audD <= clkrst_i.arst;
			rst_aud  <= rst_audD;
		end if;
	end process;

  GEN_RESETS : for i in 0 to 3 generate

    process (clkrst_i)
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


	video_i.clk <= clkrst_i.clk(1);	-- by convention
	video_i.clk_ena <= '1';
	video_i.reset <= clkrst_i.rst(1);

	R <= video_o.rgb.r(9 downto 6);
	G <= video_o.rgb.g(9 downto 6);
	B <= video_o.rgb.b(9 downto 6);
	HSYNC <= video_o.hsync;
	VSYNC <= video_o.vsync;
	HBLANK <= video_o.hblank;
	VBLANK <= video_o.vblank;
 
pace_inst : entity work.pace                                            
	port map (
		clkrst_i				=> clkrst_i,
		palmode				=> PAL,
		buttons_i			=> buttons_i,
		switches_i			=> (others => '1'),
		IN0        			=> IN0,
		IN1        			=> IN1,
		IN2        			=> IN2,
		DIP1        		=> DIP1,
		DIP2        		=> DIP2,
		leds_o				=> open,
		inputs_i				=> inputs_i,
		video_i				=> video_i,
		video_o				=> video_o,
		sound_data_o		=> sound_data
);

moon_patrol_sound_board : entity work.moon_patrol_sound_board
	port map(
		clock_E   			=> clk_aud,
		areset        		=> rst_aud,
		select_sound 		=> sound_data,		
		audio_out    		=> AUDIO
);

end SYN;
