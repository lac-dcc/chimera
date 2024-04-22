----------------------------------------------------------------------------------
-- Engineer: github.com/YetAnotherElectronicsChannel
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity audiosystem is
port (
    clk  : in std_logic;
    
    i2s_mclk : out std_logic;
    i2s_bclk : out std_logic;
    i2s_lr   : out std_logic;
    i2s_din  : in std_logic;   
	
	pwm_p_l : out std_logic;
    pwm_n_l : out std_logic;
	
	limit : out std_logic;	
	gain : in unsigned(1 downto 0);
	ns_mux : in std_logic
	
    );
end audiosystem;

architecture Behavioral of audiosystem is


component PWM_Modulator is
port(
    pwmclk : in std_logic;
    
    mod_in : in signed (4 downto 0);
    mod_in_vld : in std_logic;
    
    pwm_p : out std_logic;
    pwm_n : out std_logic
);
end component; 

Component UpSampler is
port (
    clk  : in std_logic;
    
    upsample_in : in signed (31 downto 0);
    sample_valid_in  : in std_logic;
    
    upsample_out : out signed(31 downto 0);
    sample_valid_out : out std_logic
    );
end component;

component noiseshaper is
port (
    clk  : in std_logic;
    
    ns_in : in signed (31 downto 0);
    ns_valid_in  : in std_logic;
    
    ns_out : out signed(4 downto 0);
    ns_valid_out : out std_logic;
    
    busy : out std_logic;
	limit : out std_logic;
	
    a1 : integer;
    a2 : integer;
    a3 : integer;
    a4 : integer;
    b1 : integer;
    b2 : integer;
    b3 : integer;
    b4 : integer;
    g1 : integer;
    g2 : integer
    
    );
end component;

   
component i2s_rxtx is
    port (
    clk : in std_logic;
    
    i2s_bclk : in std_logic;
    i2s_lr : in std_logic;
    i2s_din : in std_logic;
    i2s_dout : out std_logic;
    
    out_l : out signed (23 downto 0);
    out_r : out signed (23 downto 0);
    
    in_l : in signed (23 downto 0);
    in_r : in signed (23 downto 0);
    
    sync  : out std_logic
    );
end component;
 
 


--signals
signal ns2pwm_l: signed(4 downto 0) := (others=>'0');

signal ups2ns_l: signed(31 downto 0) := (others=>'0');
signal ups2ns_vld_l, ns2pwm_vld_l : std_logic := '0';

--noiseshaper bypass mux signals
signal to_pwm : signed(4 downto 0) := (others=>'0');
signal to_pwm_vld : std_logic;

--i2s data control signals
signal sync : std_logic:= '0';

--24 bit i2s i/o signals
signal i2s_l_in :signed (23 downto 0):= (others=>'0');

--main 32 bit i/o signals
signal l_in : signed (31 downto 0):= (others=>'0');

--timers for i2s clk generation
signal mclk_state : std_logic := '1';
signal lr_counter : unsigned (7 downto 0):= (others=>'0');
signal bclk_counter : unsigned(1 downto 0):= (others=>'0');

signal limit_ns : std_logic := '0';
signal limit_timer : integer := 0;

begin


--i2s clock generation
--mclk = clk/2 = 12.5 MHz
--bclk = clk/4 = 6.25 MHz
--lr = clk/256 = 97.6 kHz
i2s_mclk <= mclk_state;
i2s_bclk <= bclk_counter(1);
i2s_lr <= lr_counter(7); 
process (clk)
begin
if (rising_edge(clk)) then

	mclk_state <= not mclk_state;
	lr_counter <= lr_counter+to_unsigned(1,8);
	bclk_counter <= bclk_counter+to_unsigned(1,2);            
    
	--if limit was detected by noise-shaper, turn on LED for approx 100ms
	if (limit_ns = '1') then
		limit_timer <= 8000;
	elsif (limit_timer > 0 and lr_counter = to_unsigned(0,8)) then
		limit_timer <= limit_timer -1;
		limit <= '1';
	elsif (limit_timer = 0) then
		limit <= '0';
	end if;
end if;

end process;

--apply gain depending on external settings
process (i2s_l_in, gain)
begin
	l_in <= shift_left(resize(i2s_l_in,32), to_integer(gain));
end process;


upsampler_l : UpSampler 
port  map (
    clk  => clk,
    
    upsample_in => l_in,
    sample_valid_in => sync,
    
    upsample_out => ups2ns_l,
    sample_valid_out => ups2ns_vld_l
    );
	
	


ns_l: noiseshaper
port map(
    clk => clk,
    ns_in => ups2ns_l,
    ns_valid_in => ups2ns_vld_l,
    ns_out => ns2pwm_l,
    ns_valid_out => ns2pwm_vld_l,
    busy => open,
	limit => limit_ns,
    a1 => -514,
    a2 => -4453,
    a3 => -16843,
    a4 => -11826,     
    b1 => 514,
    b2 => 4453,
    b3 => 16843,
    b4 => 11826,
    g1 => -1200,
    g2 => -300
    );
 

--mux to bypass noiseshaper
to_pwm <= ns2pwm_l when ns_mux = '1' else resize(ups2ns_l,24)(23 downto 19);
to_pwm_vld <= ns2pwm_vld_l when ns_mux = '1' else ups2ns_vld_l;

pwm_l:  PWM_Modulator 
port map(
    pwmclk => clk,
    
    mod_in => to_pwm,
    mod_in_vld => to_pwm_vld,
    
    pwm_p => pwm_p_l,
    pwm_n => pwm_n_l
);

rxtx : i2s_rxtx
    port map (
        clk => clk,
        
        
        i2s_bclk => bclk_counter(1),
		i2s_lr => lr_counter(7),
        i2s_din => i2s_din,
        i2s_dout => open,
        
        out_l => i2s_l_in,
        out_r => open,
        
        in_l => (others=>'0'),
        in_r => (others=>'0'),
        
        sync => sync
      );



end Behavioral;