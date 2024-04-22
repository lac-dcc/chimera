--
-- A simulation model of Asteroids hardware modified to drive a real vector monitor using a VGA DAC 
-- James Sweet 2016
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

 entity ASTEROIDS is
  port (
    --BUTTON            : in    std_logic_vector(15 downto 1); -- active low
    BUTTON            : in    std_logic_vector(7 downto 0); -- active low
	 SELF_TEST_SWITCH_L: in		std_logic; 
    --
    AUDIO_OUT         : out   std_logic_vector(7 downto 0);
    --
    X_VECTOR          : out   std_logic_vector(9 downto 0);
    Y_VECTOR          : out   std_logic_vector(9 downto 0);
    Z_VECTOR          : out   std_logic_vector(3 downto 0);
    BEAM_ON           : out   std_logic;
    BEAM_ENA          : out   std_logic;
	 START1_LED_L		 : out 	std_logic;
	 START2_LED_L		 : out	std_logic;
	 L_COIN_COUNTER	 : out   std_logic;
	 C_COIN_COUNTER    : out   std_logic;
	 R_COIN_COUNTER	 : out   std_logic;
	 lang					: in std_logic_vector(1 downto 0);
	 ships					: in std_logic;
    --
	 --PROG_ROM_ADDR		 : out std_logic_vector(12 downto 0);
	 --PROG_ROM_DATA		 : in	std_logic_vector(7 downto 0);
	 --
    RESET_6_L         : in    std_logic;
    CLK_6             : in    std_logic;
	 CLK_25            : in    std_logic;
 	 dn_addr           : in 	std_logic_vector(15 downto 0);
	 dn_data         	 : in 	std_logic_vector(7 downto 0);
	 dn_wr				 : in 	std_logic	
   );
end;

architecture RTL of ASTEROIDS is
--  constant SELF_TEST_SWITCH_L : std_logic := '1';

  signal ena_count            : std_logic_vector(10 downto 0) := (others => '0');
  signal ena_3M               : std_ulogic;
  signal ena_1_5M             : std_ulogic;
  signal ena_1_5M_e           : std_ulogic;
  signal ena_48k					: std_ulogic;
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
  signal out_l            		: std_logic;
  signal wdclr_l              : std_logic;
  signal explode_l            : std_logic;
  signal dma_reset_l          : std_logic;
  signal thump_l          		: std_logic;
  signal audio_l              : std_logic;
  signal noiserst_l           : std_logic;
  --
  signal shipthrusten         : std_logic;
  signal ramsel_l             : std_logic;
  --
  signal test_l               : std_logic;
  signal halt                 : std_logic;

  -- memory
  signal rom0_dout            : std_logic_vector(7 downto 0);
  signal rom1_dout            : std_logic_vector(7 downto 0);
  signal rom2_dout            : std_logic_vector(7 downto 0);
  signal rom_dout             : std_logic_vector(7 downto 0);
  signal ram_addr             : std_logic_vector(9 downto 0);
  signal ram_dout             : std_logic_vector(7 downto 0);
  signal vg_dout              : std_logic_vector(7 downto 0);


  -- io
  signal dips_p6_l            : std_logic_vector(7 downto 0);
  signal dips_ip_sel          : std_logic_vector(1 downto 0);

  signal control_ip0_l        : std_logic_vector(4 downto 0);
  signal control_ip0_sel      : std_logic;
  signal control_ip1_l        : std_logic_vector(7 downto 0);
  signal control_ip1_sel      : std_logic;

  -- sound
  signal noise_shift          : std_logic_vector(15 downto 0);
  signal noise                : std_logic;
  signal shpsnd               : std_logic_vector(3 downto 0);
  signal lifesnd					: std_logic_vector(3 downto 0);
  signal thumpsnd_filtered		: std_logic_vector(5 downto 0);
   signal firesnd					: std_logic_vector(3 downto 0);
 
  signal saucrsnden				: std_logic;
  signal saucer_snd				: std_logic;
  signal saucrsnd					: std_logic_vector(3 downto 0);
  signal saucer_ramp_count 	: integer range 0 to 80000;
  signal saucer_ramp_term		: integer range 1 to 80000;
  signal pitch_bend				: integer range 0 to 30000;
  signal pitchbendterm 			: integer range 1 to 255;
  signal pitchbendmult			: integer range 1 to 15;
  signal pitch_rising 			: std_logic;
  signal fnum						: std_logic_vector(4 downto 0);
  signal vco_cnt					: std_logic_vector(3 downto 0);
  signal comp						: std_logic;
  signal saucrfireen				: std_logic;
  signal saucrsel_l				: std_logic;
  signal shpfireen				: std_logic;
  
  
  signal shpfr_pitch  			: Integer;
  signal shpfr_decay 			: Integer;
  signal shpfr_count 			: Integer;

  signal saucrfr_pitch  		: Integer;
  signal saucrfr_decay 			: Integer;
  signal saucrfr_count 			: Integer;
  signal saucrfiresnd			: std_logic_vector(3 downto 0);

  signal thump_count				: std_logic_vector(5 downto 0);
  signal thumpsnd 				: std_logic_vector(3 downto 0);
  signal thumpfreq 				: std_logic_vector(3 downto 0);
  signal thumpvol 				: std_logic;

  signal lifeen					: std_logic;
  signal shpsnd_prefilter     : std_logic;
  signal shpsnd_filter_t1     : std_logic_vector(3 downto 0);
  signal shpsnd_filter_t2     : std_logic_vector(3 downto 0);
  signal shpsnd_filter_t3     : std_logic_vector(3 downto 0);
  signal shpsnd_filtered      : std_logic_vector(5 downto 0);
  signal expaud               : std_logic_vector(3 downto 0);
  signal expitch              : std_logic_vector(1 downto 0);
  signal noise_cnt            : std_logic_vector(3 downto 0);
  signal expld_snd            : std_logic_vector(3 downto 0);


  
  signal clk_100 : std_logic;
  signal clkdiv2 : std_logic_vector(3 downto 0);
  signal audio_out2 : std_logic_vector(7 downto 0);
  
  signal rom_cs					: std_logic;
  signal rom_0_cs					: std_logic;
  signal rom_1_cs					: std_logic;
  signal rom_2_cs					: std_logic;
  signal rom_v_cs					: std_logic;
begin


--035145-04e.ef2	2048	0			0000 000000000000
--035144-04e.h2	2048	2048		0000 100000000000
--035143-02.j2	2048	4096			0001 000000000000
--035127-02.np3	2048	6144		0001 100000000000
--034602-01.c8	256	8192			0010 000000000000


rom_0_cs <= '1' when dn_addr(13 downto 11) = "000"     else '0';
rom_1_cs <= '1' when dn_addr(13 downto 11) = "001"     else '0';
rom_2_cs <= '1' when dn_addr(13 downto 11) = "010"     else '0';
rom_v_cs <= '1' when dn_addr(13 downto 11) = "011"     else '0';
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
	 
	 ena_48k <= '0';
    if (ena_count(8 downto 0) = "0000000") then
      ena_48k <= '1';
    end if;

	 
    ena_12k <= '0';
    if (ena_count(8 downto 0) = "000000000") then
      ena_12k <= '1';
    end if;

    ena_3k <= '0';
    if (ena_count(10 downto 0) ="00000000000") then
      ena_3k <= '1';
    end if;

    clk_3k <= ena_count(10);
  end process;
  
  clkdivtemp: process(clk_3k)
  begin
	if rising_edge(clk_3k) then
		clkdiv2 <= clkdiv2 + 1;
		if clkdiv2 = 15 then
			clkdiv2 <= (others => '0');
			clk_100 <= not clk_100;
		end if;
	end if;
  end process;

  cpu : entity work.T65 -- main cpu
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
    out_l    	  <= decc(1);
    wdclr_l      <= decc(2);
    explode_l    <= decc(3);
    dma_reset_l  <= decc(4);
    thump_l  	  <= decc(5);
    audio_l      <= decc(6);
    noiserst_l   <= decc(7);
  end process;

  p_output_registers : process(RESET_L, CLK_6)
  begin
    if (reset_l = '0') then
      saucrsnden <= '0';
      saucrfireen <= '0';
		saucrsel_l <= '1'; -- inverted
      shipthrusten <= '0';
      shpfireen <= '0';
		lifeen <= '0';

    elsif rising_edge(CLK_6) then
      if (ena_1_5M = '1') and (audio_l = '0') then
        case c_addr(2 downto 0) is
          when "000" => saucrsnden <= c_dout(7);
          when "001" => saucrfireen <= c_dout(7);
          when "010" => saucrsel_l <= (not c_dout(7));
          when "011" => shipthrusten <= c_dout(7);
          when "100" => shpfireen <= c_dout(7);
          when "101" => lifeen <= c_dout(7);
          when "110" => null;
          when "111" => null;
          when others => null;
        end case;
      end if;
    end if;
  end process;


-- Output register for ramsel_l and lamp, LED and coin counter output
  lamp_register : process(out_l)
  begin
		if reset_l = '1' then
			if rising_edge(out_l) then
				ramsel_l <= c_dout(2);
				start1_led_l <= c_dout(1);
				start2_led_l <= c_dout(0);
				l_coin_counter <= c_dout(3);
				c_coin_counter <= c_dout(4);
				r_coin_counter <= c_dout(5);
			end if;
		end if;
	end process;
			

  p_input_registers : process
  begin
    wait until rising_edge(CLK_6);
    -- off is 1, on is 0
    --            12345678
    dips_p6_l <= lang & '0' & ships & "0000"; -- default

    -- self test, slam, diag step, fire, hyper
    control_ip0_l <= "11111";
    control_ip0_l(4) <= SELF_TEST_SWITCH_L;
	 control_ip0_l(3) <= '1'; 			-- slam
	 control_ip0_l(2) <= '1'; 			-- diag step
    control_ip0_l(1) <= BUTTON(3); 	-- fire
    control_ip0_l(0) <= BUTTON(0); 	-- shield
    test_l           <= SELF_TEST_SWITCH_L;

    -- left, right, thrust, start2, start1, coinr, coinc, coinl
    control_ip1_l <= "11111111";
    --control_ip1_l(7) <= BUTTON(1);  -- left
    --control_ip1_l(6) <= BUTTON(2);  -- right
    --control_ip1_l(5) <= BUTTON(3);  -- thrust
    --control_ip1_l(4) <= BUTTON(7);  -- start2
    --control_ip1_l(3) <= BUTTON(6);  -- start1
	 --control_ip1_l(2) <= BUTTON(13); -- coinr
	 --control_ip1_l(1) <= '1';			-- coinc
    --control_ip1_l(0) <= BUTTON(14); -- coinl
    control_ip1_l(7) <= BUTTON(6);
    control_ip1_l(6) <= BUTTON(7);
    control_ip1_l(5) <= BUTTON(1);
    control_ip1_l(4) <= BUTTON(4);
    control_ip1_l(3) <= BUTTON(5);
    control_ip1_l(0) <= BUTTON(2);
  end process;

  p_input_sel : process(c_addr, dips_p6_l, control_ip0_l, control_ip1_l, clk_3k, halt)
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

	 -- This is probably not correct for Asteroids - is it from deluxe?
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
  --  Internal program ROMs if the FPGA is big enough
--  rom0 : entity work.ASTEROIDS_PROG_ROM_0
--    port map (
--      address    	=> c_addr(10 downto 0),
--      q        	=> rom0_dout,
--      clock       => CLK_6
--      );
--
--  rom1 : entity work.ASTEROIDS_PROG_ROM_1
--    port map (
--      address     => c_addr(10 downto 0),
--      q        	=> rom1_dout,
--      clock       => CLK_6
--      );
--
--  rom2 : entity work.ASTEROIDS_PROG_ROM_2
--    port map (
--      address     => c_addr(10 downto 0),
--      q        	=> rom2_dout,
--      clock       => CLK_6
--      );

--
  p_rom_mux : process(c_addr, rom0_dout, rom1_dout, rom2_dout)
  begin
    rom_dout <= (others => '0');
    case c_addr(12 downto 11) is
      when "01" => rom_dout <= rom0_dout;
      when "10" => rom_dout <= rom1_dout;
      when "11" => rom_dout <= rom2_dout;
      when others => null;
    end case;
  end process;


  
-- Use external program ROM, contains all four ROMs concatenated

--prog_rom_addr(12 downto 0) <= c_addr(12 downto 0);
--
--rom_reg: process
--begin
--wait until rising_edge(clk_6); 
--	rom_dout <= prog_rom_data;
--end process;


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
  rams : entity work.ASTEROIDS_RAM
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
                           dpts_l, dips_ip_sel)
  begin
    c_din <= (others => '0');
    if (sinp0_l = '0') then
      c_din <= control_ip0_sel & "1111111";
    elsif (sinp1_l = '0') then
      c_din <= control_ip1_sel & "1111111";
    elsif (dpts_l = '0') then
      c_din <= "111111" & dips_ip_sel;
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


  
-- Saucer sound parameters for large and small saucers are selected by saucrsel_l
PitchBendTerm <= 252 when saucrsel_l = '0' else 186;
PitchBendMult <= 12 when saucrsel_l = '0' else 8;

-- Generate a sawtooth wave to bend the pitch of the saucer oscillator
Warble: process(clk_6, clk_3k, saucrsnden)
begin
if saucrsnden = '0' then
		pitch_rising <= '1';
	elsif rising_edge(clk_3k) then
				if pitch_rising = '1' then
					Pitch_bend <= pitch_bend + 1;
				else	
					Pitch_bend <= Pitch_bend - 1;
				end if;
				if Pitch_bend > PitchBendTerm then	
					pitch_rising <= '0';
				end if;
				if pitch_bend = 1 then
					pitch_rising <= '1';
				end if;
	end if;
end process;

-- Variable frequency oscillator to generate the saucer sounds
-- saucer_ramp_term terminates the ramp count, the higher this value, the longer the ramp will count up and the lower
-- the frequency..
saucer_ramp_term <= 1700 when saucrsel_l = '1' else 1580;

Ramp_osc: process(clk_6, pitch_bend)
begin
	if rising_edge(clk_6) then
		saucer_ramp_count <= saucer_ramp_count + 1;
		if saucer_ramp_count > saucer_ramp_term + ((Pitch_bend * PitchBendMult)) then
			saucer_ramp_count <= 0;
			saucer_snd <= (not saucer_snd);
		end if;
	end if;
end process;	
	
-- Turn the single-bit signals into larger values	
saucrsnd <= "1110" when saucer_snd = '1' and saucrsnden = '1' else "0000";	
lifesnd <= "1111" when clk_3k = '1' and lifeen = '1' else "0000";	

-- save off the values of the thumpfreq and thumpvol
   p_thump_gen_reg : process(RESET_L,CLK_6)
   begin
    if (reset_l = '0') then
      thumpfreq <= "0000";
      thumpvol <= '0';
    elsif rising_edge(CLK_6) then
      if (ena_1_5M = '1') then
        if (thump_l = '0') then
          thumpfreq <= c_dout(3 downto 0);
          thumpvol <= c_dout(4);
        end if;
      end if;
    end if;

  end process;
  
  -- generate a 100hz - thumpfreq frequency
  
 Thump_Sound_gen: process
  		constant Freq_tune : std_logic_vector(5 downto 0) := "011110"; -- Value from 0-100 used to tune the overall sound frequency
  begin
      wait until rising_edge(clk_3k);
		-- we need to divide the 3k clock by 30 to get a 100hz sound
		if (thump_count=0) then
				thump_count<=Freq_tune+("00"&thumpfreq);
				if (thumpvol='1') then
						thumpsnd <= not thumpsnd;
				else
						thumpsnd<="0000";
				end if;
		else
				thump_count<=thump_count-1;
		end if;
  end process;
  
  
  Fire_Sound_gen : process
   --constant decay : integer := 80; -- Value from used to tune the overall sound frequency
   constant decay : integer := 210; -- Value from used to tune the overall sound frequency
 begin
    --wait until rising_edge(CLK_6);
    wait until rising_edge(ena_48k);
				if (shpfireen='0') then
					--shpfr_pitch    <= 4;
					shpfr_pitch    <= 15;
					shpfr_decay    <= decay;
					shpfr_count    <=0;
				else
				   -- shpfr_count creates the wave
					-- it starts at pitch, and decrements
				   if (shpfr_count=0) then
						-- each time it is 0, toggle the wave
						firesnd <= not firesnd;
						-- reset the counter
						shpfr_count<=shpfr_pitch;
						-- when we decay, then reset decay and increase the pitch
					else
						shpfr_count <= shpfr_count - 1;
					end if;
					if (shpfr_decay=0) then
						shpfr_decay<=decay;
						shpfr_pitch<=shpfr_pitch+1;
					else
						shpfr_decay<=shpfr_decay-1;
					end if;
				end if;
  end process;
  

  SaucrFire_Sound_gen : process
   constant decay : integer := 210; -- Value from 0-100 used to tune the overall sound frequency
 begin
    --wait until rising_edge(CLK_6);
    wait until rising_edge(ena_48k);
				if (saucrfireen='0') then
					--shpfr_pitch    <= 4;
					saucrfr_pitch    <= 15;
					saucrfr_decay    <= decay;
					saucrfr_count    <=0;
				else
				   -- shpfr_count creates the wave
					-- it starts at pitch, and decrements
				   if (saucrfr_count=0) then
						-- each time it is 0, toggle the wave
						saucrfiresnd <= not saucrfiresnd;
						-- reset the counter
						saucrfr_count<=saucrfr_pitch;
						-- when we decay, then reset decay and increase the pitch
					else
						saucrfr_count <= saucrfr_count - 1;
					end if;
					if (saucrfr_decay=0) then
						saucrfr_decay<=decay;
						saucrfr_pitch<=saucrfr_pitch+1;
					else
						saucrfr_decay<=saucrfr_decay-1;
					end if;
				end if;
  end process;
  

	
	
	
	
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

  -- Explosion sound, 
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
  


		
		
  -- Mix the audio outputs (needs work for original Asteroids)
  p_audio_output_reg : process
    variable sum_p : std_logic_vector(6 downto 0);
    variable sum : std_logic_vector(7 downto 0);
  begin
    wait until rising_edge(CLK_6);

	 
	 sum :=  ('0'&thumpsnd)+('0'&saucrfiresnd)+('0' & firesnd)+('0' & lifesnd) + ('0' & saucrsnd) + ("00" & expld_snd & "00") + ("00" & shpsnd_filtered);
	 


--    if (sum(8) = '0') then
      AUDIO_OUT <= sum(7 downto 0);
--    else -- clip
--      AUDIO_OUT <= "11111111";
--    end if;

	 
  end process;

  --
  -- vector generator
  --

  vg : entity work.ASTEROIDS_VG
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
		Clk_25       => Clk_25,
		dn_addr      => dn_addr, 
		dn_data      => dn_data,
		dn_wr			 => dn_wr,			
		rom_v_cs     => rom_v_cs
		
      );
  BEAM_ENA <= ena_1_5m;

end RTL;
