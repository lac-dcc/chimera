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
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

use work.pkg_asteroids_xilinx_prims.all;
use work.pkg_asteroids.all;

entity ASTEROIDS_VG is
  port (
    C_ADDR       : in    std_logic_vector(15 downto 0);
    C_DIN        : in    std_logic_vector( 7 downto 0);
    C_DOUT       : out   std_logic_vector( 7 downto 0);
    C_RW_L       : in    std_logic;
    VMEM_L       : in    std_logic;

    DMA_GO_L     : in    std_logic;
    DMA_RESET_L  : in    std_logic;
    HALT_OP      : out   std_logic;

    X_VECTOR     : out   std_logic_vector(9 downto 0);
    Y_VECTOR     : out   std_logic_vector(9 downto 0);
    Z_VECTOR     : out   std_logic_vector(3 downto 0);
    BEAM_ON      : out   std_logic;

    ENA_1_5M     : in    std_logic;
    ENA_1_5M_E   : in    std_logic;
    RESET_L      : in    std_logic;
    CLK_6        : in    std_logic
    );
end;

architecture RTL of ASTEROIDS_VG is
  type slv_array12 is array (natural range <>) of std_logic_vector(11 downto 0);

  signal state                : std_logic_vector(3 downto 0);
  signal next_state                : std_logic_vector(3 downto 0);
  signal state_halt           : std_logic;
  --
  signal dma_ld_l             : std_logic;
  signal dma_ld_l_t1          : std_logic;
  signal dma_push_l           : std_logic;
  signal blank_l              : std_logic;
  signal latch_l              : std_logic_vector(3 downto 0);
  signal halt_strobe_l        : std_logic;
  signal go_strobe_l          : std_logic;
  --
  signal stop                 : std_logic;
  signal go                   : std_logic;
  signal halt                 : std_logic;

  signal offset               : std_logic_vector(3 downto 0);
  signal timer                : std_logic_vector(3 downto 0);
  signal scale                : std_logic_vector(3 downto 0);
  signal scale_reg            : std_logic_vector(3 downto 0);
  signal reg_addr             : std_logic_vector(3 downto 0);
  signal new_reg_addr         : std_logic_vector(3 downto 0);
  signal alphanum_l           : std_logic;
  signal timer_load           : std_logic_vector(9 downto 0);
  signal timer_counter        : std_logic_vector(11 downto 0);

  signal dvx_bus              : std_logic_vector(11 downto 0);
  signal dvy_bus              : std_logic_vector(11 downto 0);
  --
  signal xpos_bus             : std_logic_vector(11 downto 0);
  signal ypos_bus             : std_logic_vector(11 downto 0);


  signal adma_bus             : std_logic_vector(12 downto 1);
  signal adma0                : std_logic;
  signal load_bus             : std_logic_vector(12 downto 1);

  signal vram1_l              : std_logic;
  signal vram2_l              : std_logic;
  signal vrom1_l              : std_logic;
  signal vrom2_l              : std_logic;
  signal vram1_t1_l           : std_logic;
  signal vram2_t1_l           : std_logic;
  signal vrom1_t1_l           : std_logic;
  signal vrom2_t1_l           : std_logic;
  signal am_bus               : std_logic_vector(12 downto 0);
  signal vw_l                 : std_logic;

  -- ratemul
  signal ratemul_reg          : std_logic_vector(9 downto 0);
  signal ratemulx_op          : std_logic;
  signal ratemulx_reg_and     : std_logic_vector(9 downto 0);
  signal ratemulx_clock_g     : std_logic;
  signal ratemulx_rate_out    : std_logic_vector(9 downto 0);
  --
  signal ratemuly_op          : std_logic;
  signal ratemuly_reg_and     : std_logic_vector(9 downto 0);
  signal ratemuly_clock_g     : std_logic;
  signal ratemuly_rate_out    : std_logic_vector(9 downto 0);
  --
  signal stack_reg            : slv_array12(3 downto 0) := (others => (others => '0'));
  signal ram_din              : std_logic_vector(7 downto 0);
  signal ram_dout_1           : std_logic_vector(7 downto 0);
  signal ram_dout_2           : std_logic_vector(7 downto 0);
  signal rom_dout_1           : std_logic_vector(7 downto 0);
  signal rom_dout_2           : std_logic_vector(7 downto 0);
  signal memory_dout          : std_logic_vector(7 downto 0);

begin

  p_halt_go : process(RESET_L, CLK_6)
  begin
    if (RESET_L = '0') then
      halt <= '1';
      go <= '0';
    elsif rising_edge(CLK_6) then
      -- slight rejig here from j-k of original
      if (DMA_RESET_L = '0') then
        halt <= '1';
      elsif (DMA_GO_L = '0') then
        halt <= '0';
      elsif (halt_strobe_l = '0') then
        halt <= timer(0);
      end if;

      if (halt = '1') then
        go <= '0';
      elsif (go_strobe_l = '0') then
        go <= '1';
      elsif (stop = '1') then
        go <= '0';
      end if;
    end if;
  end process;
  HALT_OP <= halt;
  --
  -- state machine
  --
  p_next_state : process(state, timer, go, halt)
    variable go_halt : std_logic;
  begin
    -- this lot used to be in a rom with
    --
    --addr(7) := not( go or halt);
    --addr(6) := timer(2) and timer(3);
    --addr(5) := timer(1) and timer(3);
    --addr(4) := timer(0) and timer(3);
    --addr(3 downto 0) := state;

    go_halt := go or halt;

    next_state <= x"0";
    case state is
      when x"0" => if (go_halt = '1') then
                     next_state <= x"0";
                   else
                     next_state <= x"9";
                   end if;

      when x"1" => if (go_halt = '1') then
                     next_state <= x"1";
                   else
                     next_state <= x"2";
                   end if;

      when x"2" =>   next_state <= x"D";
      when x"3" =>   next_state <= x"D";
      when x"4" =>   next_state <= x"5";
      when x"5" =>   next_state <= x"6";
      when x"6" =>   next_state <= x"7";
      when x"7" =>   next_state <= x"D";

      when x"8" => if (timer = x"B") then
                     next_state <= x"B";
                   else
                     next_state <= x"9";
                   end if;

      when x"9" =>   next_state <= x"D";
      when x"A" =>   next_state <= x"1";

      when x"B" => if (timer = x"A") then
                     next_state <= x"D";
                   else
                     next_state <= x"0";
                   end if;

      when x"C" => if (timer = x"B") or (timer = x"C") then
                     next_state <= x"8";
                   elsif (timer = x"D") or (timer = x"E") then
                     next_state <= x"9";
                   elsif (timer = x"F") then
                     next_state <= x"A";
                   else
                     next_state <= x"F";
                   end if;

      when x"D" =>   next_state <= x"C";

      when x"E" => if (timer = x"A") then
                     next_state <= x"B";
                   else
                     next_state <= x"A";
                   end if;

      when x"F" =>   next_state <= x"E";
      when others => null;
    end case;
  end process;

  p_state_machine : process(RESET_L, CLK_6)
  begin
     if (RESET_L = '0') then
       state <= "0000";
       state_halt <= '0';
     elsif rising_edge(CLK_6) then

       if (DMA_RESET_L = '0') then
         state <= "0000";
         state_halt <= '0';
       elsif (ENA_1_5M = '1') then
         if (vmem_l = '1') or (state(2) = '0') then
           state <= next_state;
           state_halt <= halt;
         end if;
       end if;
     end if;
  end process;

  p_state_decode : process(state, state_halt, vmem_l, ENA_1_5M_E)
    variable dec : std_logic_vector(7 downto 0);
  begin
    dec := "11111111";
    -- if start(2) is low, ignore vmem_l
    if (state(3) = '1') and ((vmem_l = '1') or (state(2) = '0')) and (ENA_1_5M_E = '1') then
      case state(2 downto 0) is
        when "000" => dec := "11111110";
        when "001" => dec := "11111101";
        when "010" => dec := "11111011";
        when "011" => dec := "11110111";
        when "100" => dec := "11101111";
        when "101" => dec := "11011111";
        when "110" => dec := "10111111";
        when "111" => dec := "01111111";
        when others => null;
      end case;
    end if;
    adma0 <= state(0);
    blank_l <= not (state(3) or state_halt);

    -- following stobes are used on ena_1_5 early, so must not be clock enables on ena_1_5.
    latch_l(3)    <= dec(7);
    latch_l(2)    <= dec(6);
    latch_l(1)    <= dec(5);
    latch_l(0)    <= dec(4);
    halt_strobe_l <= dec(3);
    go_strobe_l   <= dec(2);
    dma_ld_l      <= dec(1);
    dma_push_l    <= dec(0);
  end process;
  --
  -- Program counter / stack
  --
  p_dmald : process(timer, CLK_6)
  begin
    if (timer(0) = '0') then
      dma_ld_l_t1 <= '0';
    elsif rising_edge(CLK_6) then
      dma_ld_l_t1 <= dma_ld_l;
    end if;
  end process;

  p_regaddr_calc : process(timer, reg_addr, dma_ld_l, dma_ld_l_t1, dma_push_l)
    variable offset : std_logic_vector(3 downto 0);
  begin
    -- we need the address early

    -- dma_push_l = '0' => store, then inc
    -- dma_ld dec, then load pc from stack
    if (timer(0) = '1') then -- down
      offset := "1111";
    else
      offset := "0001";
    end if;

    if ((dma_ld_l = '0') and (dma_ld_l_t1 = '1')) or (dma_push_l = '0') then
      new_reg_addr <= reg_addr + offset;
    else
      new_reg_addr <= reg_addr;
    end if;
  end process;

  p_regaddr : process
  begin
    wait until rising_edge(CLK_6);

    if (DMA_GO_L = '0') then -- reset not in original
      reg_addr <= "0000";
    else
      reg_addr <= new_reg_addr ;
    end if;
  end process;

  p_reg_write : process
  begin
    wait until rising_edge(CLK_6);
    if (dma_push_l = '0') then
      case reg_addr(1 downto 0) is
        when "00" => stack_reg(0) <= adma_bus;
        when "01" => stack_reg(1) <= adma_bus;
        when "10" => stack_reg(2) <= adma_bus;
        when "11" => stack_reg(3) <= adma_bus;
        when others => null;
      end case;
    end if;
  end process;

  p_reg_read : process(timer(0), new_reg_addr, dvy_bus, stack_reg)
  begin
    if (timer(0) = '1') then -- load
      load_bus <= stack_reg(0); -- default
      case new_reg_addr(1 downto 0) is
        when "00" => load_bus <= stack_reg(0);
        when "01" => load_bus <= stack_reg(1);
        when "10" => load_bus <= stack_reg(2);
        when "11" => load_bus <= stack_reg(3);
        when others => null;
      end case;
    else
      load_bus <= dvy_bus;
    end if;
  end process;

  p_pc : process
  begin
    wait until rising_edge(CLK_6);
      if (dma_ld_l = '0') then
        adma_bus <= load_bus;
      else
        if (latch_l(0) = '0') or (latch_l(2) = '0') then
          adma_bus <= adma_bus + "1";
        end if;
      end if;
  end process;
  --
  -- address decoder
  --
  p_addr_sel : process(VMEM_L, adma_bus, adma0,  C_ADDR, C_RW_L)
  begin
    if (VMEM_L = '0') then
      am_bus <= C_ADDR(12 downto 0);
      vw_l <= C_RW_L;
    else
      am_bus <= adma_bus & adma0;
      vw_l <= '1';
    end if;
  end process;

  p_am_decode : process(am_bus)
  begin
    vram1_l <= '1';
    vram2_l <= '1';
    vrom1_l <= '1';
    vrom2_l <= '1';
    case am_bus(12 downto 10) is
      when "000" => vram1_l <= '0';
      when "001" => vram2_l <= '0';
      when "010" => vrom1_l <= '0';
      when "011" => vrom1_l <= '0';
      when "100" => vrom2_l <= '0';
      when "101" => vrom2_l <= '0';
      when others => null;
    end case;
  end process;

  p_am_reg : process
  begin
    wait until rising_edge(CLK_6);
    vram1_t1_l <= vram1_l;
    vram2_t1_l <= vram2_l;
    vrom1_t1_l <= vrom1_l;
    vrom2_t1_l <= vrom2_l;
  end process;

  -- only cpu can write to vector ram
  ram_din <= C_DIN;
  C_DOUT <= memory_dout;

  -- vector memory
  u_vector_ram_1 : ASTEROIDS_RAM
    port map (
    ADDR   => am_bus(9 downto 0),
    DIN    => ram_din,
    DOUT   => ram_dout_1,
    RW_L   => vw_l,
    CS_L   => vram1_l,
    ENA    => ena_1_5M,
    CLK    => CLK_6
    );

  u_vector_ram_2 : ASTEROIDS_RAM
    port map (
    ADDR   => am_bus(9 downto 0),
    DIN    => ram_din,
    DOUT   => ram_dout_2,
    RW_L   => vw_l,
    CS_L   => vram2_l,
    ENA    => ena_1_5M,
    CLK    => CLK_6
    );

--  u_vector_rom_1 : entity work.vec_rom_1
--    port map (
--      CLK         => CLK_6,
--      ADDR        => am_bus(10 downto 0),
--      DATA        => rom_dout_1
--      );
		
  u_vector_rom_1 : entity work.sprom
	generic map(
		init_file         => "./roms/vec_rom_1.hex",
		widthad_a         => 11,
		width_a         	=> 8)
	port map(
		address        	=> am_bus(10 downto 0),
		clock         		=> CLK_6,
		q        			=> rom_dout_1
	);

--  u_vector_rom_2 : entity work.vec_rom_1--ASTEROIDS_VEC_ROM_2
--    port map (
--      CLK         => CLK_6,
--      ADDR        => am_bus(10 downto 0),
--      DATA        => rom_dout_2
--      );
		
  u_vector_rom_2 : entity work.sprom
	generic map(
		init_file         => "./roms/vec_rom_2.hex",
		widthad_a         => 11,
		width_a         	=> 8)
	port map(
		address        	=> am_bus(10 downto 0),
		clock         		=> CLK_6,
		q        			=> rom_dout_2
	);		

  p_memory_data_mux : process(vram1_t1_l, vram2_t1_l, vrom1_t1_l, vrom2_t1_l, ram_dout_1, ram_dout_2, rom_dout_1, rom_dout_2)
  begin
    -- cpu buffer enabled when VMEM_L = 0
    memory_dout <= (others => '0');
    if    (vram1_t1_l = '0') then
      memory_dout <= ram_dout_1;
    elsif (vram2_t1_l = '0') then
      memory_dout <= ram_dout_2;
    elsif (vrom1_t1_l = '0') then
      memory_dout <= rom_dout_1;
    elsif (vrom2_t1_l = '0') then
      memory_dout <= rom_dout_2;
    --else
      --memory_dout <= (others => 'X');
    end if;
  end process;
  --
  -- data memory latches
  --
  p_latch : process
  begin
    wait until rising_edge(CLK_6);
    -- latch3
    if ((alphanum_l = '0') and (latch_l(0) = '0')) or (latch_l(3) ='0') then
     scale <= memory_dout(7 downto 4);
     dvx_bus(11 downto 8) <= memory_dout(3 downto 0);
    end if;

    -- latch2
    if (alphanum_l = '0') then
      dvx_bus(7 downto 0) <= x"00";
    elsif (latch_l(2) = '0') then
      dvx_bus(7 downto 0) <= memory_dout(7 downto 0);
    end if;

    -- we know we have a sync reset
    -- latch1
    if (DMA_RESET_L = '0') or (RESET_L = '0') or (dma_go_l = '0') then
      timer <= x"0";
      dvy_bus(11 downto 8) <= x"0";
    elsif (latch_l(1) = '0') then
      timer <= memory_dout(7 downto 4);
      dvy_bus(11 downto 8) <= memory_dout(3 downto 0);
    end if;

    -- latch0
    if (DMA_RESET_L = '0') or (RESET_L = '0') or (dma_go_l = '0') or (alphanum_l = '0') then
      dvy_bus(7 downto 0) <= x"00";
    elsif (latch_l(0) = '0') then
      dvy_bus(7 downto 0) <= memory_dout(7 downto 0);
    end if;
  end process;

  --
  -- vector timer
  --
  p_scale_reg : process
  begin
    wait until rising_edge(CLK_6);
    if (latch_l(2) = '0') and (timer(3) = '1') and (timer(1) = '1') then
      scale_reg <= scale;
    end if;
  end process;

  p_vector_timer : process(timer, dvx_bus, dvy_bus, scale_reg)
    variable sel : std_logic;
    variable mux : std_logic_vector(3 downto 0);
    variable add : std_logic_vector(3 downto 0);
    variable dec : std_logic_vector(9 downto 0);
  begin
    sel := '1';
    if (timer = "1111") then
      sel := '0';
    end if;
    alphanum_l <= sel;

    if (sel = '0') then
      mux := '0' & dvx_bus(11) & not dvx_bus(11) & dvy_bus(11);
    else
      mux := timer;
    end if;


    add := scale_reg + mux;

    timer_load <= "1111111111";
    case add is
      when "0000" => timer_load <= "1111111110";
      when "0001" => timer_load <= "1111111101";
      when "0010" => timer_load <= "1111111011";
      when "0011" => timer_load <= "1111110111";
      when "0100" => timer_load <= "1111101111";
      when "0101" => timer_load <= "1111011111";
      when "0110" => timer_load <= "1110111111";
      when "0111" => timer_load <= "1101111111";
      when "1000" => timer_load <= "1011111111";
      when "1001" => timer_load <= "0111111111";
      when others => timer_load <= "1111111111";
    end case;

  end process;

  p_vector_timer_counter : process
  begin
    wait until rising_edge(CLK_6);
    if (go = '0') then
      timer_counter <= "1" & timer_load & '1';
    elsif (ENA_1_5M = '1') then
      timer_counter <= timer_counter + "1";
    end if;

  end process;

  p_stop : process(timer_counter)
  begin
    stop <= '0';
    if (timer_counter = x"FFF") then
      stop <= '1';
    end if;
  end process;

  --
  -- Rate Multipliers
  -- vgck is 1.5Mhz clock
  --
  p_ratemul_reg : process(go, CLK_6)
  begin
    -- share a reg here
    if (go = '0') then
      ratemul_reg <= (others => '0');
    elsif rising_edge(CLK_6) then
      if (ENA_1_5M = '1') then
        ratemul_reg <= ratemul_reg + "1";
      end if;
    end if;
  end process;

  p_ratemulx_and : process(ratemul_reg, ratemulx_reg_and)
  begin
    ratemulx_reg_and(0) <= ratemul_reg(0);
    for i in 1 to 9 loop
      ratemulx_reg_and(i) <= ratemul_reg(i) and ratemulx_reg_and(i-1);
    end loop;
  end process;

  p_ratemuly_and : process(ratemul_reg, ratemuly_reg_and)
  begin
    ratemuly_reg_and(0) <= ratemul_reg(0);
    for i in 1 to 9 loop
      ratemuly_reg_and(i) <= ratemul_reg(i) and ratemuly_reg_and(i-1);
    end loop;
  end process;

  p_ratemulx_rate : process(ratemulx_reg_and, ratemul_reg, dvx_bus)
  begin
    ratemulx_rate_out(0) <= (not ratemul_reg(0)) and dvx_bus(9);
    for i in 1 to 9 loop
      ratemulx_rate_out(i) <= (not ratemul_reg(i)) and ratemulx_reg_and(i-1) and dvx_bus(9-i);
    end loop;
  end process;

  p_ratemuly_rate : process(ratemuly_reg_and, ratemul_reg, dvy_bus)
  begin
    ratemuly_rate_out(0) <= (not ratemul_reg(0)) and dvy_bus(9);
    for i in 1 to 9 loop
      ratemuly_rate_out(i) <= (not ratemul_reg(i)) and ratemuly_reg_and(i-1) and dvy_bus(9-i);
    end loop;
  end process;

  p_ratemul_op : process
  begin
    wait until rising_edge(CLK_6);
    -- we can afford a register here as the enables are every 4 clocks
    if (go = '0') then -- clear
      ratemulx_op <= '0';
      ratemuly_op <= '0';
    else
      ratemulx_op <= '1';
      if (ratemulx_rate_out = "0000000000") then
        ratemulx_op <= '0';
      end if;

      ratemuly_op <= '1';
      if (ratemuly_rate_out = "0000000000") then
        ratemuly_op <= '0';
      end if;
    end if;
  end process;
  --
  -- x/y position counter
  --
  p_x_pos : process
  begin
    wait until rising_edge(CLK_6);
    if (timer(0) = '0') and (halt_strobe_l = '0') then
      xpos_bus <= dvx_bus(11 downto 0);
    elsif (ENA_1_5M = '1') and (go = '1') and (ratemulx_op = '1') then
      if (dvx_bus(10) = '0') then
        xpos_bus <= xpos_bus + "1";
      else
        xpos_bus <= xpos_bus - "1";
      end if;
    end if;
  end process;

  p_y_pos : process
  begin
    wait until rising_edge(CLK_6);
    if (timer(0) = '0') and (halt_strobe_l = '0') then
      ypos_bus <= dvy_bus(11 downto 0);
    elsif (ENA_1_5M = '1') and (go = '1') and (ratemuly_op = '1') then
      if (dvy_bus(10) = '0') then
        ypos_bus <= ypos_bus + "1";
      else
        ypos_bus <= ypos_bus - "1";
      end if;
    end if;
  end process;
  --
  -- output stages
  --
  p_output : process(RESET_L, CLK_6)
  begin
    if (RESET_L = '0') then
      X_VECTOR <= "1000000000";
      Y_VECTOR <= "1000000000";
      Z_VECTOR <= "0000";
      BEAM_ON  <= '0';
    elsif rising_edge(CLK_6) then
      -- clamp beam at edges
      if (xpos_bus(10) = '0') then
        X_VECTOR <= xpos_bus(9 downto 0);
      else
        for i in 0 to 9 loop
          X_VECTOR(i) <= not xpos_bus(11);
        end loop;
      end if;

      if (ypos_bus(10) = '0') then
        Y_VECTOR <= ypos_bus(9 downto 0);
      else
        for i in 0 to 9 loop
          Y_VECTOR(i) <= not ypos_bus(11);
        end loop;
      end if;

      BEAM_ON <= '0';
      Z_VECTOR <= "0000";
      if (xpos_bus(11 downto 10) = "00") and
         (ypos_bus(11 downto 10) = "00") then
        BEAM_ON <= '1';
        if (blank_l = '1') then
          Z_VECTOR <= scale;
        end if;
      end if;
    end if;
  end process;

end architecture RTL;
