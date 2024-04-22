LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;		 
USE ieee.std_logic_unsigned.all;

Library UNISIM;
use UNISIM.vcomponents.all;


entity image_selector is
port 
(	
	-- HMDI input 0
	rgb_H0		: in std_logic_vector(23 downto 0);
	de_H0		: in std_logic;
	pclk_H0		: in std_logic;
	hsync_H0	: in std_logic;
	vsync_H0	: in std_logic;
	resX_H0		: in std_logic_vector(15 downto 0);
	resY_H0		: in std_logic_vector(15 downto 0);
	
	-- HMDI input 1
	rgb_H1		: in std_logic_vector(23 downto 0);
	de_H1		: in std_logic;
	pclk_H1		: in std_logic;
	hsync_H1	: in std_logic;
	vsync_H1	: in std_logic;
	resX_H1		: in std_logic_vector(15 downto 0);
	resY_H1		: in std_logic_vector(15 downto 0);

	
	-- Test Pattern 
	rgb_tp		: in std_logic_vector(23 downto 0);
	de_tp		: in std_logic;
	pclk_tp		: in std_logic;
	hsync_tp	: in std_logic;
	vsync_tp	: in std_logic;	
	resX_tp		: in std_logic_vector(15 downto 0);
	resY_tp		: in std_logic_vector(15 downto 0);
	
	
	-- VGA input
	rgb_vga		: in std_logic_vector(23 downto 0);
	de_vga		: in std_logic;
	pclk_vga	: in std_logic;
	hsync_vga	: in std_logic;
	vsync_vga	: in std_logic;
	resX_vga	: in std_logic_vector(15 downto 0);
	resY_vga	: in std_logic_vector(15 downto 0);
	
	
	-- selector_cmd
	selector_cmd : in std_logic_vector(12 downto 0);

	--Heart Beat Signals
	HB_on	     : in std_logic;   -- Port control of heart beat
	HB_sw        : in std_logic;   -- Switch Control of heart beat

	-- selected output
	rgb		: out std_logic_vector(23 downto 0);
	de		: out std_logic;
	hsync	: out std_logic;
	vsync	: out std_logic;
	resX	: out std_logic_vector(15 downto 0);
	resY	: out std_logic_vector(15 downto 0);
	
	-- for HDMI Matrix input
	rgb_H		: out std_logic_vector(23 downto 0);
	de_H		: out std_logic;
	pclk_H	: out std_logic;
	
	
	clk   	: in  std_logic;
	rst   : in  std_logic
);
end entity image_selector;

architecture rtl of image_selector is

COMPONENT image_selector_fifo
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
    full : OUT STD_LOGIC;
    almost_full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    almost_empty : OUT STD_LOGIC;
    valid : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT heart_beater is
Generic(	HB_length      : integer :=5;		--length of the heart beat in pixels
	        HB_width       : integer :=5;		--width of the heart beat in pixels
		alt_aft_frame  : integer :=3		--alternate color after this many frames (max value 31)
		);
PORT
(
	clk    : in std_logic;
	rst    : in std_logic;
        HB_on  : in std_logic;
	HB_sw  : in std_logic;
	din    : in std_logic_vector(23 downto 0);
	vsync  : in std_logic;
	wr_en  : in std_logic;
	pclk_i : in std_logic;
	resX	 : in std_logic_vector(15 downto 0);
	resY	 : in std_logic_vector(15 downto 0);
	dout   : out std_logic_vector(23 downto 0)

);
END COMPONENT;

signal pclk_i : std_logic;
signal hdmi_clk : std_logic;
--signal vga_tp_clk : std_logic;
signal full : std_logic;
signal almost_full : std_logic;
signal empty : std_logic;
signal almost_empty : std_logic;
signal valid : std_logic;
signal de_q : std_logic;
signal de_qq : std_logic;
signal de_qqq : std_logic;
signal de_qqqq : std_logic;
signal de_qqqqq : std_logic;
signal de_i : std_logic;


signal rgb_q		: std_logic_vector(23 downto 0);
signal rgb_i		: std_logic_vector(23 downto 0);
signal din		: std_logic_vector(23 downto 0);
signal din_q		: std_logic_vector(23 downto 0);

signal Y		: std_logic_vector(17 downto 0);
signal Y1		: std_logic_vector(14 downto 0);
signal Y2		: std_logic_vector(16 downto 0);
signal Y3		: std_logic_vector(17 downto 0);

signal red_i		: std_logic_vector(7 downto 0);
signal green_i		: std_logic_vector(7 downto 0);
signal blue_i		: std_logic_vector(7 downto 0);

signal red_q		: std_logic_vector(7 downto 0);
signal green_q		: std_logic_vector(7 downto 0);
signal blue_q		: std_logic_vector(7 downto 0);

signal red_qq		: std_logic_vector(7 downto 0);
signal green_qq		: std_logic_vector(7 downto 0);
signal blue_qq		: std_logic_vector(7 downto 0);

signal red_qqq		: std_logic_vector(7 downto 0);
signal green_qqq		: std_logic_vector(7 downto 0);
signal blue_qqq		: std_logic_vector(7 downto 0);

signal selector : std_logic_vector(12 downto 0);

signal wr_en : std_logic;
signal de_H0_q : std_logic;
signal rgb_H0_q : std_logic_vector(23 downto 0);
signal hsync_H0_q : std_logic;
signal vsync_H0_q : std_logic;
signal resX_H0_q : std_logic_vector(15 downto 0);
signal resY_H0_q : std_logic_vector(15 downto 0);
signal rgb_H1_q : std_logic_vector(23 downto 0);
signal hsync_H1_q : std_logic;
signal de_H1_q : std_logic;
signal vsync_H1_q : std_logic;
signal resX_H1_q : std_logic_vector(15 downto 0);
signal resY_H1_q : std_logic_vector(15 downto 0);
signal rgb_tp_q : std_logic_vector(23 downto 0);
signal de_tp_q : std_logic;
signal hsync_tp_q : std_logic;
signal vsync_tp_q : std_logic;
signal resX_tp_q : std_logic_vector(15 downto 0);
signal resY_tp_q : std_logic_vector(15 downto 0);

signal resX_signal : std_logic_vector(15 downto 0);
signal resY_signal : std_logic_vector(15 downto 0);
signal vsync_s	   : std_logic;



begin



pclk_H		<= pclk_i;--clk input to HDMI Matrix

resX			<= resX_signal;
resY			<= resY_signal;

process(rst,pclk_H0)
begin
if rst = '1' then
elsif rising_edge(pclk_H0) then
	rgb_H0_q <=rgb_H0;
	de_H0_q <= de_H0;
	hsync_H0_q <= hsync_H0;
	vsync_H0_q <= vsync_H0;
	resX_H0_q <= resX_H0;
	resY_H0_q <= resY_H0;
end if;
end process;




process(rst,pclk_H1)
begin
	if rst = '1' then
	elsif rising_edge(pclk_H1) then
		rgb_H1_q <= rgb_H1;
		de_H1_q <= de_H1;
		hsync_H1_q <= hsync_H1;
		vsync_H1_q <= vsync_H1;
		resX_H1_q <= resX_H1;
		resY_H1_q <= resY_H1;
	end if;
end process;




process(rst,pclk_tp)
begin
if rst = '1' then
elsif rising_edge(pclk_tp) then
	rgb_tp_q <=	rgb_tp;
	de_tp_q <= 	de_tp;
	hsync_tp_q <= hsync_tp;
	vsync_tp_q <= vsync_tp;
	resX_tp_q <= resX_tp;
	resY_tp_q <= resY_tp;
end if;
end process;





process(rst,pclk_i)
begin
	if rst = '1' then
		valid 		<= '0';	
		rgb_i		<= (others => '0');
		hsync	<= '0';
		vsync	<= '0';
		resX_signal	<= (others => '0');
		resY_signal	<= (others => '0');
		selector 	<= (others => '0');
	elsif rising_edge(pclk_i) then

	selector <= selector_cmd;
	
		case selector(1 downto 0) is
			when "00" => -- hdmi 0 		
				rgb_i		<= rgb_H0_q;
				de_i		<= de_H0_q;
				hsync	<= hsync_H0_q;
				vsync	<= vsync_H0_q;
				resX_signal	<= resX_H0_q;
				resY_signal 	<= resY_H0_q;
				vsync_s <= vsync_H0_q;
			when "01" => -- hdmi 1
				rgb_i		<= rgb_H1_q;
				de_i		<= de_H1_q;
				hsync	<= hsync_H1_q;
				vsync	<= vsync_H1_q;
				resX_signal	<= resX_H1_q;
				resY_signal	<= resY_H1_q;
				vsync_s <= vsync_H1_q;
			-- when "10" => -- VGA
				-- rgb_i		<= rgb_vga_q;
				-- valid		<= de_vga_q;
				-- hsync	<= hsync_vga_q;
				-- vsync	<= vsync_vga_q;
				-- resX_signal	<= resX_vga_q;
				-- resY_signal	<= resY_vga_q;
			when "11" => -- Test Pattern
				rgb_i		<= rgb_tp_q;
				de_i		<= de_tp_q;
				hsync	<= hsync_tp_q;
				vsync	<= vsync_tp_q;
				resX_signal	<= resX_tp_q;
				resY_signal	<= resY_tp_q;
				vsync_s <= vsync_tp_q;
			when others =>
		end case;
	end if;
end process;



BUFGMUX_HDMI : BUFGMUX
generic map (
  CLK_SEL_TYPE => "SYNC"  -- Glitchles ("SYNC") or fast ("ASYNC") clock switch-over
)
port map (
  O => hdmi_clk,   -- 1-bit output: Clock buffer output
  I0 => pclk_H0, -- 1-bit input: Clock buffer input (S=0)
  I1 => pclk_H1, -- 1-bit input: Clock buffer input (S=1)
  S => selector_cmd(0)    -- 1-bit input: Clock buffer select
);

-- BUFGMUX_VGATP : BUFGMUX
-- generic map (
  -- CLK_SEL_TYPE => "SYNC"  -- Glitchles ("SYNC") or fast ("ASYNC") clock switch-over
-- )
-- port map (
  -- O => vga_tp_clk,   -- 1-bit output: Clock buffer output
  -- I0 => pclk_vga, -- 1-bit input: Clock buffer input (S=0)
  -- I1 => pclk_tp, -- 1-bit input: Clock buffer input (S=1)
  -- S => selector_q(0)    -- 1-bit input: Clock buffer select
-- );

BUFGMUX_PCLK : BUFGMUX
generic map (
  CLK_SEL_TYPE => "SYNC"  -- Glitchles ("SYNC") or fast ("ASYNC") clock switch-over
)
port map (
  O => pclk_i,   -- 1-bit output: Clock buffer output
  I0 => hdmi_clk, -- 1-bit input: Clock buffer input (S=0)
  I1 => pclk_tp, -- 1-bit input: Clock buffer input (S=1)
  S => selector_cmd(1)    -- 1-bit input: Clock buffer select
);


Y <= Y1 + Y2 + Y3;
rgb_H		<= din_q;
de_H		<= wr_en;

imgprocess: process(rst,pclk_i)
begin
if rst = '1' then

	rgb_q <= (others => '0');
	
elsif rising_edge(pclk_i) then

Y1 <= conv_std_logic_vector(113,7)*blue_qqq;
Y2 <= conv_std_logic_vector(307,9)*red_qqq;
Y3 <= conv_std_logic_vector(604,10)*green_qqq;


rgb_q <= (blue_i & green_i & red_i);

din <= rgb_q;
wr_en <= de_qqqqq;

		de_q 	<= de_i;	
		de_qq 	<= de_q;
		de_qqq 	<= de_qq;		
		de_qqqq	<= de_qqq;		
		de_qqqqq<= de_qqqq;		
		

		if selector(10) = '1' then blue_q 	<= rgb_i(23 downto 16); else blue_q 	<= (others => '0'); end if;
		if selector(11) = '1' then green_q 	<= rgb_i(15 downto 8); else green_q 	<= (others => '0'); end if;
		if selector(12) = '1' then red_q 	<= rgb_i(7 downto 0); else red_q 	<= (others => '0'); end if;

		case selector(5 downto 4)  is -- blue
			when "00" => blue_qq <= blue_q;
			when "01" => blue_qq <= (blue_q(7 downto 3) & "000");
			when "10" => blue_qq <= (blue_q(7 downto 4) & "0000");
			when "11" => blue_qq <= (blue_q(7 downto 5) & "00000");
			when others =>
		end case;
		
		case selector(7 downto 6) is -- green
			when "00" => green_qq <= green_q;
			when "01" => green_qq <= (green_q(7 downto 3) & "000");
			when "10" => green_qq <= (green_q(7 downto 4) & "0000");
			when "11" => green_qq <= (green_q(7 downto 5) & "00000");	
			when others =>			
		end case;
		
		case selector(9 downto 8) is -- red
			when "00" => red_qq <= red_q;
			when "01" => red_qq <= (red_q(7 downto 3) & "000");
			when "10" => red_qq <= (red_q(7 downto 4) & "0000");
			when "11" => red_qq <= (red_q(7 downto 5) & "00000");
			when others =>			
		end case;

		if selector(3) = '1' then
			blue_qqq 	<= ("11111111" - blue_qq);
			green_qqq 	<= ("11111111" - green_qq);
			red_qqq 	<= ("11111111" - red_qq);
		else
			blue_qqq 	<= blue_qq;
			green_qqq 	<= green_qq;
			red_qqq 	<= red_qq;				
		end if;


		if selector(2) = '1' then
			blue_i 	<= blue_qqq;
			green_i 	<= green_qqq;
			red_i 	<= red_qqq;	
		else 			
			blue_i 	<= Y(17 downto 10);
			green_i 	<= Y(17 downto 10);
			red_i 	<= Y(17 downto 10);	
		end if;
		
end if;-- clk 
end process; -- imgprocess  

selector_fifo : image_selector_fifo
  PORT MAP (
    rst => rst,
    wr_clk => pclk_i,
    rd_clk => clk,
    din => din_q,
    wr_en => wr_en,
    rd_en => '1',
    dout => rgb,
    full => full,
    almost_full => almost_full,
    empty => empty,
    almost_empty => almost_empty,
    valid => de
  );
Inst_heart_beater: heart_beater
GENERIC MAP (
         HB_length => 5,-- length of heart beat in pixel
         HB_width  => 5,-- width of heart beat in pixel
	alt_aft_frame=>30 --the color alternates after this many frames
      )
PORT MAP(
		clk => clk,
		rst =>rst ,
		HB_on => HB_on,
		HB_sw => HB_sw,
		din => din,
		wr_en => wr_en,
		vsync => vsync_s,
		pclk_i => pclk_i,
		resX => resX_signal,
		resY => resY_signal,
		dout => din_q
	);
end architecture;
