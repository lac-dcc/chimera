library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.pace_pkg.all;
use work.video_controller_pkg.all;
use work.sprite_pkg.all;
use work.platform_pkg.all;

entity platform is
  generic
  (
    NUM_INPUT_BYTES   : integer
  );
  port
  (
    -- clocking and reset
    clkrst_i        : in from_CLKRST_t;

    -- misc I/O
    buttons_i       : in from_BUTTONS_t;
    switches_i      : in from_SWITCHES_t;
    leds_o          : out to_LEDS_t;

    -- controller inputs
    inputs_i        : in from_MAPPED_INPUTS_t(0 to NUM_INPUT_BYTES-1);
    -- graphics
		IN0			: in std_logic_vector(7 downto 0);
		IN1			: in std_logic_vector(7 downto 0);
		IN2			: in std_logic_vector(7 downto 0);
		DIP1			: in std_logic_vector(7 downto 0);
		DIP2			: in std_logic_vector(7 downto 0);    
    bitmap_i        : in from_BITMAP_CTL_a(1 to 3);
    bitmap_o        : out to_BITMAP_CTL_a(1 to 3);
    
    tilemap_i       : in from_TILEMAP_CTL_a(1 to 1);
    tilemap_o       : out to_TILEMAP_CTL_a(1 to 1);

    sprite_reg_o    : out to_SPRITE_REG_t;
    sprite_i        : in from_SPRITE_CTL_t;
    sprite_o        : out to_SPRITE_CTL_t;
	 spr0_hit		  : in std_logic;

    -- various graphics information
    graphics_i      : in from_GRAPHICS_t;
    graphics_o      : out to_GRAPHICS_t;

	 sound_data_o    : out std_logic_vector(7 downto 0)
  );

end platform;

architecture SYN of platform is

	alias clk_sys				  : std_logic is clkrst_i.clk(0);
	alias rst_sys				  : std_logic is clkrst_i.rst(0);
	alias clk_video           : std_logic is clkrst_i.clk(1);
	
  -- cpu signals  
  signal clk_3M072_en		  : std_logic;
  signal cpu_clk_en     	  : std_logic;
  signal cpu_a               : std_logic_vector(15 downto 0);
  signal cpu_d_i             : std_logic_vector(7 downto 0);
  signal cpu_d_o             : std_logic_vector(7 downto 0);
  signal cpu_mem_wr          : std_logic;
  signal cpu_io_wr           : std_logic;
  signal cpu_irq             : std_logic;

  -- ROM signals        
	signal rom_cs				  : std_logic;
  signal rom_d_o             : std_logic_vector(7 downto 0);
  
  -- keyboard signals
	                        
  -- VRAM signals       
	signal vram_cs				  : std_logic;
	signal vram_wr				  : std_logic;
  signal vram_d_o            : std_logic_vector(7 downto 0);
  
  signal snd_cs              : std_logic;
                        
  -- RAM signals        
  signal wram_cs             : std_logic;
  signal wram_wr             : std_logic;
  signal wram_d_o            : std_logic_vector(7 downto 0);

  -- CRAM/SPRITE signals        
  signal cram_cs             : std_logic;
  signal cram_wr             : std_logic;
	signal cram_d_o		     : std_logic_vector(7 downto 0);
	signal sprite_cs          : std_logic;
  
  -- misc signals      
	signal in_cs               : std_logic;
	signal in_d_o              : std_logic_vector(7 downto 0);
	signal prot_cs            : std_logic;
	signal prot_d_o            : std_logic_vector(7 downto 0);
  
  -- other signals
	signal rst_platform        : std_logic;
	signal pause               : std_logic;
	signal rot_en              : std_logic;
	signal vblank_int     : std_logic;
	
	    type rom_d_a is array(0 to 4) of std_logic_vector(7 downto 0);
    signal rom_d          : rom_d_a;
	 
	    type gfx_rom_d_a is array(0 to 1) of std_logic_vector(7 downto 0);
    signal chr_rom_d      : gfx_rom_d_a;
    signal spr_rom_left   : gfx_rom_d_a;
    signal spr_rom_right  : gfx_rom_d_a; 
	 
begin

  -- handle special keys
  process (clk_sys, rst_sys)
    variable spec_keys_r  : std_logic_vector(7 downto 0);
    alias spec_keys       : std_logic_vector(7 downto 0) is inputs_i(6-1).d;
    variable layer_en     : std_logic_vector(4 downto 0);
  begin
    if rst_sys = '1' then
      rst_platform <= '0';
      pause <= '0';
      rot_en <= '0';  -- to default later
      spec_keys_r := (others => '0');
      layer_en := "11111";
    elsif rising_edge(clk_sys) then
      rst_platform <= spec_keys(0);
      if spec_keys_r(1) = '0' and spec_keys(1) = '1' then
        pause <= not pause;
      end if;
      if spec_keys_r(2) = '0' and spec_keys(2) = '1' then
        rot_en <= not rot_en;
        if layer_en = "11111" then
          layer_en := "00001";
        elsif layer_en = "10000" then
          layer_en := "11111";
        else
          layer_en := layer_en(3 downto 0) & layer_en(4);
        end if;
      end if;
      spec_keys_r := spec_keys;
    end if;
    graphics_o.bit8(0)(4 downto 0) <= layer_en;
  end process;
  
  --graphics_o.bit8(0)(0) <= rot_en;
  
  -- chip select logic
  -- ROM $0000-$3FFF
  rom_cs <=     '1' when STD_MATCH(cpu_a, "00--------------") else '0';
  -- VRAM $8000-$83FF
  vram_cs <=    '1' when STD_MATCH(cpu_a, X"8"&"00----------") else '0';
  -- CRAM $8400-$87FF
  cram_cs <=    '1' when STD_MATCH(cpu_a, X"8"&"01----------") else '0';
  -- PROTECTION $8800-$8FFF
  prot_cs <=    '1' when STD_MATCH(cpu_a, X"8"&"1-----------") else '0';
  -- SPRITE $C800-$CBFF
  sprite_cs <=  '1' when STD_MATCH(cpu_a, X"C"&"10----------") else '0';
  -- INPUTS $D000-$D004 (-$D7FF)
  in_cs <=      '1' when STD_MATCH(cpu_a, X"D"&"0-----------") else '0';
  -- RAM $E000-$E7FF
  wram_cs <=    '1' when STD_MATCH(cpu_a, X"E"&"0-----------") else '0';

  -- OUTPUT $DXX0
  snd_cs <=      '1' when STD_MATCH(cpu_a, X"D"&"0---------00") else '0';
  
  process (clk_sys, rst_sys) begin
	if rst_sys = '1' then
		sound_data_o <= X"00";
	elsif rising_edge(clk_sys) then
      if cpu_clk_en = '1' and cpu_mem_wr = '1' and snd_cs = '1' then
			sound_data_o <= cpu_d_o;
		end if;
	end if; 
  end process;

	-- memory read mux
	cpu_d_i <=  rom_d_o when rom_cs = '1' else
							vram_d_o when vram_cs = '1' else
							cram_d_o when cram_cs = '1' else
              prot_d_o when prot_cs = '1' else
              in_d_o when in_cs = '1' else
							wram_d_o when wram_cs = '1' else
							(others => '1');

  BLK_BGCONTROL : block
  
    signal m52_scroll     : std_logic_vector(7 downto 0);
    signal m52_bg1xpos    : std_logic_vector(7 downto 0);
    signal m52_bg1ypos    : std_logic_vector(7 downto 0);
    signal m52_bg2xpos    : std_logic_vector(7 downto 0);
    signal m52_bg2ypos    : std_logic_vector(7 downto 0);
    signal m52_bgcontrol  : std_logic_vector(7 downto 0);

    signal prot_recalc    : std_logic;
    
  begin
    -- handle I/O (writes only)
    process (clk_sys, rst_sys)
    begin
      if rst_sys = '1' then
        m52_scroll <= (others => '0');
        m52_bg1xpos <= (others => '0');
        m52_bg1ypos <= (others => '0');
        m52_bg2xpos <= (others => '0');
        m52_bg2ypos <= (others => '0');
        m52_bgcontrol <= (others => '0');
        prot_recalc <= '0';
      elsif rising_edge(clk_sys) then
        prot_recalc <= '0'; -- default
        if cpu_clk_en = '1' and cpu_io_wr = '1' then
          case cpu_a(7 downto 5) is
            when "000" =>
              m52_scroll <= cpu_d_o;
            when "010" =>
              m52_bg1xpos <= cpu_d_o;
              prot_recalc <= '1';
            when "011" =>
              m52_bg1ypos <= cpu_d_o;
            when "100" =>
              m52_bg2xpos <= cpu_d_o;
            when "101" =>
              m52_bg2ypos <= cpu_d_o;
            when "110" =>
              m52_bgcontrol <= cpu_d_o;
            when others =>
              null;
          end case;
        end if;
      end if;
    end process;
    
    graphics_o.bit8(1) <= m52_scroll;
    graphics_o.bit16(0) <= m52_bg1xpos & m52_bg1ypos;
    graphics_o.bit16(1) <= m52_bg2xpos & m52_bg2ypos;
    graphics_o.bit16(2) <= X"00" & m52_bgcontrol;

      process (clk_sys, rst_sys)
        variable popcount : unsigned(2 downto 0);
      begin
        if rst_sys = '1' then
          prot_d_o <= (others => '0');
        elsif rising_edge(clk_sys) then
          if prot_recalc = '1' then
            popcount := (others => '0');
            for i in 6 downto 0 loop
              if m52_bg1xpos(i) /= '0' then
                popcount := popcount + 1;
              end if;
            end loop;
            popcount(0) := popcount(0) xor m52_bg1xpos(7);
          end if; -- prot_recalc='1'
        end if; -- rising_edge(clk_sys)
        prot_d_o <= "00000" & std_logic_vector(popcount);
      end process;
    
  end block BLK_BGCONTROL;
  
  -- memory block write signals 
	vram_wr <= vram_cs and cpu_mem_wr;
	cram_wr <= cram_cs and cpu_mem_wr;
	wram_wr <= wram_cs and cpu_mem_wr;

  -- sprite registers
  sprite_reg_o.clk <= clk_sys;
  sprite_reg_o.clk_ena <= clk_3M072_en;
  sprite_reg_o.a <= cpu_a(7 downto 0);
  sprite_reg_o.d <= cpu_d_o;
  sprite_reg_o.wr <=  sprite_cs and cpu_mem_wr;



  BLK_CPU : block
    signal cpu_rst        : std_logic;
  begin
    -- generate CPU enable clock (3MHz from 27/30MHz)
    clk_en_inst : entity work.clk_div
      generic map
      (
        DIVISOR		=> M52_CPU_CLK_ENA_DIVIDE_BY
      )
      port map
      (
        clk				=> clk_sys,
        reset			=> rst_sys,
        clk_en		=> clk_3M072_en
      );
    
    -- gated CPU signals
    cpu_clk_en <= clk_3M072_en and not pause;
    cpu_rst <= rst_sys or rst_platform;
    
    cpu_inst : entity work.Z80                                                
      port map
      (
        clk 		=> clk_sys,                                   
        clk_en	=> cpu_clk_en,
        reset  	=> cpu_rst,

        addr   	=> cpu_a,
        datai  	=> cpu_d_i,
        datao  	=> cpu_d_o,

        mem_rd 	=> open,
        mem_wr 	=> cpu_mem_wr,
        io_rd  	=> open,
        io_wr  	=> cpu_io_wr,

        intreq 	=> cpu_irq,
        intvec 	=> cpu_d_i,
        intack 	=> open,
        nmi    	=> '0'
      );
  end block BLK_CPU;

  
		process (clk_sys, rst_sys)
			variable vblank_r : std_logic_vector(3 downto 0);
			alias vblank_prev : std_logic is vblank_r(vblank_r'left);
			alias vblank_um   : std_logic is vblank_r(vblank_r'left-1);
      -- 1us duty for VBLANK_INT
      variable count    : integer range 0 to 49 * 100;
		begin
			if rst_sys = '1' then
				vblank_int <= '0';
				vblank_r := (others => '0');
        count := count'high;
			elsif rising_edge(clk_sys) then
        -- rising edge vblank only
        if vblank_prev = '0' and vblank_um = '1' then
          count := 0;
        end if;
        if count /= count'high then
          vblank_int <= '1';
          count := count + 1;
        else
          vblank_int <= '0';
        end if;
        vblank_r := vblank_r(vblank_r'left-1 downto 0) & graphics_i.vblank;
			end if; -- rising_edge(clk_sys)
		end process;

    -- generate INT
    cpu_irq <= vblank_int;
 
    in_d_o <= IN0 when cpu_a(2 downto 0) = "000" else
              IN1 when cpu_a(2 downto 0) = "001" else
              IN2 when cpu_a(2 downto 0) = "010" else
              DIP1 when cpu_a(2 downto 0) = "011" else
              DIP2 when cpu_a(2 downto 0) = "100" else
              X"FF";
  
    rom_d_o <=  rom_d(0) when cpu_a(13 downto 12) = "00" else
                rom_d(1) when cpu_a(13 downto 12) = "01" else
                rom_d(2) when cpu_a(13 downto 12) = "10" else
                rom_d(3);


rom1 : entity work.mpa_13m
port map(
	clk  	=> clk_sys,
	addr 	=> cpu_a(11 downto 0),
	data 	=> rom_d(0)
);

rom2 : entity work.mpa_23l
port map(
	clk  	=> clk_sys,
	addr 	=> cpu_a(11 downto 0),
	data 	=> rom_d(1)
);

rom3 : entity work.mpa_33k
port map(
	clk  	=> clk_sys,
	addr 	=> cpu_a(11 downto 0),
	data 	=> rom_d(2)
);

rom4 : entity work.mpa_43j
port map(
	clk  	=> clk_sys,
	addr 	=> cpu_a(11 downto 0),
	data 	=> rom_d(3)
);
--Char
rom5 : entity work.mpe_43f
port map(
	clk  => clk_video,
	addr => tilemap_i(1).tile_a(11 downto 0),
	data => chr_rom_d(1)
);

rom6 : entity work.mpe_53e
port map(
	clk  => clk_video,
	addr => tilemap_i(1).tile_a(11 downto 0),
	data => chr_rom_d(0)
);

tilemap_o(1).tile_d(15 downto 0) <= chr_rom_d(0) & chr_rom_d(1);

rom7 : entity work.mpb_23m
port map(
	clk  => clk_video,
	addr_a => sprite_i.a(11 downto 5) & '0' & sprite_i.a(3 downto 0),
	data_a => spr_rom_left(0),
	addr_b => sprite_i.a(11 downto 5) & '1' & sprite_i.a(3 downto 0),
	data_b => spr_rom_right(0)
);

rom8 : entity work.mpb_13n
port map(
	clk  => clk_video,
	addr_a => sprite_i.a(11 downto 5) & '0' & sprite_i.a(3 downto 0),
	data_a => spr_rom_left(1),
	addr_b => sprite_i.a(11 downto 5) & '1' & sprite_i.a(3 downto 0),
	data_b => spr_rom_right(1)
);

sprite_o.d(sprite_o.d'left downto 32) <= (others => '0');
sprite_o.d(31 downto 0) <=  spr_rom_left(0) & spr_rom_right(0) & spr_rom_left(1) & spr_rom_right(1);

rom9 : entity work.mpe_13l
port map(
	clk  => clk_video,
	addr => bitmap_i(3).a(11 downto 0),
	data => bitmap_o(3).d(7 downto 0)
);

rom10 : entity work.mpe_23k
port map(
	clk  => clk_video,
	addr => bitmap_i(2).a(11 downto 0),
	data => bitmap_o(2).d(7 downto 0)
);

rom11 : entity work.mpe_33h
port map(
	clk  => clk_video,
	addr => bitmap_i(1).a(11 downto 0),
	data => bitmap_o(1).d(7 downto 0)
);

vram_inst : entity work.dpram
    generic map
    (
      init_file		=> "",
      widthad_a		=> 10
    )
		port map
		(
			clock_b			=> clk_sys,
			address_b		=> cpu_a(9 downto 0),
			wren_b			=> vram_wr,
			data_b			=> cpu_d_o,
			q_b					=> vram_d_o,

			clock_a			=> clk_video,
			address_a		=> tilemap_i(1).map_a(9 downto 0),
			wren_a			=> '0',
			data_a			=> (others => 'X'),
			q_a					=> tilemap_o(1).map_d(7 downto 0)
		);
		
tilemap_o(1).map_d(15 downto 8) <= (others => '0');

cram_inst : entity work.dpram
    generic map
    (
      init_file		=> "",
      widthad_a		=> 10
    )
		port map
		(
			clock_b			=> clk_sys,
			address_b		=> cpu_a(9 downto 0),
			wren_b			=> cram_wr,
			data_b			=> cpu_d_o,
			q_b					=> cram_d_o,

			clock_a			=> clk_video,
			address_a		=> tilemap_i(1).attr_a(9 downto 0),
			wren_a			=> '0',
			data_a			=> (others => 'X'),
			q_a					=> tilemap_o(1).attr_d(7 downto 0)
		);
		
tilemap_o(1).attr_d(15 downto 8) <= (others => '0');
  
wram_inst : entity work.spram
      generic map
      (
      	widthad_a => 11
      )
      port map
      (
        clock				=> clk_sys,
        address			=> cpu_a(10 downto 0),
        data				=> cpu_d_o,
        wren				=> wram_wr,
        q						=> wram_d_o
      );


  sprite_o.ld <= '0';
  leds_o <= (others => '0');
  
end SYN;
