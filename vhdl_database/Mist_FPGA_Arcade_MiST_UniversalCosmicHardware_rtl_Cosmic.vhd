--
-- A simulation of Universal Cosmic games
--
-- Mike Coates
--
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

entity cosmic is
port
(
	O_VIDEO_R  : out std_logic_vector(3 downto 0);
	O_VIDEO_G  : out std_logic_vector(3 downto 0);
	O_VIDEO_B  : out std_logic_vector(3 downto 0);
	O_HSYNC    : out std_logic;
	O_VSYNC    : out std_logic;
	O_HBLANK   : out std_logic;
	O_VBLANK   : out std_logic;
	O_VCOUNT   : out std_logic_vector(8 downto 0);
	I_H_OFFSET : in  std_logic_vector(3 downto 0);
	I_V_OFFSET : in  std_logic_vector(3 downto 0);
	I_FLIP     : in  std_logic;
	--
	O_SoundPort : out std_logic_vector(15 downto 0);
	O_SoundStop : out std_logic_vector(15 downto 0);
	O_Sound_EN : out std_logic;
	O_AUDIO    : out std_logic;
	O_NML_Speed : out std_logic_vector(1 downto 0);	
	--
	dipsw1     : in  std_logic_vector(7 downto 0);
	dipsw2     : in  std_logic_vector(7 downto 0);
	in0        : in  std_logic_vector(7 downto 0);
	in1        : in  std_logic_vector(7 downto 0);
	in2        : in  std_logic_vector(7 downto 0);
	coin       : in  std_logic;
	--
	dn_addr    : in  std_logic_vector(15 downto 0);
	dn_data    : in  std_logic_vector(7 downto 0);
	dn_wr      : in  std_logic;
	dn_ld	     : in  std_logic;
	--
	RESET      : in  std_logic;
	PIX_CLK    : in  std_logic;
	CPU_ENA    : in  std_logic;
	CLK        : in  std_logic;
	GAME       : in  std_logic_vector(7 downto 0);
	PAUSED     : in  std_logic;

-- HISCORE
	hs_address  : in  std_logic_vector(15 downto 0);
	hs_data_out : out std_logic_vector(7 downto 0);
	hs_data_in  : in  std_logic_vector(7 downto 0);
	hs_write    : in  std_logic;
	hs_access   : in  std_logic
);
end;

architecture RTL of cosmic is
	-- timing
	signal hcnt             : std_logic_vector(8 downto 0) := "000000000";
	signal vcnt             : std_logic_vector(8 downto 0) := "000000000";
	signal hsync            : std_logic;
	signal vsync            : std_logic;
	signal hblank           : std_logic;
	signal vblank           : std_logic := '1';
   signal do_hsync         : boolean;
   signal set_vblank       : boolean;
	
	signal hsync_start		: std_logic_vector(8 downto 0);
	signal hsync_end			: std_logic_vector(8 downto 0);
	signal vsync_start		: std_logic_vector(8 downto 0);
	signal vsync_end			: std_logic_vector(8 downto 0);
	
	-- cpu
	signal cpu_m1_l         : std_logic;
	signal cpu_mreq_l       : std_logic;
	signal cpu_iorq_l       : std_logic;
	signal cpu_rd_l         : std_logic;
	signal cpu_wr_l         : std_logic;
	signal cpu_rfsh_l       : std_logic;
	signal cpu_int_l        : std_logic := '1';
	signal cpu_nmi_l        : std_logic := '1';
	signal cpu_addr         : std_logic_vector(15 downto 0);
	signal cpu_data_out     : std_logic_vector(7 downto 0);
	signal cpu_data_in      : std_logic_vector(7 downto 0) := "00000000";

	-- Memory mapping
	signal rom_ld           : std_logic := '0';
	signal rom_rd           : std_logic := '0';
	signal ram_rd           : std_logic := '0';
	signal vid_rd           : std_logic := '0';
	signal col_rd           : std_logic := '0';	
	signal vector_rd			: std_logic := '0';	
	
	signal ram_wr           : std_logic := '0';
	signal vid_wr           : std_logic := '0';
	signal mmr_rd           : std_logic := '0';
	signal mmr_wr           : std_logic := '0';
	signal spr_wr           : std_logic := '0';
	signal snd_wr           : std_logic := '0';
	
	signal rom_data         : std_logic_vector(7 downto 0);
	signal vid_data         : std_logic_vector(7 downto 0);
	signal int_vector   	   : std_logic_vector(7 downto 0);
	signal reg_data   	   : std_logic_vector(7 downto 0);
	
	signal bus_ad           : std_logic_vector(15 downto 0);
	
	signal Global_Reset     : std_logic;
	signal irq_cnt          : std_logic_vector(3 downto 0);
	signal lastcoin   		: std_logic;

	-- watchdog
	signal watchdog_cnt     : std_logic_vector(8 downto 0);
	signal watchdog_clear   : std_logic;
	signal watchdog_reset_l : std_logic;
	
	-- Video
	signal vid_addr         : std_logic_vector(12 downto 0);
	signal v_bitmap_data    : std_logic_vector(7 downto 0);
	signal v_colour_page	   : std_logic_vector(2 downto 0) := "000";
	signal v_background     : std_logic := '0';
	signal Sprite_Collision : std_logic_vector(11 downto 0);
	signal ClearCollision   : std_logic := '0';
	signal Sprite_H			: std_logic_vector(7 downto 0) := x"00";
	signal Sprite_V			: std_logic_vector(7 downto 0) := x"00";
	signal Sprite_C	      : std_logic_vector(3 downto 0);
	signal Sprite_I	      : std_logic_vector(3 downto 0);
	signal Screen_Flip      : std_logic := '0';

	-- Sound
	signal Sound_EN		   : std_logic := '0';
	signal Bomb_Select	   : std_logic_vector(2 downto 0);
	signal BGM              : std_logic_vector(1 downto 0) := "00";
	
	-- Hiscore system
	signal vid_a_addr			: std_logic_vector(12 downto 0);
	signal vid_a_q				: std_logic_vector(7 downto 0);
	signal vid_a_data			: std_logic_vector(7 downto 0);
	signal vid_a_wren			: std_logic;
	signal vid_a_en			: std_logic;

begin

  O_HBLANK <= hblank;
  O_VBLANK <= vblank;
  O_VCOUNT <= vcnt;
  
  --Global_Reset <= watchdog_reset_l and (not reset);
  Global_Reset <= (not reset);
  
  --
  -- video timing
  --
  
  sync_stop : process(RESET,I_H_OFFSET,I_V_OFFSET)
  begin
		-- work out locations for sync pulses
		hsync_start <= std_logic_vector(to_unsigned(200 + to_integer(signed(I_H_OFFSET)),9));
		hsync_end   <= std_logic_vector(to_unsigned(214 + to_integer(signed(I_H_OFFSET)),9));
		vsync_start <= std_logic_vector(to_unsigned(252 + to_integer(signed(I_V_OFFSET)),9));
		vsync_end   <= std_logic_vector(to_unsigned(255 + to_integer(signed(I_V_OFFSET)),9));
  end process;
  
  p_hvcnt : process
    variable hcarry,vcarry : boolean;
  begin
    wait until rising_edge(CLK);
    if (PIX_CLK = '1') then
      hcarry := (hcnt = "111111111");
      if hcarry then
        --hcnt <= "011000000"; -- 0C0
		  hcnt <= "010101011"; -- 0AB
      else
        hcnt <= hcnt +"1";
      end if;
      
      vcarry := (vcnt = "111111111");
      if do_hsync then
        if vcarry then
          vcnt <= "011111000"; -- 0F8
        else
          vcnt <= vcnt +"1";
        end if;
      end if;		
    end if;
  end process;

  p_sync_comb : process(hcnt, vcnt, hsync_start)
  begin
    do_hsync <= (hcnt = hsync_start);
    set_vblank <= (vcnt = "111100000"); -- 1E0
  end process;

  p_sync : process
  begin
    wait until rising_edge(CLK);
    -- Timing hardware is coded differently to the real hw
    if (PIX_CLK = '1') then
      if (hcnt = "010101100") then 
        hblank <= '1';
      elsif (hcnt = "011111111") then
        hblank <= '0';
      end if;

      if do_hsync then
        hsync <= '1';
      elsif (hcnt = hsync_end) then 
        hsync <= '0';
      end if;

      if do_hsync then
        if set_vblank then -- 1EF
          vblank <= '1';
        elsif (vcnt = "100011111") then
          vblank <= '0';
        end if;
		  
		  if (vcnt = vsync_start) then
			  vsync <= '0';
		  elsif (vcnt = vsync_end) then
			  vsync <= '1';
		  end if;	
      end if;
    end if;
  end process;

  p_video_timing_reg : process
  begin
    wait until rising_edge(CLK);
    -- match output delay in video module
    if (PIX_CLK = '1') then
      O_HSYNC     <= hsync;
      O_VSYNC     <= vsync;
    end if;
  end process;

  p_cpu_int : process
  begin
   wait until rising_edge(CLK);
	
	if reset='1' then
	    cpu_int_l <= '1';
	else
		-- Space Panic Has 2 interrupts
		if (GAME = 1) then
			if (vector_rd = '1') then
			  cpu_int_l <= '1';
			else
			  if do_hsync and set_vblank then
				 cpu_int_l <= '0';
				 int_vector <= x"D7"; -- RST 10h
			  elsif (hcnt = "011111111") and set_vblank then
				 cpu_int_l <= '0';
				 int_vector <= x"CF"; -- RST 08h
			  end if;
			end if;
		else
			-- Other games use NMI for coin
			lastcoin <= coin;
			if (lastcoin = '0' and coin = '1') then
				-- pulse for 16 cycles (done via NE556 timer)
				irq_cnt   <= "1111";
				cpu_nmi_l <= '0';
			else
				if cpu_nmi_l = '0' then
					if irq_cnt = "0000" then
						cpu_nmi_l <= '1';
					else
						irq_cnt <= irq_cnt - 1;
					end if ;
				end if ;
			end if;
		end if;		
	end if;		
	
 end process;

--
-- cpu
--
	cpu : entity work.T80s
	port map (
		RESET_n       => Global_Reset,
		CLK           => CLK,
		CEN           => CPU_ENA,
		WAIT_n        => not PAUSED,
		INT_n         => cpu_int_l,
		NMI_n         => cpu_nmi_l,
		BUSRQ_n       => '1',
		MREQ_n        => cpu_mreq_l,
		RD_n          => cpu_rd_l,
		WR_n          => cpu_wr_l,
		RFSH_n        => cpu_rfsh_l,
		A             => cpu_addr,
		DI            => cpu_data_in,
		DO            => cpu_data_out,
		M1_n          => cpu_m1_l,
		IORQ_n        => cpu_iorq_l,
		HALT_n        => open,
		BUSAK_n       => open
	);

--
-- Space Panic mappings	
--
--	map(0x0000, 0x3fff).rom();
--	map(0x4000, 0x5fff).ram().share("videoram");
--	map(0x6000, 0x601f).writeonly().share("spriteram");
--	map(0x6800, 0x6800).portr("P1");
--	map(0x6801, 0x6801).portr("P2");
--	map(0x6802, 0x6802).portr("DSW");
--	map(0x6803, 0x6803).portr("SYSTEM");
--	map(0x7000, 0x700b).w(FUNC(cosmic_state::panic_sound_output_w));
--	map(0x700c, 0x700e).w(FUNC(cosmic_state::cosmic_color_register_w));
--	map(0x700f, 0x700f).w(FUNC(cosmic_state::flip_screen_w));
--	map(0x7800, 0x7801).w(FUNC(cosmic_state::panic_sound_output2_w));

-- Magical Spot mappings 
--	map(0x0000, 0x2fff).rom();
--	map(0x3800, 0x3807).r(FUNC(cosmic_state::magspot_coinage_dip_r));
--	map(0x4000, 0x401f).writeonly().share("spriteram");
--	map(0x4800, 0x4800).w(FUNC(cosmic_state::dac_w));
--	map(0x480c, 0x480d).w(FUNC(cosmic_state::cosmic_color_register_w));
--	map(0x480f, 0x480f).w(FUNC(cosmic_state::flip_screen_w));
--	map(0x5000, 0x5000).portr("IN0");
--	map(0x5001, 0x5001).portr("IN1");
--	map(0x5002, 0x5002).portr("IN2");
--	map(0x5003, 0x5003).portr("IN3");
--	map(0x6000, 0x7fff).ram().share("videoram");

-- Cosmic Alien
--	map(0x0000, 0x3fff).rom();
--	map(0x4000, 0x5fff).ram().share("videoram");
--	map(0x6000, 0x601f).writeonly().share("spriteram");
--	map(0x6800, 0x6800).portr("P1");
--	map(0x6801, 0x6801).portr("P2");
--	map(0x6802, 0x6802).portr("DSW");
--	map(0x6803, 0x6803).r(FUNC(cosmic_state::cosmica_pixel_clock_r));
--	map(0x7000, 0x700b).w(FUNC(cosmic_state::cosmica_sound_output_w));
--	map(0x700c, 0x700d).w(FUNC(cosmic_state::cosmic_color_register_w));
--	map(0x700f, 0x700f).w(FUNC(cosmic_state::flip_screen_w));	

rom_ld <= '1' when dn_addr(15 downto 14)  = "00" and dn_ld='1' else '0';
bus_ad <= dn_addr(15 downto 0) when dn_ld='1' else cpu_addr;

p_mem_decode : process(cpu_addr,cpu_iorq_l,cpu_rd_l,cpu_wr_l,cpu_mreq_l,cpu_m1_l,cpu_rfsh_l,GAME)
variable address : natural range 0 to 2**15 - 1;
begin
	rom_rd <= '0';
	vid_rd <= '0';
	mmr_rd <= '0';

	vid_wr <= '0';
	mmr_wr <= '0';
	spr_wr <= '0';
	snd_wr <= '0';

	vector_rd <= not cpu_iorq_l and not cpu_m1_l;
	address := to_integer(unsigned(cpu_addr));
	
	-- Ram/Rom read or write
	if cpu_mreq_l='0' and cpu_rfsh_l = '1' then
		if cpu_rd_l='0' then
			case GAME is 
				when x"01" | x"03" => -- Space Panic, Cosmic Alien
					case address is
						when 16#0000# to 16#3FFF# => rom_rd <= '1';
						when 16#4000# to 16#5FFF# => vid_rd <= '1';
						when 16#6800# to 16#6803# => mmr_rd <= '1';
						when others => null;
					end case;
				when x"02" | x"04"| x"05" => -- Magical Spot, Devil Zone, No Mans Land
					case address is
						when 16#0000# to 16#2FFF# => rom_rd <= '1';
						when 16#3800# to 16#3807# => mmr_rd <= '1';
						when 16#6000# to 16#7FFF# => vid_rd <= '1';
						when 16#5000# to 16#5003# => mmr_rd <= '1';
						when others => null;
					end case;
				when others => null;
			end case;
		elsif cpu_wr_l='0' then
			case GAME is 
				when x"01" | x"03" => -- Space Panic, Cosmic Alien
					case address is
						when 16#4000# to 16#5FFF# => vid_wr <= '1';
						when 16#6000# to 16#601F# => spr_wr <= '1';
						when 16#7000# to 16#700B# => snd_wr <= '1';
						when 16#700C# to 16#700F# => mmr_wr <= '1';
						when 16#7800# to 16#7801# => snd_wr <= '1';
						when others => null;
					end case;
				when x"02" | x"04"| x"05" => -- Magical Spot, Devil Zone, No Mans Land
					case address is
						when 16#6000# to 16#7FFF# => vid_wr <= '1';
						when 16#4000# to 16#401F# => spr_wr <= '1';
						when 16#4800# to 16#4806# => snd_wr <= '1';
						when 16#4807#             => mmr_wr <= '1';
						when 16#4808# to 16#480B# => snd_wr <= '1';
						when 16#480C# to 16#480F# => mmr_wr <= '1';
						when others => null;
					end case;
					
				when others => null;
			end case;
		end if;
	end if;

end process;

 -- Mux back to CPU
 p_cpu_src_data_mux : process(rom_data,vid_data,int_vector,reg_data,rom_rd,vid_rd,vector_rd,mmr_rd)
 begin
	 if rom_rd = '1' then
		cpu_data_in <= rom_data;
	 elsif vid_rd = '1' then
		cpu_data_in <= vid_data;
    elsif vector_rd = '1' then
	   cpu_data_in <= int_vector;
	 elsif mmr_rd = '1' then
	   cpu_data_in <= reg_data;
	 else 
	   cpu_data_in <= x"FF";
 	 end if;
 end process;
					
 -- rom : 0000-3FFF
 program_rom : entity work.spram
	generic map (
	  addr_width => 14
	)
	port map (
	  q        => rom_data,
	  data     => dn_data(7 downto 0),
	  address  => bus_ad(13 downto 0),
	  wren     => dn_wr and rom_ld,
	  clock    => clk
   );


 -- hiscore mux into video ram port
vid_a_addr <= hs_address(12 downto 0) when hs_access = '1' else cpu_addr(12 downto 0);
vid_a_data <= hs_data_in when hs_access = '1' else cpu_data_out;
hs_data_out <= vid_a_q when hs_access = '1' else "00000000";
vid_data <= vid_a_q when hs_access = '0' else "00000000";
vid_a_en <= '1' when hs_access = '1' else (vid_wr or vid_rd);
vid_a_wren <= hs_write when hs_access = '1' else vid_wr;

 -- program and video ram
 video_ram : entity work.dpram
	 generic map (
	  addr_width => 13
	 )
	 port map (
	  q_a        => vid_a_q,
	  data_a     => vid_a_data,
	  address_a  => vid_a_addr,
	  wren_a     => vid_a_wren,
	  enable_a   => vid_a_en,
	  clock      => clk,
	  
	  address_b  => vid_addr(12 downto 0),
	  q_b        => v_bitmap_data
	 );


-- Memory mapped registers
--
MMR_Write : process (CLK)
variable address : natural range 0 to 2**15 - 1;
begin
	if rising_edge(CLK) then

		-- If game resets then software flip can be left incorrectly set
		if reset='1' then
			Screen_Flip <= '0';
		end if;

		if (CPU_ENA='1' and mmr_wr='1') then
		
			address := to_integer(unsigned(cpu_addr));

			case address is
				when 16#4807# =>
					v_background <= cpu_data_out(7);
				when 16#700C# to 16#700E# | 16#480C# to 16#480D# => 
					v_colour_page(to_integer(unsigned(cpu_addr(1 downto 0)))) <= cpu_data_out(7);
				when 16#700F# | 16#480F# => Screen_Flip <= cpu_data_out(7);
				when others => null;
			end case;
		end if;
	end if;
end process;

MMR_read : process (cpu_addr, in0, in1, dipsw1, dipsw2, in2)
variable address : natural range 0 to 2**15 - 1;
begin
	reg_data <= x"FF";
	address := to_integer(unsigned(cpu_addr));

	case address is
		-- Space Panic, Cosmic Alien
		when 16#6800# | 16#5000# => reg_data <= in0;
		when 16#6801# | 16#5001# => reg_data <= in1;
		when 16#6802# | 16#5002# => reg_data <= dipsw1;
		when 16#6803# | 16#5003# => reg_data <= in2;
		-- Magical Spot only
		when 16#3800#            => reg_data <= "0000000" & dipsw2(3);
		when 16#3801#            => reg_data <= "0000000" & dipsw2(2);
		when 16#3802#            => reg_data <= "0000000" & dipsw2(1);
		when 16#3803#            => reg_data <= "0000000" & dipsw2(0);
		when others => null;
	end case;
			
end process;

-- Sound is memory mapped, but handled seperately
--
Sound_Write : process (CLK)
variable address : natural range 0 to 2**15 - 1;
variable SoundBit : std_logic;
begin
	if rising_edge(CLK) then
		if CPU_ENA='1' then
			if reset='1' then
				O_SoundPort <= "0000000000000000";
				O_AUDIO     <= '0';
				O_SoundStop <= "1111111111111111";
				Sound_EN    <= '0';
				Bomb_Select <= "000";
			else
				O_SoundStop <= "0000000000000000";

				-- Coin sample triggered by coin mech (Space Panic & Magic Spot)
				if GAME /= 3 then
					O_SoundPort(0) <= coin;
				end if;
				
				if snd_wr='1' then

					address := to_integer(unsigned(cpu_addr));
					SoundBit := cpu_data_out(7) and Sound_EN; -- used for all except sound enable

					if (GAME = 1) then
						-- Space Panic sound registers
						case address is
							when 16#7000# => O_SoundPort(10) <= SoundBit;
							when 16#7001# => O_SoundPort(2) <= SoundBit;
							when 16#7002# => O_SoundPort(6) <= SoundBit;
							when 16#7003# => O_SoundPort(7) <= SoundBit;
							when 16#7005# => O_SoundPort(2) <= SoundBit;
							when 16#7006# => O_SoundPort(8) <= SoundBit;
							when 16#7007# => O_SoundPort(4) <= SoundBit;
							when 16#7008# => O_SoundPort(9) <= SoundBit;
							when 16#7009# => O_SoundPort(5) <= SoundBit;
							when 16#700A# => O_AUDIO <= SoundBit; -- 1 bit DAC
							when 16#700B# => Sound_EN <= cpu_data_out(7);
												  if (cpu_data_out(7)='0') then
														-- Stop all sounds as well
														O_SoundPort <= "0000000000000000";
														O_AUDIO     <= '0';
														O_SoundStop <= "1111111111111110";
												  end if;
							when 16#7800# => O_SoundPort(1) <= SoundBit;
							when 16#7801# => O_SoundPort(3) <= SoundBit;
							when others => null;
						end case;
					elsif (GAME = 2) then
						-- Magic Spot sound registers
						case address is
							when 16#4800# => O_AUDIO <= cpu_data_out(7); -- 1 bit DAC
							when 16#4801# => O_SoundPort(1) <= SoundBit;
							when 16#4802# => O_SoundPort(3) <= SoundBit;
							when 16#4803# => O_SoundPort(6) <= SoundBit;
							when 16#4804# => O_SoundPort(2) <= SoundBit;
							when 16#4805# => O_SoundPort(5) <= SoundBit;
							when 16#4806# => O_SoundPort(7) <= SoundBit;
							--when 16#4808# => O_SoundPort(8) <= SoundBit; -- Ultramoth?
							when 16#4809# => O_SoundPort(8) <= SoundBit; -- Ultramoth?
							when 16#480A# => O_SoundPort(4) <= SoundBit;
							when 16#480B# => Sound_EN <= cpu_data_out(7);
												  if (cpu_data_out(7)='0' and Sound_EN='1') then
														-- Stop all sounds as well if turning off
														O_SoundPort <= "0000000000000000";
														O_AUDIO     <= '0';
														O_SoundStop <= "1111111111111110";
												  end if;
							-- sort rest
							when others => null;
						end case;
					elsif (GAME = 3) then
						-- Cosmic Alien
						case address is
							when 16#7000# => O_SoundPort(2) <= SoundBit;
							when 16#7002# => 
								case Bomb_Select is
									when "010" => O_SoundStop(3) <= SoundBit;
													  O_SoundPort(3) <= SoundBit;
									when "011" => O_SoundStop(4) <= SoundBit;
													  O_SoundPort(4) <= SoundBit;
									when "100" => O_SoundStop(5) <= SoundBit;
													  O_SoundPort(5) <= SoundBit;
									when "101" => O_SoundStop(6) <= SoundBit;
													  O_SoundPort(6) <= SoundBit;
									when "110" => O_SoundStop(7) <= SoundBit;
													  O_SoundPort(7) <= SoundBit;
									when "111" => O_SoundStop(8) <= SoundBit;
													  O_SoundPort(8) <= SoundBit;
									when others => null;
								end case;
							when 16#7003# => Bomb_Select(2) <= cpu_data_out(7);
							when 16#7004# => Bomb_Select(1) <= cpu_data_out(7);
							when 16#7005# => Bomb_Select(0) <= cpu_data_out(7);
							when 16#7006# => O_SoundPort(10) <= SoundBit;
							when 16#7007# => O_SoundPort(11) <= SoundBit; -- swopped, was 12,11
							when 16#7008# => O_SoundPort(12) <= SoundBit;
							when 16#7009# => O_SoundPort(9) <= SoundBit;
							when 16#700B# => Sound_EN <= cpu_data_out(7);
												  if (cpu_data_out(7)='1') then
														-- Start background noise
														O_SoundPort(1) <= '1';
												  elsif Sound_EN='1' then
														-- Stop all sounds as well if turning off
														O_SoundPort <= "0000000000000000";
														O_AUDIO     <= '0';
														O_SoundStop <= "1111111111111110";
												  end if;					
							when others => null;
						end case;
					elsif (GAME = 4) then
						-- Devil Zone sound registers
						case address is
							when 16#4800# => O_AUDIO <= cpu_data_out(7); -- 1 bit DAC
							when 16#4801# => O_SoundPort(1) <= SoundBit; -- High Score
							when 16#4803# => O_SoundPort(2) <= SoundBit; -- Explosion
							when 16#4804# => O_SoundPort(3) <= SoundBit; -- Fire
							when 16#4805# => O_SoundPort(4) <= SoundBit; -- Hit
							when 16#4806# => O_SoundPort(5) <= SoundBit; -- Holding noise
							when 16#4809# => O_SoundPort(6) <= SoundBit; -- Swoop
							when 16#480A# => O_SoundPort(7) <= SoundBit; -- Appear
							when 16#480B# => Sound_EN <= cpu_data_out(7);
								if (cpu_data_out(7)='0' and Sound_EN='1') then
									-- Stop all sounds as well if turning off
									O_SoundPort <= "0000000000000000";
									O_AUDIO     <= '0';
									O_SoundStop <= "1111111111111110";
								end if;
							-- sort rest
							when others => null;
							end case;
					elsif (GAME = 5) then
						-- No Mans Land sound registers
						case address is
							when 16#4800# => O_SoundPort(15) <= SoundBit; -- March (Special support in Samples module)
							when 16#4801# => BGM(0) <= SoundBit; 			 -- March Speed Low
							when 16#4802# => BGM(1) <= SoundBit; 			 -- March Speed High
							when 16#4803# => O_SoundPort(1) <= SoundBit;  -- Tank Drive
							when 16#4804# => O_SoundPort(2) <= SoundBit;  -- Enemy Supplement
							when 16#4805# => O_SoundPort(3) <= SoundBit;  -- Round Clear
							when 16#4806# => O_SoundPort(4) <= SoundBit;  -- Fire
							when 16#4808# => O_SoundPort(5) <= SoundBit;  -- Hit
							when 16#4809# => O_SoundPort(6) <= SoundBit;  -- Dead
							when 16#480A# => O_AUDIO <= cpu_data_out(7); -- 1 bit DAC
							when 16#480B# => Sound_EN <= cpu_data_out(7);
												  if (cpu_data_out(7)='0' and Sound_EN='1') then
														-- Stop all sounds as well if turning off
														O_SoundPort <= "0000000000000000";
														O_AUDIO     <= '0';
														O_SoundStop <= "1111111111111110";
												  end if;
							-- sort rest
							when others => null;
						end case;
					end if;
				end if;
			end if;
		end if;
	end if;
end process;

O_Sound_EN  <= Sound_EN;
O_NML_Speed <= BGM;
--
-- video subsystem
--
-- Bitmap graphics using colour prom with 16x16 or 32x32 sprites using pallette
--
-- needs 
-- in  - x,y,flip,vid_data
-- out - vidaddr,R,G,B
-- colour rom to load internally, needs to track colourmap change writes (3 bits)

-- spriteram write 

-- rom load 

video : work.COSMIC_VIDEO
port map (
	I_HCNT    => hcnt,
	I_VCNT    => vcnt,
	--
	I_S_FLIP  => Screen_Flip,
	I_H_FLIP  => I_FLIP,
	I_BITMAP  => v_bitmap_data,
	I_COL     => v_colour_page,
	I_BACKGND => v_background,
	O_VADDR   => vid_addr,
	--
	I_SPR_ADD => cpu_addr(4 downto 0),
	I_SPR_DAT => cpu_data_out,
	I_SPR_WR  => spr_wr,	
	--
	dn_addr   => dn_addr,
	dn_data   => dn_data,
	dn_wr     => dn_wr,
	dn_ld     => dn_ld,
	--
	O_RED     => O_VIDEO_R,
	O_GREEN   => O_VIDEO_G,
	O_BLUE    => O_VIDEO_B,
	--
	PIX_CLK	 => PIX_CLK,
	CLK       => CLK,
	CPU_ENA   => CPU_ENA,
	GAME      => GAME,
	PAUSED    => PAUSED
);

end RTL;
