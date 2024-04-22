--
-- A simulation model of Scramble hardware
-- Copyright (c) MikeJ - Feb 2007
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

library UNISIM;
  use UNISIM.Vcomponents.all;

entity SCRAMBLE_AUDIO is
  port (
    I_HWSEL_FROGGER    : in    boolean;
    --
    I_ADDR             : in    std_logic_vector(15 downto 0);
    I_DATA             : in    std_logic_vector( 7 downto 0);
    O_DATA             : out   std_logic_vector( 7 downto 0);
    O_DATA_OE_L        : out   std_logic;
    --
    I_RD_L             : in    std_logic;
    I_WR_L             : in    std_logic;
    I_IOPC7            : in    std_logic;
    --
    O_AUDIO            : out   std_logic_vector( 9 downto 0);
    --
    I_1P_CTRL          : in    std_logic_vector( 6 downto 0); -- start, shoot1, shoot2, left,right,up,down
    I_2P_CTRL          : in    std_logic_vector( 6 downto 0); -- start, shoot1, shoot2, left,right,up,down
    I_SERVICE          : in    std_logic;
    I_COIN1            : in    std_logic;
    I_COIN2            : in    std_logic;
    O_COIN_COUNTER     : out   std_logic;
    --
    I_DIP              : in    std_logic_vector( 5 downto 1);
    --
    I_RESET_L          : in    std_logic;
    ENA                : in    std_logic; -- 6 MHz
    ENA_1_79           : in    std_logic; -- 1.78975 MHz
    CLK                : in    std_logic
    );
end;

architecture RTL of SCRAMBLE_AUDIO is

  signal reset : std_logic;
  signal cpu_ena            : std_logic;
  signal cpu_ena_gated      : std_logic;
  --
  signal cpu_m1_l           : std_logic;
  signal cpu_mreq_l         : std_logic;
  signal cpu_iorq_l         : std_logic;
  signal cpu_rd_l           : std_logic;
  signal cpu_wr_l           : std_logic;
  signal cpu_rfsh_l         : std_logic;
  signal cpu_halt_l         : std_logic;
  signal cpu_wait_l         : std_logic;
  signal cpu_int_l          : std_logic;
  signal cpu_nmi_l          : std_logic;
  signal cpu_busrq_l        : std_logic;
  signal cpu_busak_l        : std_logic;
  signal cpu_addr           : std_logic_vector(15 downto 0);
  signal cpu_data_out       : std_logic_vector(7 downto 0);
  signal cpu_data_in        : std_logic_vector(7 downto 0);
  --
  signal ram_cs             : std_logic;
  signal rom_oe             : std_logic;
  signal filter_load        : std_logic;
  signal filter_reg         : std_logic_vector(11 downto 0);
  --
  signal cpu_rom0_dout      : std_logic_vectoR(7 downto 0);
  signal cpu_rom1_dout      : std_logic_vectoR(7 downto 0);
  signal cpu_rom2_dout      : std_logic_vectoR(7 downto 0);
  signal rom_active         : std_logic;

  signal rom_dout           : std_logic_vector(7 downto 0);
  signal ram_dout           : std_logic_vector(7 downto 0);
  --
  signal i8255_addr         : std_logic_vector(1 downto 0);
  signal i8255_1D_data      : std_logic_vector(7 downto 0);
  signal i8255_1D_data_oe_l : std_logic;
  signal i8255_1D_cs_l      : std_logic;
  signal i8255_1D_pa_in     : std_logic_vector(7 downto 0);
  signal i8255_1D_pa_out    : std_logic_vector(7 downto 0);
  signal i8255_1D_pb_out    : std_logic_vector(7 downto 0);
  --
  signal i8255_1E_data      : std_logic_vector(7 downto 0);
  signal i8255_1E_data_oe_l : std_logic;
  signal i8255_1E_cs_l      : std_logic;
  signal i8255_1E_pa        : std_logic_vector(7 downto 0);
  signal i8255_1E_pb        : std_logic_vector(7 downto 0);
  signal i8255_1E_pc        : std_logic_vector(7 downto 0);

  -- security
  signal net_1e10_i         : std_logic;
  signal net_1e12_i         : std_logic;
  signal xb                 : std_logic_vector(7 downto 0);
  signal xbo                : std_logic_vector(7 downto 0);

  signal audio_div_cnt      : std_logic_vector( 8 downto 0) := (others => '0');
  signal ls90_op            : std_logic_vector(3 downto 0);
  signal ls90_clk           : std_logic;
  signal ls90_cnt           : std_logic_vector( 3 downto 0) := (others => '0');
  -- ym2149 3C
  signal ym2149_3C_dv       : std_logic_vector(7 downto 0);
  signal ym2149_3C_oe_l     : std_logic;
  signal ym2149_3C_bdir     : std_logic;
  signal ym2149_3C_bc2      : std_logic;
  signal ym2149_3C_bc1      : std_logic;
  signal ym2149_3C_audio    : std_logic_vector(7 downto 0);
  signal ym2149_3C_chan     : std_logic_vector(1 downto 0);
  signal ym2149_3C_chan_t1  : std_logic_vector(1 downto 0);
  --
  -- ym2149 3D
  signal ym2149_3D_dv       : std_logic_vector(7 downto 0);
  signal ym2149_3D_oe_l     : std_logic;
  signal ym2149_3D_bdir     : std_logic;
  signal ym2149_3D_bc2      : std_logic;
  signal ym2149_3D_bc1      : std_logic;
  signal ym2149_3D_audio    : std_logic_vector(7 downto 0);
  signal ym2149_3D_chan     : std_logic_vector(1 downto 0);
  signal ym2149_3D_chan_t1  : std_logic_vector(1 downto 0);
  signal ym2149_3D_ioa_in   : std_logic_vector(7 downto 0);
  signal ym2149_3D_ioa_out  : std_logic_vector(7 downto 0);
  signal ym2149_3D_ioa_oe_l : std_logic;
  signal ym2149_3D_iob_in   : std_logic_vector(7 downto 0);
  --
  signal ampm               : std_logic;
  signal sint               : std_logic;
  signal sint_t1            : std_logic;
  --
  signal audio_3C_mix       : std_logic_vector(9 downto 0);
  signal audio_3C_final     : std_logic_vector(9 downto 0);
  signal audio_3D_mix       : std_logic_vector(9 downto 0);
  signal audio_3D_final     : std_logic_vector(9 downto 0);
  signal audio_final        : std_logic_vector(10 downto 0);

  signal security_count     : std_logic_vector(2 downto 0);
  signal rd_l_t1            : std_logic;
  -- filters
  signal ym2149_3C_k        : std_logic_vector(16 downto 0);
  signal ym2149_3D_k        : std_logic_vector(16 downto 0);
  signal audio_in_m_out_3C  : std_logic_vector(17 downto 0);
  signal audio_in_m_out_3D  : std_logic_vector(17 downto 0);
  signal audio_mult_3C      : std_logic_vector(35 downto 0);
  signal audio_mult_3D      : std_logic_vector(35 downto 0);



  type array_4of17 is array (3 downto 0) of std_logic_vector(16 downto 0);
  constant K_Filter : array_4of17 := ('0' & x"00A3",
                                      '0' & x"00C6",
                                      '0' & x"039D",
                                      '1' & x"0000" );

  type filter_pipe is array (3 downto 0) of std_logic_vector(17 downto 0);
  signal ym2149_3C_audio_pipe : filter_pipe;
  signal ym2149_3D_audio_pipe : filter_pipe;
     -- LP filter out = in.k + out_t1.(1-k)
     --
     --                 = (in-out_t1).k + out_t1
     --
     -- using
     --        -(Ts.2.PI.Fc)
     -- k = 1-e
     --
     -- sampling freq = 1.79 MHz
     --
     -- cut off freqs     bit 0 1
     --
     --0.267uf  ~ 713 Hz      1 1   0.00249996 x 00A3
     --0.220uf  ~ 865 Hz      1 0   0.00303210 x 00C6
     --0.047uf  ~ 4050 Hz     0 1   0.01411753 x 039D
     --                       0 0              x10000

begin
  -- scramble
  --0000-1fff ROM
  --8000-83ff RAM

  -- frogger
  --0000-17ff ROM
  --4000-43ff RAM

  cpu_ena <= '1'; -- run at audio clock speed
  -- other cpu signals
  cpu_busrq_l <= '1';
  cpu_nmi_l   <= '1';
  cpu_wait_l  <= '1';
  --
  cpu_ena_gated <= ENA_1_79 and cpu_ena;
  u_cpu : entity work.T80sed
          port map (
              RESET_n => I_RESET_L,
              CLK_n   => CLK,
              CLKEN   => cpu_ena_gated,
              WAIT_n  => cpu_wait_l,
              INT_n   => cpu_int_l,
              NMI_n   => cpu_nmi_l,
              BUSRQ_n => cpu_busrq_l,
              M1_n    => cpu_m1_l,
              MREQ_n  => cpu_mreq_l,
              IORQ_n  => cpu_iorq_l,
              RD_n    => cpu_rd_l,
              WR_n    => cpu_wr_l,
              RFSH_n  => cpu_rfsh_l,
              HALT_n  => cpu_halt_l,
              BUSAK_n => cpu_busak_l,
              A       => cpu_addr,
              DI      => cpu_data_in,
              DO      => cpu_data_out
              );

  p_cpu_int : process(CLK, I_RESET_L)
  begin
    if (I_RESET_L = '0') then
      cpu_int_l <= '1';
      sint_t1   <= '0';
    elsif rising_edge(CLK) then
      if (ENA_1_79 = '1') then
        sint_t1 <= sint;

        if (cpu_m1_l = '0') and (cpu_iorq_l = '0') then
          cpu_int_l <= '1';
        elsif (sint = '0') and (sint_t1 = '1') then
          cpu_int_l <= '0';
        end if;
      end if;
    end if;
  end process;

  p_mem_decode_comb : process(cpu_rfsh_l, cpu_wr_l, cpu_rd_l, cpu_mreq_l, cpu_addr, I_HWSEL_FROGGER)
    variable decode : std_logic;
  begin
    if not I_HWSEL_FROGGER then
      decode := '0';
      if (cpu_rfsh_l = '1') and (cpu_mreq_l = '0') and (cpu_addr(15) = '1') then
        decode := '1';
      end if;

      filter_load <= decode and cpu_addr(12) and (not cpu_wr_l);
      ram_cs      <= decode and (not cpu_addr(12));
    else
      decode := '0';
      if (cpu_rfsh_l = '1') and (cpu_mreq_l = '0') and (cpu_addr(14) = '1') then
        decode := '1';
      end if;

      filter_load <= decode and cpu_addr(13) and (not cpu_wr_l);
      ram_cs      <= decode and (not cpu_addr(13));
    end if;

    rom_oe <= '0';
    if not I_HWSEL_FROGGER then
      if (cpu_addr(15) = '0') and (cpu_mreq_l = '0') and (cpu_rd_l = '0') then
        rom_oe <= '1';
      end if;
    else
      if (cpu_addr(14) = '0') and (cpu_mreq_l = '0') and (cpu_rd_l = '0') then
        rom_oe <= '1';
      end if;
    end if;

  end process;

  u_rom_5c : entity work.ROM_SND_0
    port map (
      CLK         => CLK,
      ENA         => ENA_1_79,
      ADDR        => cpu_addr(10 downto 0),
      DATA        => cpu_rom0_dout
      );

  u_rom_5d : entity work.ROM_SND_1
    port map (
      CLK         => CLK,
      ENA         => ENA_1_79,
      ADDR        => cpu_addr(10 downto 0),
      DATA        => cpu_rom1_dout
      );

  u_rom_5e : entity work.ROM_SND_2
    port map (
      CLK         => CLK,
      ENA         => ENA_1_79,
      ADDR        => cpu_addr(10 downto 0),
      DATA        => cpu_rom2_dout
      );

  p_rom_mux : process(I_HWSEL_FROGGER, cpu_rom0_dout, cpu_rom1_dout, cpu_rom2_dout, cpu_addr, rom_oe)
    variable rom_oe_decode : std_logic;
    variable cpu_rom0_dout_s : std_logic_vector(7 downto 0);
  begin
    if not I_HWSEL_FROGGER then
      cpu_rom0_dout_s := cpu_rom0_dout;
    else -- swap bits 0 and 1
      cpu_rom0_dout_s := cpu_rom0_dout(7 downto 2) & cpu_rom0_dout(0) & cpu_rom0_dout(1);
   end if;

    rom_dout <= (others => '0');
    rom_oe_decode := '0';
    case cpu_addr(13 downto 11) is
      when "000" => rom_dout <= cpu_rom0_dout_s; rom_oe_decode := '1';
      when "001" => rom_dout <= cpu_rom1_dout;   rom_oe_decode := '1';
      when "010" => rom_dout <= cpu_rom2_dout;   rom_oe_decode := '1';
      when others => null;
    end case;

    rom_active <= '0';
    if (rom_oe = '1') then
      rom_active <= rom_oe_decode;
    end if;
  end process;

  u_ram_6c_6d : entity work.SCRAMBLE_RAM
    port map (
      I_ADDR(10)         => '0',
      I_ADDR(9 downto 0) => cpu_addr(9 downto 0),
      I_DATA             => cpu_data_out,
      O_DATA             => ram_dout,
      I_RW_L             => cpu_wr_l,
      I_CS               => ram_cs,
      ENA                => ENA_1_79,
      CLK                => CLK
      );

  p_cpu_data_mux : process(rom_dout, rom_active, ram_dout, ym2149_3C_oe_l, ym2149_3C_dv, ym2149_3D_oe_l, ym2149_3D_dv, ram_cs, cpu_wr_l)
  begin
    if    (rom_active = '1') then
      cpu_data_in <= rom_dout;
    elsif (ram_cs = '1') and (cpu_wr_l = '1') then
      cpu_data_in <= ram_dout;
    elsif (ym2149_3C_oe_l = '0') then
      cpu_data_in <= ym2149_3C_dv;
    elsif (ym2149_3D_oe_l = '0') then
      cpu_data_in <= ym2149_3D_dv;
    else
      cpu_data_in <= (others => '1'); -- float high
    end if;
  end process;

  p_filter_reg : process
  begin
    wait until rising_edge(CLK);
    if (ENA_1_79 = '1') then
      if (filter_load = '1') then
        filter_reg <= cpu_addr(11 downto 0);
      end if;
    end if;
  end process;

  p_8255_decode : process(I_RESET_L, I_ADDR, I_HWSEL_FROGGER)
  begin
    reset <= not I_RESET_L;
    i8255_1D_cs_l <= '1';
    i8255_1E_cs_l <= '1';

    if not I_HWSEL_FROGGER then
      -- the interface one
      if (I_ADDR(9) = '1') and (I_ADDR(15) = '1') then
        i8255_1D_cs_l <= '0';
      end if;

      -- the button one
      if (I_ADDR(8) = '1') and (I_ADDR(15) = '1') then
        i8255_1E_cs_l <= '0';
      end if;
      i8255_addr <= I_ADDR(1 downto 0);
    else
      -- the interface one
      if (I_ADDR(12) = '1') and (I_ADDR(15 downto 14) = "11") then
        i8255_1D_cs_l <= '0';
      end if;

      -- the button one
      if (I_ADDR(13) = '1') and (I_ADDR(15 downto 14) = "11") then
        i8255_1E_cs_l <= '0';
      end if;
      i8255_addr <= I_ADDR(2 downto 1);
    end if;
  end process;

  p_ym_decode : process(cpu_rd_l, cpu_wr_l, cpu_iorq_l, cpu_addr, I_HWSEL_FROGGER)
    variable rd_3c : std_logic;
    variable wr_3c : std_logic;
    variable ad_3c : std_logic;
    --
    variable rd_3d : std_logic;
    variable wr_3d : std_logic;
    variable ad_3d : std_logic;
  begin

  --bdir bc2 bc1
  --  0   0  0    nop
  --  0   0  1    addr latch   < WR_L AV4 / AV6
  --  0   1  0    nop
  --  0   1  1    data read    < RD_L AV5 / AV7

  --  1   0  0    addr latch
  --  1   0  1    nop
  --  1   1  0    data write   < WR_L AV5 / AV7
  --  1   1  1    addr latch


    if not I_HWSEL_FROGGER then
      rd_3c := (not cpu_rd_l) and (not cpu_iorq_l) and cpu_addr(5);
      wr_3c := (not cpu_wr_l) and (not cpu_iorq_l) and cpu_addr(5);
      ad_3c := (not cpu_wr_l) and (not cpu_iorq_l) and cpu_addr(4);
    else
      rd_3c := '0';
      wr_3c := '0';
      ad_3c := '0';
    end if;

    ym2149_3C_bdir <= wr_3c;
    ym2149_3C_bc2  <= rd_3c or wr_3c;
    ym2149_3C_bc1  <= rd_3c or ad_3c;


    if not I_HWSEL_FROGGER then
      rd_3d := (not cpu_rd_l) and (not cpu_iorq_l) and cpu_addr(7);
      wr_3d := (not cpu_wr_l) and (not cpu_iorq_l) and cpu_addr(7);
      ad_3d := (not cpu_wr_l) and (not cpu_iorq_l) and cpu_addr(6);
    else
      rd_3d := (not cpu_rd_l) and (not cpu_iorq_l) and cpu_addr(6);
      wr_3d := (not cpu_wr_l) and (not cpu_iorq_l) and cpu_addr(6);
      ad_3d := (not cpu_wr_l) and (not cpu_iorq_l) and cpu_addr(7);
    end if;

    ym2149_3D_bdir <= wr_3d;
    ym2149_3D_bc2  <= rd_3d or wr_3d;
    ym2149_3D_bc1  <= rd_3d or ad_3d;

  end process;

  i8255_1E_pa(7) <= I_COIN1;
  i8255_1E_pa(6) <= I_COIN2;
  i8255_1E_pa(5) <= I_1P_CTRL(3); -- left
  i8255_1E_pa(4) <= I_1P_CTRL(2); -- right
  i8255_1E_pa(3) <= I_1P_CTRL(4); -- shoot1
  i8255_1E_pa(2) <= I_SERVICE;
  i8255_1E_pa(1) <= I_1P_CTRL(5); -- shoot2
  i8255_1E_pa(0) <= I_2P_CTRL(1); -- up

  i8255_1E_pb(7) <= I_1P_CTRL(6); -- start
  i8255_1E_pb(6) <= I_2P_CTRL(6); -- start
  i8255_1E_pb(5) <= I_2P_CTRL(3); -- left
  i8255_1E_pb(4) <= I_2P_CTRL(2); -- right
  i8255_1E_pb(3) <= I_2P_CTRL(4); -- shoot1
  i8255_1E_pb(2) <= I_2P_CTRL(5); -- shoot2
  i8255_1E_pb(1) <= I_DIP(1);
  i8255_1E_pb(0) <= I_DIP(2);

  i8255_1E_pc(7) <= net_1e10_i;
  i8255_1E_pc(6) <= I_1P_CTRL(0); -- down
  i8255_1E_pc(5) <= net_1e12_i;
  i8255_1E_pc(4) <= I_1P_CTRL(1); -- up
  i8255_1E_pc(3) <= I_DIP(3);
  i8255_1E_pc(2) <= I_DIP(4);
  i8255_1E_pc(1) <= I_DIP(5);
  i8255_1E_pc(0) <= I_2P_CTRL(0); -- down
  O_COIN_COUNTER <= not I_IOPC7; -- open drain actually

  --
  -- PIA CHIPS
  --
  u_i8255_1D : entity work.I82C55 -- bus interface
    port map (
      I_ADDR            => i8255_addr,
      I_DATA            => I_DATA,
      O_DATA            => i8255_1D_data,
      O_DATA_OE_L       => i8255_1D_data_oe_l,

      I_CS_L            => i8255_1D_cs_l,
      I_RD_L            => I_RD_L,
      I_WR_L            => I_WR_L,

      I_PA              => i8255_1D_pa_out,
      O_PA              => i8255_1D_pa_out,
      O_PA_OE_L         => open,

      I_PB              => i8255_1D_pb_out,
      O_PB              => i8255_1D_pb_out,
      O_PB_OE_L         => open,

      I_PC              => xbo,
      O_PC              => xb,
      O_PC_OE_L         => open,

      RESET             => reset,
      ENA               => ENA,
      CLK               => CLK
      );

  u_i8255_1E : entity work.I82C55 -- push button
    port map (
      I_ADDR            => i8255_addr,
      I_DATA            => I_DATA,
      O_DATA            => i8255_1E_data,
      O_DATA_OE_L       => i8255_1E_data_oe_l,

      I_CS_L            => i8255_1E_cs_l,
      I_RD_L            => I_RD_L,
      I_WR_L            => I_WR_L,

      I_PA              => i8255_1E_pa,
      O_PA              => open,
      O_PA_OE_L         => open,

      I_PB              => i8255_1E_pb,
      O_PB              => open,
      O_PB_OE_L         => open,

      I_PC              => i8255_1E_pc,
      O_PC              => open,
      O_PC_OE_L         => open,

      RESET             => reset,
      ENA               => ENA,
      CLK               => CLK
      );

  p_i8255_1d_bus_control : process(i8255_1D_pa_out, i8255_1D_pb_out, ym2149_3D_ioa_out, ym2149_3D_ioa_oe_l)
  begin
    if (ym2149_3D_ioa_oe_l = '0') then
      i8255_1D_pa_in   <= ym2149_3D_ioa_out;
      ym2149_3D_ioa_in <= ym2149_3D_ioa_out;
    else
      i8255_1D_pa_in   <= i8255_1D_pa_out;
      ym2149_3D_ioa_in <= i8255_1D_pa_out;
    end if;

    ampm <= i8255_1D_pb_out(4); -- amp mute
    sint <= i8255_1D_pb_out(3); -- set int
  end process;

  p_drive_cpubus : process(i8255_1D_data, i8255_1D_data_oe_l, i8255_1E_data, i8255_1E_data_oe_l)
  begin
    O_DATA_OE_L <= '1';
    O_DATA      <= (others => '0');
    --
    if    (i8255_1D_data_oe_l = '0') then
      --
      O_DATA_OE_L <= '0';
      O_DATA      <= i8255_1D_data;
    elsif (i8255_1E_data_oe_l = '0') then
      --
      O_DATA_OE_L <= '0';
      O_DATA      <= i8255_1E_data;
    end if;
  end process;
  --
  -- AUDIO CHIPS
  --
  p_audio_clockgen : process
  begin
    wait until rising_edge(CLK);
    if (ENA_1_79 = '1') then
      audio_div_cnt <= audio_div_cnt - "1";
      ls90_clk <= not audio_div_cnt(8);

      if (audio_div_cnt(8 downto 0) = "000000000") then
        if (ls90_cnt = x"9") then
          ls90_cnt <= x"0";
        else
          ls90_cnt <= ls90_cnt + "1";
        end if;
      end if;

      ls90_op <= "0000";
      case ls90_cnt is --ls90 outputs DCBA
        when x"0" => ls90_op <= "0000";
        when x"1" => ls90_op <= "0010";
        when x"2" => ls90_op <= "0100";
        when x"3" => ls90_op <= "0110";
        when x"4" => ls90_op <= "1000";
        when x"5" => ls90_op <= "0001";
        when x"6" => ls90_op <= "0011";
        when x"7" => ls90_op <= "0101";
        when x"8" => ls90_op <= "0111";
        when x"9" => ls90_op <= "1001";
        when others => ls90_op <= "0000";
      end case;
    end if;
  end process;

  p_ym2149_3d_iob_in : process(I_HWSEL_FROGGER, ls90_op, ls90_clk)
  begin
    if not I_HWSEL_FROGGER then
      ym2149_3D_iob_in <= ls90_op(0) & ls90_op(3) & ls90_op(2) & ls90_clk & "1110";
    else
      ym2149_3D_iob_in <= ls90_op(0) & ls90_op(3) & '1' & ls90_clk & ls90_op(2) & "110";
    end if;
  end process;

  u_ym2149_3C : entity work.YM2149 -- not used for frogger
  port map (
    -- data bus
    I_DA                => cpu_data_out,
    O_DA                => ym2149_3C_dv,
    O_DA_OE_L           => ym2149_3C_oe_l,
    -- control
    I_A9_L              => '0',
    I_A8                => '1',
    I_BDIR              => ym2149_3C_bdir,
    I_BC2               => ym2149_3C_bc2,
    I_BC1               => ym2149_3C_bc1,
    I_SEL_L             => '1',

    O_AUDIO             => ym2149_3C_audio,
    O_CHAN              => ym2149_3C_chan,
    -- port a
    I_IOA               => "11111111",
    O_IOA               => open,
    O_IOA_OE_L          => open,
    -- port b
    I_IOB               => "11111111",
    O_IOB               => open,
    O_IOB_OE_L          => open,

    ENA                 => ENA_1_79,
    RESET_L             => I_RESET_L,
    CLK                 => CLK
    );

  u_ym2149_3D : entity work.YM2149
  port map (
    -- data bus
    I_DA                => cpu_data_out,
    O_DA                => ym2149_3D_dv,
    O_DA_OE_L           => ym2149_3D_oe_l,
    -- control
    I_A9_L              => '0',
    I_A8                => '1',
    I_BDIR              => ym2149_3D_bdir,
    I_BC2               => ym2149_3D_bc2,
    I_BC1               => ym2149_3D_bc1,
    I_SEL_L             => '1',

    O_AUDIO             => ym2149_3D_audio,
    O_CHAN              => ym2149_3D_chan,
    -- port a
    I_IOA               => ym2149_3D_ioa_in,
    O_IOA               => ym2149_3D_ioa_out,
    O_IOA_OE_L          => ym2149_3D_ioa_oe_l,
    -- port b
    I_IOB               => ym2149_3D_iob_in,
    O_IOB               => open,
    O_IOB_OE_L          => open,

    ENA                 => ENA_1_79,
    RESET_L             => I_RESET_L,
    CLK                 => CLK
    );

  p_filter_coef : process
  begin
    wait until rising_edge(CLK);
    if (ENA_1_79 = '1') then
      case ym2149_3C_chan is -- -1 as reg here
        when "00" => -- chan 3
          ym2149_3C_k <= (others => '0');
        when "11" => -- chan 2
          ym2149_3C_k <= K_FILTER(conv_integer(filter_reg(5 downto 4)));
        when "10" => -- chan 1
          ym2149_3C_k <= K_FILTER(conv_integer(filter_reg(3 downto 2)));
        when "01" => -- chan 0
          ym2149_3C_k <= K_FILTER(conv_integer(filter_reg(1 downto 0)));
        when others => null;
      end case;

      case ym2149_3D_chan is -- -1 as reg here
        when "00" => -- chan 3
          ym2149_3D_k <= (others => '0');
        when "11" => -- chan 2
          ym2149_3D_k <= K_FILTER(conv_integer(filter_reg(11 downto 10)));
        when "10" => -- chan 1
          ym2149_3D_k <= K_FILTER(conv_integer(filter_reg( 9 downto  8)));
        when "01" => -- chan 0
          ym2149_3D_k <= K_FILTER(conv_integer(filter_reg( 7 downto  6)));
        when others => null;
      end case;
    end if;
  end process;


  p_ym2149_audio_process : process(ym2149_3C_audio, ym2149_3C_audio_pipe, ym2149_3D_audio, ym2149_3D_audio_pipe)
  begin
    audio_in_m_out_3C <= (('0' & ym2149_3C_audio & "000000000"))- ym2149_3C_audio_pipe(3); -- signed
    audio_in_m_out_3D <= (('0' & ym2149_3D_audio & "000000000"))- ym2149_3D_audio_pipe(3); -- signed
  end process;

  mult_3C : MULT18X18
      port map
      (
        P => audio_mult_3C,-- 35..0 -- audio 8bit on 32..25 33 sign bit,
        A => audio_in_m_out_3C, --17..0
        B(17)           => '0',
        B(16 downto  0) => ym2149_3C_k
      );

  mult_3D : MULT18X18
      port map
      (
        P => audio_mult_3D,-- 35..0 -- audio 8bit on 32..25 33 sign bit,
        A => audio_in_m_out_3D, --17..0
        B(17)           => '0',
        B(16 downto  0) => ym2149_3D_k
      );

  p_ym2149_audio_pipe : process(I_RESET_L, CLK)
  begin
    if (I_RESET_L = '0') then
      ym2149_3C_audio_pipe <= (others => (others => '0'));
      ym2149_3D_audio_pipe <= (others => (others => '0'));
    elsif rising_edge(CLK) then
--      audio_mult_3C <= audio_in_m_out_3C * ym2149_3C_k;
--      audio_mult_3D <= audio_in_m_out_3D * ym2149_3D_k;
      if (ENA_1_79 = '1') then
        -- we need some holding registers anyway, so lets just make it a shift and save a mux
        ym2149_3C_audio_pipe(3 downto 1) <= ym2149_3C_audio_pipe(2 downto 0);
        ym2149_3C_audio_pipe(0)          <= audio_mult_3C(33 downto 16) + ym2149_3C_audio_pipe(3); -- bit 33 sign

        ym2149_3D_audio_pipe(3 downto 1) <= ym2149_3D_audio_pipe(2 downto 0);
        ym2149_3D_audio_pipe(0)          <= audio_mult_3D(33 downto 16) + ym2149_3D_audio_pipe(3); -- bit 33 sign
      end if;
    end if;
  end process;

  p_ym2149_audio_mix : process
  begin
    wait until rising_edge(CLK);
    if (ENA_1_79 = '1') then
      ym2149_3C_chan_t1 <= ym2149_3C_chan;
      ym2149_3D_chan_t1 <= ym2149_3D_chan;

      if (ym2149_3C_chan_t1 = "11") then
        audio_3C_mix   <= (others => '0');
        audio_3C_final <= audio_3C_mix;
      else
        audio_3C_mix   <= audio_3C_mix + ("00" & ym2149_3C_audio_pipe(0)(16 downto 9));
      end if;

      if (ym2149_3D_chan_t1(1 downto 0) = "11") then
        audio_3D_mix   <= (others => '0');
        audio_3D_final <= audio_3D_mix;
      else
        audio_3D_mix   <= audio_3D_mix + ("00" & ym2149_3D_audio_pipe(0)(16 downto 9));
      end if;

      audio_final <= ('0' & audio_3C_final) + ('0' & audio_3D_final);
    end if;
  end process;

  p_audio_out : process(CLK, I_RESET_L)
  begin
    if (I_RESET_L = '0') then
      O_AUDIO <= (others => '0');
    elsif rising_edge(CLK) then
      if (ENA_1_79 = '1') then
        if (ampm = '1') then
          O_AUDIO <= (others => '0');
        else
          if (audio_final(10) = '1') then
            O_AUDIO <= (others => '1');
          else
            O_AUDIO <= audio_final(9 downto 0);
          end if;
        end if;
      end if;
    end if;
  end process;

  p_security_6J : process(xb)
  begin
    -- chip K10A PAL16L8
    -- equations from Mark @ http://www.leopardcats.com/
    xbo(3 downto 0) <= xb(3 downto 0);
    xbo(4) <= not(xb(0) or xb(1) or xb(2) or xb(3));
    xbo(5) <= not((not xb(2) and not xb(0)) or (not xb(2) and not xb(1)) or (not xb(3) and not xb(0)) or (not xb(3) and not xb(1)));

    xbo(6) <= not(not xb(0) and not xb(3));
    xbo(7) <= not((not xb(1)) or xb(2));
  end process;

  p_security_count : process(CLK, I_RESET_L)
  begin
  if (I_RESET_L = '0') then
    security_count <= "000";
  elsif rising_edge(CLK) then
    rd_l_t1 <= i_rd_l;
    if (I_ADDR = x"8102") and (I_RD_L = '0') and (rd_l_t1 = '1') then
      security_count <= security_count + "1";
    end if;
  end if;
  end process;

  p_security_2B : process(security_count)
  begin
    -- I am not sure what this chip does yet, but this gets us past the initial check for now.
    case security_count is
      when "000" => net_1e10_i <= '0'; net_1e12_i <= '1';
      when "001" => net_1e10_i <= '0'; net_1e12_i <= '1';
      when "010" => net_1e10_i <= '1'; net_1e12_i <= '0';
      when "011" => net_1e10_i <= '1'; net_1e12_i <= '1';
      when "100" => net_1e10_i <= '1'; net_1e12_i <= '1';
      when "101" => net_1e10_i <= '1'; net_1e12_i <= '1';
      when "110" => net_1e10_i <= '1'; net_1e12_i <= '1';
      when "111" => net_1e10_i <= '1'; net_1e12_i <= '1';
      when others => null;
    end case;
  end process;

end RTL;
