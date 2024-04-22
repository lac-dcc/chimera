--
-- A simulation model of Asteroids Deluxe hardware
-- Copyright (c) MikeJ - May 2004
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
-- THIS CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
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
-- You are responsible for any legal issues arising from your use of this code.
--
-- The latest version of this file can be found at: www.fpgaarcade.com
--
-- Email support@fpgaarcade.com
--
-- Revision list
--
-- version 001 initial release
--
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;

use work.pkg_asteroids_xilinx_prims.all;
use work.pkg_asteroids.all;

entity ASTEROIDS is
  port (
    BUTTON            : in    std_logic_vector(7 downto 0); -- active low
    --
    AUDIO_OUT         : out   std_logic_vector(7 downto 0);
    --
    X_VECTOR          : out   std_logic_vector(9 downto 0);
    Y_VECTOR          : out   std_logic_vector(9 downto 0);
    Z_VECTOR          : out   std_logic_vector(3 downto 0);
    BEAM_ON           : out   std_logic;
    BEAM_ENA          : out   std_logic;
    --
    RESET_6_L         : in    std_logic;
    CLK_6             : in    std_logic
    );
end;

architecture RTL of ASTEROIDS is
  constant SELF_TEST_SWITCH_L : std_logic := '1';

  signal ena_count            : std_logic_vector(10 downto 0) := (others => '0');
  signal ena_3M               : std_ulogic;
  signal ena_1_5M             : std_ulogic;
  signal ena_1_5M_e           : std_ulogic;
  signal ena_12K              : std_ulogic;
  signal ena_3K               : std_ulogic;
  signal clk_3K               : std_ulogic;

  -- cpu
  signal c_addr               : std_logic_vector(23 downto 0);
  signal c_din                : std_logic_vector(7 downto 0);
  signal c_dout               : std_logic_vector(7 downto 0);
  signal c_rw_l               : std_logic;
  signal c_irq_l              : std_logic;
  signal c_nmi_l              : std_logic;
  signal reset_l              : std_logic;
  signal wd_cnt               : std_logic_vector(7 downto 0);
  --
  signal nmi_count            : std_logic_vector(3 downto 0);
  -- addr decode
  signal zpage_l              : std_logic;
  signal vmem_l               : std_logic;
  signal pmem_l               : std_logic;
  --
  signal sinp0_l              : std_logic;
  signal sinp1_l              : std_logic;
  signal dpts_l               : std_logic;
  --
  signal dma_go_l             : std_logic;
  signal eaaddrl_l            : std_logic;
  signal wdclr_l              : std_logic;
  signal explode_l            : std_logic;
  signal dma_reset_l          : std_logic;
  signal eacontrol_l          : std_logic;
  signal audio_l              : std_logic;
  signal noiserst_l           : std_logic;
  --
  signal start1_led_l         : std_logic;
  signal start2_led_l         : std_logic;
  signal shipthrusten         : std_logic;
  signal ramsel_l             : std_logic;
  --
  signal test_l               : std_logic;
  signal pkydcd               : std_logic;
  signal earead               : std_logic;
  signal halt                 : std_logic;

  -- memory
  signal rom0_dout            : std_logic_vector(7 downto 0);
  signal rom1_dout            : std_logic_vector(7 downto 0);
  signal rom2_dout            : std_logic_vector(7 downto 0);
  signal rom3_dout            : std_logic_vector(7 downto 0);
  signal rom_dout             : std_logic_vector(7 downto 0);
  signal ram_addr             : std_logic_vector(9 downto 0);
  signal ram_dout             : std_logic_vector(7 downto 0);
  signal vg_dout              : std_logic_vector(7 downto 0);
  signal pokey_dout           : std_logic_vector(7 downto 0);

  -- io
  signal dips_r5_l            : std_logic_vector(7 downto 0);
  signal dips_r8_l            : std_logic_vector(7 downto 0);
  signal dips_ip_sel          : std_logic_vector(1 downto 0);

  signal control_ip0_l        : std_logic_vector(4 downto 0);
  signal control_ip0_sel      : std_logic;
  signal control_ip1_l        : std_logic_vector(7 downto 0);
  signal control_ip1_sel      : std_logic;

  signal high_score_din       : std_logic_vector(7 downto 0);
  signal high_score_dout      : std_logic_vector(7 downto 0);
  signal high_score_addr      : std_logic_vector(8 downto 0);

  -- sound
  signal pokey_audio          : std_logic_vector(7 downto 0);
  signal noise_shift          : std_logic_vector(15 downto 0);
  signal noise                : std_logic;
  signal shpsnd               : std_logic_vector(3 downto 0);
  signal shpsnd_prefilter     : std_logic;
  signal shpsnd_filter_t1     : std_logic_vector(3 downto 0);
  signal shpsnd_filter_t2     : std_logic_vector(3 downto 0);
  signal shpsnd_filter_t3     : std_logic_vector(3 downto 0);
  signal shpsnd_filtered      : std_logic_vector(5 downto 0);
  signal expaud               : std_logic_vector(3 downto 0);
  signal expitch              : std_logic_vector(1 downto 0);
  signal noise_cnt            : std_logic_vector(3 downto 0);
  signal expld_snd            : std_logic_vector(3 downto 0);

begin
  p_ena : process -- clock divider
  begin
    wait until rising_edge(CLK_6);
    ena_count <= ena_count + "1";
    ena_3M   <= not ena_count(0); -- 3 Mhz;

    ena_1_5M <= '0';
    ena_1_5M_e <= '0';
    if (ena_count(1 downto 0) = "00") then
      ena_1_5M <= '1'; -- 1.5 Mhz
    end if;
    if (ena_count(1 downto 0) = "10") then
      ena_1_5M_e <= '1'; -- 1.5 Mhz (early)
    end if;
    ena_12k <= '0';
    if (ena_count(8 downto 0) = "000000000") then
      ena_12k <= '1';
    end if;

    ena_3k <= '0';
    if (ena_count(10 downto 0) = "00000000000") then
      ena_3k <= '1';
    end if;

    clk_3k <= ena_count(10);
  end process;

  cpu : T65 -- main cpu
      port map (
          Mode    => "00",
          Res_n   => reset_l,
          Enable  => ena_1_5M,
          Clk     => CLK_6,
          Rdy     => '1',
          Abort_n => '1',
          IRQ_n   => c_irq_l,
          NMI_n   => c_nmi_l,
          SO_n    => '1',
          R_W_n   => c_rw_l,
          Sync    => open,
          EF      => open,
          MF      => open,
          XF      => open,
          ML_n    => open,
          VP_n    => open,
          VDA     => open,
          VPA     => open,
          A       => c_addr,
          DI      => c_din,
          DO      => c_dout
      );
  c_irq_l <= '1';

  p_nmi : process(reset_l, CLK_6)
    variable carry : boolean;
  begin
    if (reset_l = '0') then
      c_nmi_l <= '1';
      nmi_count <= "0000";
    elsif rising_edge(CLK_6) then
    -- divide 3k signal by 12
      carry := (nmi_count = "1111");

      c_nmi_l <= '1';
      if (test_l = '1') and carry then
        c_nmi_l <= '0';
      end if;

      if (ena_3K = '1') then
        if carry then
          nmi_count <= "0100";
        else
          nmi_count <= nmi_count + "1";
        end if;
      end if;

    end if;
  end process;

  p_wd_reset : process(RESET_6_L, CLK_6)
  begin
    if (RESET_6_L = '0') then
      wd_cnt <= "00000000";
      reset_l <= '0';
    elsif rising_edge(CLK_6) then

      if (wdclr_l = '0') then
        wd_cnt <= "00000000";
      elsif (ena_3K = '1') then
        wd_cnt <= wd_cnt + "1";
      end if;

      if (ena_3k = '1') and (wd_cnt = "01111111") then
        reset_l <= not reset_l;
      end if;
      -- simulation
      -- reset_l <= reset_6_l;
    end if;
  end process;

  p_addr_decode1 : process(c_addr, c_rw_l, ena_1_5M, reset_l)
    variable deca : std_logic_vector(3 downto 0);
    variable decb : std_logic_vector(3 downto 0);
    variable decc : std_logic_vector(7 downto 0);
    variable input_read : std_logic;
    variable control_write : std_logic;
  begin
  -- cpu address bit 15 is tied to ground
  -- as far as the rest of the system is concerned
    deca := "1111";
    case c_addr(14 downto 13) is
      when "00" => deca := "1110";
      when "01" => deca := "1101";
      when "10" => deca := "1011";
      when "11" => deca := "0111";
      when others => null;
    end case;
    zpage_l <= deca(0);
    vmem_l  <= deca(2);
    pmem_l  <= deca(3);

    pkydcd   <= '0';
    earead <= '0';
    if (c_addr(14 downto 10) = "01011") then
      pkydcd  <= not c_addr(6);
      earead <=      c_addr(6);
    end if;

    input_read := (not deca(1)) and (not c_addr(12)) and c_rw_l;
    decb := "1111";
    if (input_read = '1') then
      case c_addr(11 downto 10) is
        when "00" => decb := "1110";
        when "01" => decb := "1101";
        when "10" => decb := "1011";
        when "11" => decb := "0111";
        when others => null;
      end case;
    end if;
    sinp0_l <= decb(0);
    sinp1_l <= decb(1);
    dpts_l  <= decb(2);

    control_write := (not deca(1)) and c_addr(12) and (not c_rw_l);-- and ena_1_5M;
    decc := "11111111";
    if (control_write = '1') then
      case c_addr(11 downto 9) is
        when "000" => decc := "11111110";
        when "001" => decc := "11111101";
        when "010" => decc := "11111011";
        when "011" => decc := "11110111";
        when "100" => decc := "11101111";
        when "101" => decc := "11011111";
        when "110" => decc := "10111111";
        when "111" => decc := "01111111";
        when others => null;
      end case;
    end if;
    dma_go_l     <= decc(0);
    eaaddrl_l    <= decc(1);
    wdclr_l      <= decc(2);
    explode_l    <= decc(3);
    dma_reset_l  <= decc(4);
    eacontrol_l  <= decc(5);
    audio_l      <= decc(6);
    noiserst_l   <= decc(7);

  end process;

  p_output_registers : process(RESET_L, CLK_6)
  begin
    if (reset_l = '0') then
      start1_led_l <= '0';
      start2_led_l <= '0';
      shipthrusten <= '0';
      ramsel_l <= '0';

    elsif rising_edge(CLK_6) then
      -- ramsel drives player 1 / 2 lights as well
      if (ena_1_5M = '1') and (audio_l = '0') then
        case c_addr(2 downto 0) is
          when "000" => start1_led_l <= c_dout(7);
          when "001" => start2_led_l <= c_dout(7);
          when "010" => null;
          when "011" => shipthrusten <= c_dout(7);
          when "100" => ramsel_l <= c_dout(7);
          when "101" => null;-- l_coin_counter <= c_dout(7);
          when "110" => null;-- c_coin_counter <= c_dout(7);
          when "111" => null;-- r_coin_counter <= c_dout(7);
          when others => null;
        end case;
      end if;
    end if;
  end process;

  p_input_registers : process
  begin
    wait until rising_edge(CLK_6);
    -- off is 1, on is 0
    --            12345678
    dips_r5_l <= "00100000"; -- default
    dips_r8_l <= "11000110"; -- default

    -- self test, slam, diag step, fire, shields
    control_ip0_l <= "11111";
    control_ip0_l(4) <= SELF_TEST_SWITCH_L;
    control_ip0_l(1) <= BUTTON(0);
    control_ip0_l(0) <= BUTTON(1);
    test_l           <= SELF_TEST_SWITCH_L;
    -- left, right, thrust, start2, start1, coinr, coinc, coinl
    control_ip1_l <= "11111111";

    control_ip1_l(7) <= BUTTON(2);
    control_ip1_l(6) <= BUTTON(3);
    control_ip1_l(5) <= BUTTON(4);
    control_ip1_l(4) <= BUTTON(5);
    control_ip1_l(3) <= BUTTON(6);
    control_ip1_l(0) <= BUTTON(7);
  end process;

  p_input_sel : process(c_addr, dips_r5_l, control_ip0_l, control_ip1_l, clk_3k, halt)
  begin
    control_ip0_sel <= '0';
    case c_addr(2 downto 0) is
      when "000" => control_ip0_sel <= '1';
      when "001" => control_ip0_sel <= not clk_3k;
      when "010" => control_ip0_sel <= not halt;
      when "011" => control_ip0_sel <= not control_ip0_l(0);
      when "100" => control_ip0_sel <= not control_ip0_l(1);
      when "101" => control_ip0_sel <= not control_ip0_l(2);
      when "110" => control_ip0_sel <= not control_ip0_l(3);
      when "111" => control_ip0_sel <= not control_ip0_l(4);
      when others => null;
    end case;

    control_ip1_sel <= '0';
    case c_addr(2 downto 0) is
      when "000" => control_ip1_sel <= not control_ip1_l(0);
      when "001" => control_ip1_sel <= not control_ip1_l(1);
      when "010" => control_ip1_sel <= not control_ip1_l(2);
      when "011" => control_ip1_sel <= not control_ip1_l(3);
      when "100" => control_ip1_sel <= not control_ip1_l(4);
      when "101" => control_ip1_sel <= not control_ip1_l(5);
      when "110" => control_ip1_sel <= not control_ip1_l(6);
      when "111" => control_ip1_sel <= not control_ip1_l(7);
      when others => null;
    end case;

    dips_ip_sel <= "00";
    case c_addr(1 downto 0) is
      when "00" => dips_ip_sel <= dips_r5_l(1) & dips_r5_l(0);
      when "01" => dips_ip_sel <= dips_r5_l(3) & dips_r5_l(2);
      when "10" => dips_ip_sel <= dips_r5_l(5) & dips_r5_l(4);
      when "11" => dips_ip_sel <= dips_r5_l(7) & dips_r5_l(6);
      when others => null;
    end case;

  end process;

  --  roms
--  rom0 : entity work.prog_rom_0
--    port map (
--      ADDR        => c_addr(10 downto 0),
--      DATA        => rom0_dout,
--      CLK         => CLK_6
--      );
		
  rom0 : entity work.sprom
	generic map(
		init_file         => "./roms/prog_rom_0.hex",
		widthad_a         => 11,
		width_a         	=> 8)
	port map(
		address        	=> c_addr(10 downto 0),
		clock         		=> CLK_6,
		q        			=> rom0_dout
	);		

--  rom1 : entity work.prog_rom_1
--    port map (
--      ADDR        => c_addr(10 downto 0),
--      DATA        => rom1_dout,
--      CLK         => CLK_6
--      );

  rom1 : entity work.sprom
	generic map(
		init_file         => "./roms/prog_rom_1.hex",
		widthad_a         => 11,
		width_a         	=> 8)
	port map(
		address        	=> c_addr(10 downto 0),
		clock         		=> CLK_6,
		q        			=> rom1_dout
	);	

--  rom2 : entity work.prog_rom_2
--    port map (
--      ADDR        => c_addr(10 downto 0),
--      DATA        => rom2_dout,
--      CLK         => CLK_6
--      );

  rom2 : entity work.sprom
	generic map(
		init_file         => "./roms/prog_rom_2.hex",
		widthad_a         => 11,
		width_a         	=> 8)
	port map(
		address        	=> c_addr(10 downto 0),
		clock         		=> CLK_6,
		q        			=> rom2_dout
	);	

--  rom3 : ASTEROIDS_PROG_ROM_3
 --   port map (
--      ADDR        => c_addr(10 downto 0),
--      DATA        => rom3_dout,
--     CLK         => CLK_6
 --     );
 
   rom3 : entity work.sprom
	generic map(
		init_file         => "./roms/prog_rom_3.hex",
		widthad_a         => 11,
		width_a         	=> 8)
	port map(
		address        	=> c_addr(10 downto 0),
		clock         		=> CLK_6,
		q        			=> rom3_dout
	);	

  p_rom_mux : process(c_addr, rom0_dout, rom1_dout, rom2_dout, rom3_dout)
  begin
    rom_dout <= (others => '0');
    case c_addr(12 downto 11) is
      when "00" => rom_dout <= rom0_dout;
      when "01" => rom_dout <= rom1_dout;
      when "10" => rom_dout <= rom2_dout;
      when "11" => rom_dout <= rom3_dout;
      when others => null;
    end case;
  end process;

  p_ram_addr : process(ramsel_l, c_addr)
    variable swap : std_logic;
  begin
    swap := not (ramsel_l and c_addr(9));

    ram_addr(9) <= c_addr(9);
    ram_addr(8) <= c_addr(8) xor swap;
    ram_addr(7 downto 0) <= c_addr(7 downto 0);
  end process;
  --
  -- main memory
  --
  rams : ASTEROIDS_RAM
    port map (
      ADDR   => ram_addr(9 downto 0),
      DIN    => c_dout,
      DOUT   => ram_dout,
      RW_L   => c_rw_l,
      CS_L   => zpage_l,
      ENA    => ena_1_5M,
      CLK    => CLK_6
      );

  p_cpu_data_mux : process(c_addr, ram_dout, rom_dout, vg_dout, zpage_l, pmem_l, vmem_l,
                           sinp0_l, control_ip0_sel, sinp1_l, control_ip1_sel,
                           dpts_l, dips_ip_sel, earead, high_score_dout, pkydcd, pokey_dout)
  begin
    c_din <= (others => '0');
    --if (earead = '1') then
      --c_din <= high_score_dout;
    if (sinp0_l = '0') then
      c_din <= control_ip0_sel & "1111111";
    elsif (sinp1_l = '0') then
      c_din <= control_ip1_sel & "1111111";
    elsif (dpts_l = '0') then
      c_din <= "111111" & dips_ip_sel;
    elsif (pkydcd = '1') then
      c_din <= pokey_dout;
    elsif (zpage_l = '0') then
      c_din <= ram_dout;
    elsif (pmem_l = '0') then
      c_din <= rom_dout;
    elsif (vmem_l = '0') then
      c_din <= vg_dout;
    end if;
  end process;

  p_high_score : process(RESET_L, CLK_6)
  -- NOT IMPLEMENTED
  begin
    if (reset_l = '0') then
      high_score_addr <= (others => '0');
      high_score_din <= (others => '0');
      high_score_dout <= (others => '0');
    elsif rising_edge(CLK_6) then
      -- ramsel drives player 1 / 2 lights as well
      if (ena_1_5M = '1') then
        if (eaaddrl_l = '0') then
          high_score_addr <= "000" & c_addr(5 downto 0);
          high_score_din <= c_dout;
        end if;
      end if;
      high_score_dout <= (others => '0');
    end if;
  end process;

  --
  -- audio
  --

  pokey : ASTEROIDS_POKEY -- pokey sound / io chip
    port map (
    ADDR      => c_addr(3 downto 0),
    DIN       => c_dout,
    DOUT      => pokey_dout,
    DOUT_OE_L => open,
    RW_L      => c_rw_l,
    CS        => pkydcd,
    CS_L      => '0',
    --
    AUDIO_OUT => pokey_audio,
    --
    PIN       => dips_r8_l,
    ENA       => ena_1_5M,
    CLK       => CLK_6
    );

  p_noise_gen : process(RESET_L, CLK_6)
    variable shift_in : std_logic;
  begin
    if (reset_l = '0') then
      noise_shift <= (others => '0');
      noise <= '0';
    elsif rising_edge(CLK_6) then
      if (ena_12k = '1') then
        shift_in := not(noise_shift(6) xor noise_shift(14));
        noise_shift <= noise_shift(14 downto 0) & shift_in;
        noise <= shift_in; -- one clock late
      end if;

    end if;
  end process;

  p_ship_snd : process
  begin
    wait until rising_edge(CLK_6);
    shpsnd_prefilter <= noise and shipthrusten;
    -- simple low pass filter
    if (ena_3k = '1') then
      if (shpsnd_prefilter = '1') then
        shpsnd_filter_t1 <= "1111";
      else
        shpsnd_filter_t1 <= "0000";
      end if;

      shpsnd_filter_t2 <= shpsnd_filter_t1;
      shpsnd_filter_t3 <= shpsnd_filter_t2;
    end if;
    shpsnd_filtered <= ("00" & shpsnd_filter_t1      ) +
                       ('0'  & shpsnd_filter_t2 & '0') +
                       ("00" & shpsnd_filter_t3      );
  end process;

  p_expld_gen_reg : process(RESET_L, CLK_6)
  begin
    if (reset_l = '0') then
      expitch <= "00";
      expaud  <= "0000";
    elsif rising_edge(CLK_6) then
      if (ena_1_5M = '1') then
        if (explode_l = '0') then
          expitch <= c_dout(7 downto 6);
          expaud <= c_dout(5 downto 2);
        end if;
      end if;
    end if;
  end process;

  p_expld_gen : process
    variable rc : boolean;
  begin
    wait until rising_edge(CLK_6);
    rc := (noise_cnt = "1111"); -- rc output
    if (ena_12k = '1') then
      if rc then -- rp output
        noise_cnt <= (expitch(1) or expitch(0)) & (not expitch(0)) & expitch(0) & expitch(1);
      else
        noise_cnt <= noise_cnt + "1";
      end if;

      if rc then
        if (noise = '1') then
          expld_snd <= expaud;
        else
          expld_snd <= "0000";
        end if;
      end if;
    end if;
  end process;


  p_audio_output_reg : process
    variable sum_p : std_logic_vector(6 downto 0);
    variable sum : std_logic_vector(8 downto 0);
  begin
    wait until rising_edge(CLK_6);
    sum_p := ('0' & expld_snd & "00") + ('0' & shpsnd_filtered);

    sum := ('0' & pokey_audio) + ('0' & sum_p & '0');

    if (sum(8) = '0') then
      AUDIO_OUT <= sum(7 downto 0);
    else -- clip
      AUDIO_OUT <= "11111111";
    end if;

  end process;

  --
  -- vector generator
  --

  vg : ASTEROIDS_VG
    port map (
      C_ADDR       => c_addr(15 downto 0),
      C_DIN        => c_dout,
      C_DOUT       => vg_dout,
      C_RW_L       => c_rw_l,
      VMEM_L       => vmem_l,

      DMA_GO_L     => dma_go_l,
      DMA_RESET_L  => dma_reset_l,
      HALT_OP      => halt,

      X_VECTOR     => X_VECTOR,
      Y_VECTOR     => Y_VECTOR,
      Z_VECTOR     => Z_VECTOR,
      BEAM_ON      => BEAM_ON,
      --
      ENA_1_5M     => ena_1_5m,
      ENA_1_5M_E   => ena_1_5m_e,
      RESET_L      => reset_l,
      CLK_6        => CLK_6
      );
  BEAM_ENA <= ena_1_5m;

end RTL;
