--
-- A simulation of Crazy Balloon
--
-- Mike Coates
--
-- version 001 initial release
--
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

entity CRAZYBALLOON is
port
(
	O_VIDEO_R  : out std_logic_vector(1 downto 0);
	O_VIDEO_G  : out std_logic_vector(1 downto 0);
	O_VIDEO_B  : out std_logic_vector(1 downto 0);
	O_HSYNC    : out std_logic;
	O_VSYNC    : out std_logic;
	O_HBLANK   : out std_logic;
	O_VBLANK   : out std_logic;
	I_H_OFFSET : in  std_logic_vector(3 downto 0);
	I_V_OFFSET : in  std_logic_vector(3 downto 0);
	--
	O_AUDIO    : out std_logic_vector(15 downto 0);
	--
	dipsw1     : in  std_logic_vector(7 downto 0);
	in0        : in  std_logic_vector(7 downto 0);
	in1        : in  std_logic_vector(7 downto 0);
	--
	dn_addr    : in  std_logic_vector(15 downto 0);
	dn_data    : in  std_logic_vector(7 downto 0);
	dn_wr      : in  std_logic;
	dn_ld	     : in  std_logic;
	--
	RESET      : in  std_logic;
	PIX_CLK    : in  std_logic;
	CPU_CLK    : in  std_logic;
	CLK        : in  std_logic
);
end;

architecture RTL of CRAZYBALLOON is
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
	signal cpu_int_l        : std_logic;
	signal cpu_addr         : std_logic_vector(15 downto 0);
	signal cpu_data_out     : std_logic_vector(7 downto 0);
	signal cpu_data_in      : std_logic_vector(7 downto 0) := "00000000";

	-- Memory mapping
	signal rom_rd           : std_logic := '0';
	signal ram_rd           : std_logic := '0';
	signal vid_rd           : std_logic := '0';
	signal col_rd           : std_logic := '0';				
	
	signal ram_wr           : std_logic := '0';
	signal vid_wr           : std_logic := '0';
	signal col_wr           : std_logic := '0';				
	
	signal IO_rd 				: std_logic := '0';
	signal IO_wr 				: std_logic := '0';
	
	signal rom_data         : std_logic_vector(7 downto 0);
	signal ram_data         : std_logic_vector(7 downto 0);
	signal vid_data         : std_logic_vector(7 downto 0);
	signal col_data         : std_logic_vector(3 downto 0);
	signal IO_Data 			: std_logic_vector(7 downto 0);
	
	signal IO_6 				: std_logic := '0';
	signal IO_8 				: std_logic := '0';
	signal IO_A 				: std_logic := '0';
	
	signal Interrupt_EN		: std_logic := '0';
	signal Global_Reset     : std_logic;

	-- watchdog
	signal watchdog_cnt     : std_logic_vector(8 downto 0);
	signal watchdog_clear   : std_logic;
	signal watchdog_reset_l : std_logic;
	
	-- Video
	signal vid_addr         : std_logic_vector(9 downto 0);
	signal v_char_data      : std_logic_vector(7 downto 0);
	signal v_colour_data	   : std_logic_vector(3 downto 0);
	signal Sprite_Collision : std_logic_vector(11 downto 0);
	signal ClearCollision   : std_logic := '0';
	signal Sprite_H			: std_logic_vector(7 downto 0) := x"00";
	signal Sprite_V			: std_logic_vector(7 downto 0) := x"00";
	signal Sprite_C	      : std_logic_vector(3 downto 0);
	signal Sprite_I	      : std_logic_vector(3 downto 0);
	signal Screen_Flip      : std_logic := '0';

	-- Sound
	signal SFX 			   	: std_logic_vector(15 downto 0);
	signal Tone					: std_logic_vector(7 downto 0) := x"00";
	signal Music_EN		   : std_logic := '0';
	signal Sound_EN		   : std_logic := '0';
	signal Laugh_EN		   : std_logic := '0';
	signal Explode_EN		   : std_logic := '0';
	signal Breath_EN		   : std_logic := '0';
	signal Appear_EN		   : std_logic := '0';
	
begin

  O_HBLANK <= hblank;
  O_VBLANK <= vblank;
  
  Global_Reset <= watchdog_reset_l and (not reset);
  
  --
  -- video timing
  --
  
  sync_stop : process(RESET,I_H_OFFSET,I_V_OFFSET)
  begin
		-- work out locations for sync pulses
		hsync_start <= std_logic_vector(to_unsigned(208 + to_integer(signed(I_H_OFFSET)),9));
		hsync_end   <= std_logic_vector(to_unsigned(222 + to_integer(signed(I_H_OFFSET)),9));
		vsync_start <= std_logic_vector(to_unsigned(260 + to_integer(signed(I_V_OFFSET)),9));
		vsync_end   <= std_logic_vector(to_unsigned(263 + to_integer(signed(I_V_OFFSET)),9));
  end process;
  
  p_hvcnt : process
    variable hcarry,vcarry : boolean;
  begin
    wait until rising_edge(CLK);
    if (PIX_CLK = '1') then
      hcarry := (hcnt = "111111111");
      if hcarry then
        hcnt <= "011000000"; -- 0C0
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

  p_sync_comb : process(hcnt, vcnt)
  begin
    do_hsync <= (hcnt = hsync_start);
    set_vblank <= (vcnt = "111111111"); -- 1FF
  end process;

  p_sync : process
  begin
    wait until rising_edge(CLK);
    -- Timing hardware is coded differently to the real hw
    -- Result is identical.
    if (PIX_CLK = '1') then
      if (hcnt = "011000001") then -- 0C1
        hblank <= '1';
      elsif (hcnt = "011111111") then -- 0FF
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
        elsif (vcnt = "100011111") then -- 11F
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
	
	if (Interrupt_EN = '0') then
	  cpu_int_l <= '1';
	else
	  if do_hsync and set_vblank then
		 cpu_int_l <= '0';
	  end if;
	end if;
	
	-- watchdog
	if watchdog_clear='1' or reset='1' then
		watchdog_cnt <= "000000000";
	elsif do_hsync and set_vblank then
		watchdog_cnt <= watchdog_cnt + "1";
	end if;

	watchdog_reset_l <= '1';
	if (watchdog_cnt = "111111111") then
		watchdog_reset_l <= '0';
	end if;
 end process;

--
-- cpu
--
	cpu : entity work.T80as
	port map (
		RESET_n       => Global_Reset,
		CLK_n         => CPU_CLK,
		WAIT_n        => '1',
		INT_n         => cpu_int_l,
		NMI_n         => '1',
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
		BUSAK_n       => open,
		DOE           => open
	);

--
-- address decode
--
-- rom         0000-3FFF
-- program ram 4000-43FF
-- video ram   4800-4Bff
-- colour ram  5000-53FF
-- IO            00-  FF

p_mem_decode : process(cpu_addr,cpu_iorq_l,cpu_rd_l,cpu_wr_l,cpu_mreq_l,cpu_m1_l,cpu_rfsh_l)
variable address : natural range 0 to 2**15 - 1;
begin
	rom_rd <= '0';
	ram_rd <= '0';
	vid_rd <= '0';
	col_rd <= '0';
	io_rd  <= '0';

	ram_wr <= '0';
	vid_wr <= '0';
	col_wr <= '0';
	io_wr  <= '0';

	address := to_integer(unsigned(cpu_addr));
	
	-- Ram/Rom read or write
	if cpu_mreq_l='0' and cpu_rfsh_l = '1' then
		if cpu_rd_l='0' then
			case address is
				when 16#0000# to 16#3FFF# => rom_rd <= '1';
				when 16#4000# to 16#43FF# => ram_rd <= '1';
				when 16#4800# to 16#4BFF# => vid_rd <= '1';
				when 16#5000# to 16#53FF# => col_rd <= '1';
				when others => null;
			end case;
		elsif cpu_wr_l='0' then
			case address is
				when 16#4000# to 16#43FF# => ram_wr <= '1';
				when 16#4800# to 16#4BFF# => vid_wr <= '1';
				when 16#5000# to 16#53FF# => col_wr <= '1';
				when others => null;
			end case;
		end if;
	elsif cpu_iorq_l='0' then
		if cpu_addr(7 downto 4)="0000" and cpu_m1_l='1' then
			io_rd <= not cpu_rd_l;
			io_wr <= not cpu_wr_l;
		end if;
	end if;

end process;

 -- Mux back to CPU
 p_cpu_src_data_mux : process(IO_Data,rom_data,ram_data,vid_data,col_data,io_rd,rom_rd,ram_rd,vid_rd,col_rd)
 begin
	 if io_rd = '1' then
		cpu_data_in <= IO_Data;
	 elsif rom_rd = '1' then
		cpu_data_in <= rom_data;
	 elsif ram_rd = '1' then
		cpu_data_in <= ram_data;
	 elsif vid_rd = '1' then
		cpu_data_in <= vid_data;
	 elsif col_rd = '1' then
		cpu_data_in <= "0000" & col_data;
	 else 
	   cpu_data_in <= x"FF";
 	 end if;
 end process;

 -- rom : 0000-3FFF
program_rom : entity work.prog
	port map (
		clk		=> clk,
		addr  	=> cpu_addr(13 downto 0),
		data  	=> rom_data
);

 -- ram : 4000-43FF
program_ram : entity work.spram
	generic map (
	  addr_width => 10
	)
	port map (
		q        => ram_data,
		data     => cpu_data_out,
		address  => cpu_addr(9 downto 0),
		wren     => ram_wr,
		clock    => clk
);



 -- character ram : 4800-4BFF	
 video_ram : entity work.dpram
	 generic map (
	  addr_width => 10
	 )
	 port map (
	  q_a        => vid_data,
	  data_a     => cpu_data_out,
	  address_a  => cpu_addr(9 downto 0),
	  wren_a     => vid_wr,
	  enable_a   => vid_wr or vid_rd,
	  clock      => clk,
	  
	  address_b  => vid_addr(9 downto 0),
	  q_b        => v_char_data
	 );

 -- colour ram : 5000-53FF	
 colour_ram : entity work.dpram
	 generic map (
	  addr_width => 10,
	  data_width => 4
	 )
	 port map (
	  q_a        => col_data,
	  data_a     => cpu_data_out(3 downto 0),
	  address_a  => cpu_addr(9 downto 0),
	  wren_a     => col_wr,
	  enable_a   => col_wr or col_rd,
	  clock      => clk,
	  
	  address_b  => vid_addr(9 downto 0),
	  q_b        => v_colour_data
	 );

---
--- IO
---

-- Register Write
IO_Write : Process (CPU_CLK)
begin
	if rising_edge(CPU_CLK) then
		watchdog_clear <= '0';
		-- Reset if collision position has been cleared
		if ClearCollision='1' and Sprite_Collision=x"000" then
			ClearCollision <= '0';
		end if;
		
		if Global_Reset='0' then
				Interrupt_EN   <= '0';
				Sound_EN		   <= '0';
				Music_EN		   <= '0';
				Explode_EN     <= '0';
				Breath_EN      <= '0';
				Appear_EN      <= '0';
				Laugh_EN       <= '0';
				IO_6           <= '0';		
				Screen_Flip	   <= '0';	
				IO_8           <= '0';	
				IO_A           <= '0';
				ClearCollision <= '1';
				Sprite_V       <= x"FF";
				Sprite_H       <= x"FF";
		end if;
		
		if io_wr='1' then
			  case cpu_addr(3 downto 0) is
				 when x"1" => 
					watchdog_clear <= '1';
				 when x"2" =>
				   Sprite_C <= not cpu_data_out(7 downto 4);
					Sprite_I <= cpu_data_out(3 downto 0);
				 when x"3" =>
					Sprite_H <= not cpu_data_out;
				 when x"4" =>
					Sprite_V <= not cpu_data_out;
				 when x"5" =>
					Tone <= cpu_data_out;
				 when x"6" => 
					Interrupt_EN <= cpu_data_out(0);
					Sound_EN		 <= cpu_data_out(1);
					Music_EN		 <= cpu_data_out(2);
					Explode_EN   <= cpu_data_out(3);
					Breath_EN    <= cpu_data_out(4);
					Appear_EN    <= cpu_data_out(5);
					Laugh_EN     <= cpu_data_out(6);
					IO_6         <= cpu_data_out(7);
					if cpu_data_out(0)='1' then
						ClearCollision <= '1';
					end if;
				 when x"8" => 
					Screen_Flip <= cpu_data_out(0);
					IO_8        <= cpu_data_out(1);
				 when x"a" => 
					IO_A        <= cpu_data_out(0);
				 when others => null;
			  end case;
		end if;
	end if;
end process;

-- register read
IO_Read : Process (CPU_CLK)
begin
	if rising_edge(CPU_CLK) then
		if IO_rd = '1' then
			  case cpu_addr(1 downto 0) is
				 when "00" =>
					IO_Data <= dipsw1;
				 when "01" =>
					IO_Data <= in0;
				 when "10" => 
					case cpu_addr(3 downto 2) is
						when "00" => IO_Data <= x"F" & Sprite_Collision(3 downto 0);
						when "01" => IO_Data <= x"F" & Sprite_Collision(7 downto 4);
						when "10" => IO_Data <= x"F" & Sprite_Collision(11 downto 8);
						when "11" => if Sprite_Collision = x"000" then
											IO_Data <= x"F7";
										 else
											IO_Data <= x"F8";
										 end if;
						when others => null;
					end case;
				 when "11" => 
					if IO_8='1' then
						IO_Data <= in1;
					else
						IO_Data <= "0000" & in1(3 downto 0);
					end if;
				 when others => 
					IO_Data <= x"FF";
			  end case;
		end if;
	end if;
end process;
	 
--
-- video subsystem
--
video : work.CRAZYBALLOON_VIDEO
port map (
	I_HCNT    => hcnt,
	I_VCNT    => vcnt,
	--
	I_FLIP    => Screen_Flip,
	I_CHAR    => v_char_data,
	I_COL     => v_colour_data,
	I_CLEAR   => ClearCollision,
	O_COLLIDE => Sprite_Collision,
	O_VADDR   => vid_addr,
	--
	I_SPRITE_H => Sprite_H,
	I_SPRITE_V => Sprite_V,
	I_SPRITE_C => Sprite_C,
	I_SPRITE_I => Sprite_I,
	--
--	dn_addr   => dn_addr,
--	dn_data   => dn_data,
--	dn_wr     => dn_wr,
--	dn_ld     => dn_ld,
	--
	O_RED     => O_VIDEO_R,
	O_GREEN   => O_VIDEO_G,
	O_BLUE    => O_VIDEO_B,
	--
	PIX_CLK	 => PIX_CLK,
	CLK       => CLK
);


--
-- audio subsystem
--
audio : work.CRAZYBALLOON_AUDIO
port map (
	I_HCNT        => hcnt(5),
	--
	I_MUSIC_ON    => Music_EN,
	I_TONE        => Tone,
	I_LAUGH       => Laugh_EN,
	I_EXPLODE     => Explode_EN,
	I_BREATH      => Breath_EN,
	I_APPEAR      => Appear_EN,
	--		
	I_RESET       => Global_Reset,
	--
	O_AUDIO       => SFX,
	CLK           => clk
);

O_AUDIO <= SFX when Sound_EN='1' else x"0000";

end RTL;
