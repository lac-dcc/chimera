library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cobra_top is
    port ( 
		-- clock
	 	clk : in std_logic; 
		z80_clk : in std_logic; 
		clk26mhz : in std_logic; 
		led2 : out std_logic;
		led3 : out std_logic;

		z80_rst : in std_logic;
		  
		VGA_HSYNC_OUT : out  STD_LOGIC;
		VGA_VSYNC_OUT : out  STD_LOGIC;
		VGA_R_OUT : out  STD_LOGIC;
		VGA_G_OUT : out  STD_LOGIC;
		VGA_B_OUT : out  STD_LOGIC;
		
		PLAYER_IN : in STD_LOGIC;
		
		PS2_CLK : in STD_LOGIC;
		PS2_DATA : in STD_LOGIC
	);
end cobra_top;

architecture rtl of cobra_top is

signal z80_m1 : std_logic;
signal z80_mreq : std_logic;
signal z80_iorq : std_logic;
signal z80_rd : std_logic;
signal z80_wr : std_logic;
signal z80_rfsh : std_logic;
signal z80_halt : std_logic;
signal z80_busack : std_logic;
signal z80_a : std_logic_vector(15 downto 0);
signal z80_d : std_logic_vector(7 downto 0) := (others => '0');

signal rom_ce : std_logic;
signal rom_data, rom_sys_data : std_logic_vector(7 downto 0);

signal sram_data_read : std_logic_vector(7 downto 0);
signal sram_data_write : std_logic_vector(7 downto 0);
signal sram_we : std_logic;
signal sram_a : std_logic_vector(14 downto 0);
		
signal clkcnt : std_logic_vector(25 downto 0) := (others => '0');

signal port_write_val : std_logic_vector(7 downto 0);

signal no_rom_remap : std_logic := '0';

signal vga_rgb: std_logic_vector(2 downto 0);
signal videoram_gen_addr : std_logic_vector(9 downto 0);
signal videoram_gen_data : std_logic_vector(7 downto 0);
signal video_addr : std_logic_VECTOR(9 downto 0);
signal video_data_in : std_logic_VECTOR(7 downto 0);
signal video_data_out : std_logic_VECTOR(7 downto 0);
signal video_we : std_logic;

signal kbd_vector : std_logic_vector(39 downto 0);

signal key_scancode : std_logic_vector(7 downto 0);
signal key_make : std_logic;
signal key_break : std_logic;

signal inh_in_123 : std_logic;
signal pulse_out_123 : std_logic;

begin

cpu : entity work.T80a
	generic map(
		Mode => 0 )
	port map(
		RESET_n => not z80_rst,
		CLK_n	=> z80_clk,
		WAIT_n => '1',
		INT_n	=> '1',
		NMI_n	=> '1',
		BUSRQ_n => '1',
		M1_n => z80_m1,
		MREQ_n => z80_mreq,
		IORQ_n => z80_iorq,
		RD_n => z80_rd,
		WR_n => z80_wr,
		RFSH_n => z80_rfsh,
		HALT_n => z80_halt,
		BUSAK_n => z80_busack,
		A => z80_a,
		D => z80_d 
		);
 
 inst_rom : entity work.sprom
	generic map(
		init_file  => "rtl/roms/cobra.hex",
		widthad_a  => 11,
		width_a  => 8)
	port map (
		address => z80_a(10 downto 0),
		clock => clk,
		q => rom_data
	);
	
inst_ram : entity work.spram
	generic map (
		addr_width_g  => 15,
		data_width_g  =>  8
	)
	port map (
		clk_i  => z80_clk,
		we_i   => sram_we,
		addr_i => z80_a(14 downto 0),
		data_i => sram_data_write,
		data_o => sram_data_read
	);

inst_cobra_kbd : entity work.cobra_kbd
	port map (
		clk => clk,
		key_code => key_scancode,
		key_set => key_make,
		key_clr => key_break,
		kbd_vector => kbd_vector
	);	

inst_ps2_keyboard : entity work.ps2_keyboard
	Port map (
		CLK => clk,
		PS2_CLK => PS2_CLK,
		PS2_DATA => PS2_DATA,
		
		KEY_SCANCODE => key_scancode,
		KEY_MAKE => key_make,
		KEY_BREAK => key_break
	);
	
	rom_ce <= '0' when (z80_mreq = '0') and (z80_a(15 downto 12) = X"C") else
				 '0' when (z80_mreq = '0') and (z80_a(15 downto 12) = X"0") and (no_rom_remap = '0') else
			    '1';

	sram_we <= '1' when (z80_wr='0') and (z80_a(15 downto 12) <= X"B") and (z80_mreq='0')
			else '0';

	video_we <= '1' when (z80_wr='0') and (z80_a(15 downto 12) = X"F") and (z80_mreq='0')
			else '0';
			
	process(clk, z80_rst)
	begin
		if (z80_rst = '1') then
			no_rom_remap <= '0';
		elsif rising_edge(clk) then
			if z80_rd = '0' then
				if z80_mreq = '0' then
					if (z80_a(15 downto 12) = X"C") then
						z80_d <= rom_data;			
					elsif (z80_a(15 downto 12) = X"0") and (no_rom_remap = '0') then
						z80_d <= rom_data;			
					elsif (z80_a(15 downto 12) = X"F") then
						z80_d <= video_data_out;			
					else
						z80_d <= sram_data_read;
					end if;										
				else -- port read
					   if (z80_a(15 downto 8) = X"FE") then
						z80_d <= inh_in_123&pulse_out_123&'1' & kbd_vector(4 downto 0);
					elsif (z80_a(15 downto 8) = X"FD") then
						z80_d <= inh_in_123&pulse_out_123&'1' & kbd_vector(9 downto 5);
					elsif (z80_a(15 downto 8) = X"FB") then
						z80_d <= inh_in_123&pulse_out_123&'1' & kbd_vector(14 downto 10);
					elsif (z80_a(15 downto 8) = X"F7") then
						z80_d <= inh_in_123&pulse_out_123&'1' & kbd_vector(19 downto 15);
					elsif (z80_a(15 downto 8) = X"EF") then
						z80_d <= inh_in_123&pulse_out_123&'1' & kbd_vector(24 downto 20);
					elsif (z80_a(15 downto 8) = X"DF") then
						z80_d <= inh_in_123&pulse_out_123&'1' & kbd_vector(29 downto 25);
					elsif (z80_a(15 downto 8) = X"BF") then
						z80_d <= inh_in_123&pulse_out_123&'1' & kbd_vector(34 downto 30);
					elsif (z80_a(15 downto 8) = X"7F") then
						z80_d <= inh_in_123&pulse_out_123&'1' & kbd_vector(39 downto 35);
					else 
						z80_d <= inh_in_123&pulse_out_123&'1' & (kbd_vector(4 downto 0) and kbd_vector(9 downto 5) and kbd_vector(14 downto 10) and kbd_vector(19 downto 15) and 
												kbd_vector(24 downto 20) and kbd_vector(29 downto 25) and kbd_vector(34 downto 30) and kbd_vector(39 downto 35));
					end if;
				end if;
			elsif z80_wr = '0' then
				if z80_mreq = '0' then
					if (z80_a(15 downto 12) <= X"B") then --z80_a(15) = '0' then
						sram_data_write <= z80_d;
					else --if (z80_a(15 downto 12) = X"F")
						video_data_in <= z80_d;
					end if;										
				else --port write
					port_write_val <= z80_d;
					if (z80_a(7 downto 0) = X"1F") then 
						no_rom_remap <= '1';
					end if;
				end if;
			else 				
				z80_d <= "ZZZZZZZZ";
			end if;	
		end if;
		
	end process;


VGA_R_OUT <= vga_rgb(2);
VGA_G_OUT <= vga_rgb(1);
VGA_B_OUT <= vga_rgb(0);

video_addr <= z80_a(9 downto 0);

led2 <= key_make;

inst_video_generator : entity work.video_generator
	port map (
		CLK_IN => clk,
		HSYNC_OUT => VGA_HSYNC_OUT,
		VSYNC_OUT => VGA_VSYNC_OUT,
		RGB_OUT => vga_rgb,
		VIDEORAM_ADDR => videoram_gen_addr,
		VIDEORAM_DATA => videoram_gen_data
	);

--inst_videoram : entity work.videoram
--	port map (
--		clka => clk,
--		wea => video_we,
--		addra => video_addr,
--		dina => video_data_in,
--		douta => video_data_out, 
--		clkb => clk,
--		web => (others=>'0'),
--		addrb  => videoram_gen_addr,
--		dinb  => (others=>'0'),
--		doutb => videoram_gen_data
--   );
	
inst_videoram : entity work.inst_videoram
  port map(
    clock_a => clk,
    wren_a => video_we,
    address_a => video_addr,
    data_a => video_data_in,
    q_a => video_data_out, 
    clock_b => clk,
	 wren_b => '0',
    address_b  => videoram_gen_addr,
    q_b => videoram_gen_data,
	 data_b => "00000000"
  );


-- PLAYER INPUT
	inh_in_123 <= PLAYER_IN;
	led3 <= not pulse_out_123;

	inst_multi74123 : entity work.multi74123
		port map (
			inh_pos => inh_in_123,
			q_neg => pulse_out_123,
			clk => clk
		);
		
end rtl;
