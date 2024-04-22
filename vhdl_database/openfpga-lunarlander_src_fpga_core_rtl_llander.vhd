--
-- A simulation model of Lunar Lander hardware 
-- James Sweet 2019
-- This is not endorsed by fpgaarcade, please do not bother MikeJ with support requests
--
-- Built upon model of Asteroids Deluxe hardware
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

entity LLander is
	port (
		CLK_6             : in	std_logic;
		CLK_25            : in	std_logic;
		RESET_6_L         : in	std_logic;
		--
		DIP					: in 	std_logic_vector(7 downto 0);
		-- 
		ROT_LEFT_L			: in	std_logic;
		ROT_RIGHT_L			: in	std_logic;
		ABORT_L				: in	std_logic;
		GAME_SEL_L			: in	std_logic;
		START_L				: in	std_logic;
		COIN1_L				: in	std_logic;
		COIN2_L				: in	std_logic;
		-- 
		THRUST 				: in	std_logic_vector(7 downto 0);
		-- 
		DIAG_STEP_L			: in	std_logic;
		SLAM_L				: in	std_logic;
		SELF_TEST_L			: in	std_logic;
		-- 
		START_SEL_L			: out std_logic;
		LAMP2					: out std_logic;
		LAMP3					: out std_logic;
		LAMP4					: out std_logic;
		LAMP5					: out std_logic;
		COIN_CTR				: out	std_logic;
		--
		AUDIO_OUT 			: out std_logic_vector(7 downto 0);
		--
		X_VECTOR    		: out std_logic_vector(9 downto 0);
		Y_VECTOR 			: out std_logic_vector(9 downto 0);
		Z_VECTOR				: out std_logic_vector(3 downto 0);
		BEAM_ON   			: out std_logic;
		BEAM_ENA   			: out std_logic;

 	 dn_addr           : in 	std_logic_vector(15 downto 0);
	 dn_data         	 : in 	std_logic_vector(7 downto 0);
	 dn_wr				 : in 	std_logic	

		);
end;

architecture RTL of LLander is


  signal ena_count            : std_logic_vector(10 downto 0) := (others => '0');
  signal ena_3M               : std_ulogic;
  signal ena_1_5M             : std_ulogic;
  signal ena_1_5M_e           : std_ulogic;
  signal ena_3K               : std_ulogic;
  signal ena_12k					: std_ulogic;
  signal clk_3k					: std_ulogic;
  signal clk_6K					: std_ulogic;
  signal clk_12K					: std_ulogic;

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
  signal io_l						: std_logic;
  signal vmem_l               : std_logic;
  signal pmem_l               : std_logic;
  --
  signal sinp0_l              : std_logic;
  signal sinp1_l              : std_logic;
  signal opts_l               : std_logic;
  signal pot_l						: std_logic;
  --
  signal dma_go_l             : std_logic;
  signal outck_l        		: std_logic;
  signal wdclr_l              : std_logic;
  signal explode_l            : std_logic;
  signal dma_reset_l          : std_logic;
  signal audio_l              : std_logic;
  signal noiserst_l           : std_logic;
  --
  signal shipthrusten         : std_logic;
  --
  signal test_l               : std_logic;
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
  signal ram_we					: std_logic;

  -- io
  signal dips_p6_l            : std_logic_vector(7 downto 0);
  signal dips_ip_sel          : std_logic_vector(1 downto 0);

  signal control_ip0_l        : std_logic_vector(7 downto 0);
  signal control_ip0_sel      : std_logic;
  signal control_ip1_l        : std_logic_vector(7 downto 0);
  signal control_ip1_sel      : std_logic;

  -- sound
  signal aud						: std_logic_vector(5 downto 0);
  signal tone3khz					: std_logic_vector(3 downto 0);
  signal tone6khz					: std_logic_vector(3 downto 0);

  signal t_e_vol            	: std_logic_vector(2 downto 0);

  signal noise_shift          : std_logic_vector(15 downto 0);
  signal noise                : std_logic;
  signal shpsnd               : std_logic_vector(3 downto 0);
  signal lifesnd					: std_logic_vector(3 downto 0);


  signal lifeen					: std_logic;
  signal shpsnd_prefilter     : std_logic;
  signal shpsnd_filter_t1     : std_logic_vector(3 downto 0);
  signal shpsnd_filter_t2     : std_logic_vector(3 downto 0);
  signal shpsnd_filter_t3     : std_logic_vector(3 downto 0);
  signal shpsnd_filtered      : std_logic_vector(5 downto 0);
  signal expaud               : std_logic_vector(2 downto 0);
  signal expitch              : std_logic_vector(1 downto 0);
  signal noise_cnt            : std_logic_vector(3 downto 0);
  signal expld_snd            : std_logic_vector(3 downto 0);


  signal clkdiv2 					: std_logic_vector(3 downto 0);
  signal audio_out2 				: std_logic_vector(7 downto 0);
  
  signal rom_cs					: std_logic;
  signal rom_0_cs					: std_logic;
  signal rom_1_cs					: std_logic;
  signal rom_2_cs					: std_logic;
  signal rom_3_cs					: std_logic;
  signal rom_v_cs					: std_logic;
  
  
begin

rom_0_cs <= '1' when dn_addr(13 downto 11) = "000"     else '0';
rom_1_cs <= '1' when dn_addr(13 downto 11) = "001"     else '0';
rom_2_cs <= '1' when dn_addr(13 downto 11) = "010"     else '0';
rom_3_cs <= '1' when dn_addr(13 downto 11) = "011"     else '0';
rom_v_cs <= '1' when dn_addr(13) = '1'     else '0';
--rom_prom_cs <= '1' when dn_addr(13 downto 11) = "100"     else '0';


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

  
  cpu : entity work.T65 -- main cpu
      port map (
          Mode    => "00",
          Res_n   => reset_l,
          Enable  => ena_1_5M,
          Clk     => CLK_6,
          Rdy     => '1',
          Abort_n => '1',
          IRQ_n   => '1',
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
	 io_l 	<= deca(1);
    vmem_l  <= deca(2);
    pmem_l  <= deca(3);

	 
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
    opts_l  <= decb(2);
	 pot_l	<= decb(3);

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
		dma_go_l  	<= decc(0);
		outck_l   	<= decc(1);
		wdclr_l    	<= decc(2);
		dma_reset_l	<= decc(4);
		audio_l   	<= decc(6);
		noiserst_l 	<= decc(7);
  end process;
  
  
  lamp_reg : process(reset_l, clk_6)
  begin
	if (reset_l = '0') then
		lamp5 <= '0'; 
		lamp4 <= '0';
		lamp3 <= '0';
		lamp2 <= '0';
		start_sel_l <= '0';
		coin_ctr <= '0';
	elsif rising_edge(CLK_6) then
		if (ena_1_5M = '1') then
			if (outck_l = '0') then
				lamp5 <= c_dout(0);
				lamp4 <= c_dout(1);
				lamp3 <= c_dout(2);
				lamP2 <= c_dout(3);
				start_sel_l <= c_dout(4);
				coin_ctr <= c_dout(5);
			end if;
		end if;
	end if;
  end process;	
	

  p_input_registers : process
  begin
    wait until rising_edge(CLK_6);
    dips_p6_l <= DIP;
	 
    -- diag step, self test, slam, halt
    control_ip0_l(7) <= DIAG_STEP_L;
	 control_ip0_l(6) <= clk_3k; 		
	 control_ip0_l(5) <= '1';
	 control_ip0_l(4) <= '1';
	 control_ip0_l(3) <= '1';
	 control_ip0_l(2) <= SLAM_L;
    control_ip0_l(1) <= test_l; 		
    control_ip0_l(0) <= halt;
	 
    test_l <= SELF_TEST_L;
	 
    -- left, right, abort, game select, coin11, coin2, start
	 control_ip1_l(7) <= ROT_LEFT_L;  	
    control_ip1_l(6) <= ROT_RIGHT_L;  	
    control_ip1_l(5) <= ABORT_L;  		
    control_ip1_l(4) <= GAME_SEL_L;  	
    control_ip1_l(3) <= not COIN1_L;	
	 control_ip1_l(2) <= '1'; 
	 control_ip1_l(1) <= not COIN2_L;	
    control_ip1_l(0) <= START_L; 		
  end process;

  
  p_input_sel : process(c_addr, dips_p6_l, control_ip0_l, control_ip1_l, clk_3k, halt)
  begin
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
      when "00" => dips_ip_sel <= dips_p6_l(1) & dips_p6_l(0);
      when "01" => dips_ip_sel <= dips_p6_l(3) & dips_p6_l(2);
      when "10" => dips_ip_sel <= dips_p6_l(5) & dips_p6_l(4);
      when "11" => dips_ip_sel <= dips_p6_l(7) & dips_p6_l(6);
      when others => null;
    end case;
  end process;

rom0 : work.dpram generic map (11,8)
port map
(
	clock_a   => Clk_25,
	wren_a    => dn_wr and rom_0_cs,
	address_a => dn_addr(10 downto 0),
	data_a    => dn_data,

	clock_b   => CLK_6,
	address_b => c_addr(10 downto 0),
	q_b       => rom0_dout
);	  
rom1 : work.dpram generic map (11,8)
port map
(
	clock_a   => Clk_25,
	wren_a    => dn_wr and rom_1_cs,
	address_a => dn_addr(10 downto 0),
	data_a    => dn_data,

	clock_b   => CLK_6,
	address_b => c_addr(10 downto 0),
	q_b       => rom1_dout
);	  
rom2 : work.dpram generic map (11,8)
port map
(
	clock_a   => Clk_25,
	wren_a    => dn_wr and rom_2_cs,
	address_a => dn_addr(10 downto 0),
	data_a    => dn_data,

	clock_b   => CLK_6,
	address_b => c_addr(10 downto 0),
	q_b       => rom2_dout
);	  
rom3 : work.dpram generic map (11,8)
port map
(
	clock_a   => Clk_25,
	wren_a    => dn_wr and rom_3_cs,
	address_a => dn_addr(10 downto 0),
	data_a    => dn_data,

	clock_b   => CLK_6,
	address_b => c_addr(10 downto 0),
	q_b       => rom3_dout
);	  

--  Internal program ROMs if the FPGA is big enough	
--  rom0 : entity work.LLANDER_PROG_ROM_0
--    port map (
--      address    	=> c_addr(10 downto 0),
--      q        	=> rom0_dout,
--      clock       => CLK_6
--      );
--
--  rom1 : entity work.LLANDER_PROG_ROM_1
--    port map (
--      address     => c_addr(10 downto 0),
--      q        	=> rom1_dout,
--      clock       => CLK_6
--      );
--
--  rom2 : entity work.LLANDER_PROG_ROM_2
--    port map (
--      address     => c_addr(10 downto 0),
--      q        	=> rom2_dout,
--      clock       => CLK_6
--      );
--
--  rom3 : entity work.LLANDER_PROG_ROM_3
--    port map (
--      address     => c_addr(10 downto 0),
--      q        	=> rom3_dout,
--      clock       => CLK_6
--      );

--
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

  
-- Zero-page RAM		
RAM: Entity work.RAM256
port map(
	clock => clk_6,
	address => c_addr(7 downto 0),
	data => c_dout,
	wren => ram_we,
	q => ram_dout
	);
	
ram_we <= (not zpage_l) and (not c_rw_l) and ena_1_5M;	
  
 
-- CPU Data in mux controlled by address decoder 
p_cpu_data_mux : process(c_addr, ram_dout, rom_dout, vg_dout, zpage_l, pmem_l, vmem_l,
								sinp0_l, control_ip0_l, sinp1_l, control_ip1_sel,
								opts_l, dips_ip_sel, pot_l, thrust)
begin
	c_din <= (others => '0');
	if (sinp0_l = '0') then
		c_din <= control_ip0_l;
	elsif (sinp1_l = '0') then
		c_din <= control_ip1_sel & "1111111";
	elsif (opts_l = '0') then
		c_din <= "111111" & dips_ip_sel;
	elsif (pot_l = '0') then
		c_din <= thrust ;
	elsif (zpage_l = '0') then
		c_din <= ram_dout;
	elsif (pmem_l = '0') then
		c_din <= rom_dout;
	elsif (vmem_l = '0') then
		c_din <= vg_dout;
	end if;
end process;

  
  --
  -- audio
  --

  -- Thrust Aud0 through Aud 2 - volume
  -- Explosion - Aud 3,  volume by Aud 0 through Aud 2
  -- 3k - Aud 4
  -- 6k - Aud 5
  
  -- Output register for audio control 
  p_aud_reg : process(RESET_L, CLK_6)
  begin
    if (reset_l = '0') then
      aud  <= "000000";
    elsif rising_edge(CLK_6) then
      if (ena_1_5M = '1') then
        if (audio_l = '0') then
          aud <= c_dout(5 downto 0);
        end if;
      end if;
    end if;
  end process;
  
  
  tone3khz <= "1111" when clk_3k = '1' and aud(4) = '1' else "0000";
  tone6khz <= "1111" when clk_6k = '1' and aud(5) = '1' else "0000";
  t_e_vol  <= aud(2 downto 0);
  shipthrusten <= aud(0) or aud(1) or aud(2);
  
  
  -- LFSR to generate noise used in the ship thrust and explosion sounds
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

  -- Ship thrust sound, passes noise through a low pass filter
  p_ship_snd : process
  begin
    wait until rising_edge(CLK_6);
    shpsnd_prefilter <= noise and shipthrusten;
    -- simple low pass filter
    if (ena_3k = '1') then
      if (shpsnd_prefilter = '1') then
        shpsnd_filter_t1 <= t_e_vol & '0';
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

  
  p_expld_gen : process(reset_l, clk_6, aud)
  begin
  if reset_l = '0' then
      expaud <= "000";
    elsif (aud(3) = '1') and (noise = '1') then
      expaud <= aud(2 downto 0);
    else
      expaud <= "000";
    end if;
  end process;
		
  
  p_audio_output_reg : process
    variable sum : std_logic_vector(8 downto 0);
  begin
    wait until rising_edge(clk_6);

	 sum := ('0' & tone6khz)+ ('0' & tone3khz)+  ("00" & expaud & "000") + ('0' & shpsnd_filtered & "00");

    if (sum(8) = '0') then
      AUDIO_OUT <= sum(7 downto 0);
    else -- clip
      AUDIO_OUT <= "11111111";
    end if; 
  end process;
  

  --
  -- vector generator
  --

  vg : entity work.LLANDER_VG
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
      CLK_6        => CLK_6,
		CLK_25       => CLK_25,
		dn_addr      => dn_addr, 
		dn_data      => dn_data,
		dn_wr			 => dn_wr,			
		rom_v_cs     => rom_v_cs
		
      );

  BEAM_ENA <= ena_1_5m;


end RTL;
