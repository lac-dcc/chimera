library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_arith.all;
--use IEEE.std_logic_unsigned.all;

library work;
use work.pace_pkg.all;
use work.video_controller_pkg.all;
use work.sprite_pkg.all;
use work.platform_pkg.all;

entity sprite_array is
  generic
  (
    N_SPRITES   : integer;
    DELAY       : integer
  );
	port
	(
		reset				: in std_logic;

    -- register interface
    reg_i       : in to_SPRITE_REG_t;

    -- video control signals
    video_ctl   : in from_VIDEO_CTL_t;

    -- extra data
    graphics_i  : in to_GRAPHICS_t;

		-- sprite data
    row_a       : out SPRITE_ROW_A_t;
    row_d       : in SPRITE_ROW_D_t;

    -- video data
    rgb         : out RGB_t;
    set         : out std_logic;
    pri         : out std_logic;
    spr0_set    : out std_logic
	);
end entity sprite_array;

architecture SYN of sprite_array is

	type reg_a_t is array (natural range <>) of from_SPRITE_REG_t;
  type ctl_i_a_t is array (natural range <>) of to_SPRITE_CTL_t;
  type ctl_o_a_t is array (natural range <>) of from_SPRITE_CTL_t;
  
	alias clk       : std_logic is video_ctl.clk;
	alias clk_ena   : std_logic is video_ctl.clk_ena;
	
	signal reg_o    : reg_a_t(0 to N_SPRITES-1);
  signal ctl_i    : ctl_i_a_t(0 to N_SPRITES-1);
  signal ctl_o    : ctl_o_a_t(0 to N_SPRITES-1);
	
	signal ld_r     : std_logic_vector(N_SPRITES-1 downto 0);
	
begin

	-- Sprite Data Load Arbiter
	-- - enables each sprite controller during hblank
	--   to allow loading of sprite row data into row buffer
	process (clk, clk_ena, reset)
		variable i : integer range 0 to N_SPRITES-1;
	begin
		if reset = '1' then
			-- enable must be 1 clock behind address to latch data after fetch
			--ld_r <= (N_SPRITES-1 => '1', others => '0');
      -- make ISE 9.2.03i happy...
			ld_r(ld_r'left) <= '1';
			ld_r(ld_r'left-1 downto 0) <= (others => '0');
			i := 0;
		elsif rising_edge(clk) and clk_ena = '1' then
			ld_r <= ld_r(ld_r'left-1 downto 0) & ld_r(ld_r'left);
			if i = N_SPRITES-1 then
			  i := 0;
			else
			  i := i + 1;
			end if;
      row_a <= ctl_o(i).a;
		end if;
	end process;

  -- sprite row data fan-out
  GEN_ROW_D : for i in 0 to N_SPRITES-1 generate
    ctl_i(i).ld <= ld_r(i);
    ctl_i(i).d <= row_d;
  end generate GEN_ROW_D;
  
	-- Sprite Priority Encoder
	-- - determines which sprite pixel (if any) is to be displayed
	-- We can use a clocked process here because the tilemap
	-- output is 1 clock behind at this point
	process (clk, clk_ena)
		variable spr_on_v 	: std_logic := '0';
		variable spr_pri_v 	: std_logic := '0';
	begin
		if rising_edge(clk) and clk_ena = '1' then
			spr_on_v := '0';
			spr_pri_v := '0';
			for i in 0 to N_SPRITES-1 loop
				-- if highest priority = 0 and pixel on
				if spr_pri_v = '0' and ctl_o(i).set = '1' then
					-- if no sprite on or this priority = 1
					if spr_on_v = '0' or reg_o(i).pri = '1' then
						rgb <= ctl_o(i).rgb;
						spr_on_v := '1';					    -- flag as sprite on
						spr_pri_v := reg_o(i).pri;		-- store priority
					end if;
				end if;
			end loop;
		end if;
		set <= spr_on_v;
		pri <= spr_pri_v;
	end process;

	-- for NES, and perhaps others
	-- it's actually more complicated than this
	-- but it'll do for now...
	spr0_set <= ctl_o(0).set;
		
	--
	-- Component Instantiation
	--
	
	GEN_REGS : for i in 0 to N_SPRITES-1 generate
	
		sptReg_inst : entity work.sptReg
			generic map
			(
				INDEX			=> i
			)
			port map
			(
        reg_i           => reg_i,
				reg_o           => reg_o(i)
			);

		sptCtl_inst : entity work.spritectl
			generic map
			(
				INDEX			=> i,
				DELAY     => DELAY
			)
			port map
			(
        -- sprite registers
        reg_i       => reg_o(i),
        
        -- video control signals
        video_ctl   => video_ctl,

        -- sprite control signals
        ctl_i       => ctl_i(i),
        ctl_o       => ctl_o(i),

        graphics_i  => graphics_i
      );
				
	end generate GEN_REGS;
	
end SYN;

