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

library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

entity I82C55 is
  port (

    I_ADDR            : in    std_logic_vector(1 downto 0); -- A1-A0
    I_DATA            : in    std_logic_vector(7 downto 0); -- D7-D0
    O_DATA            : out   std_logic_vector(7 downto 0);
    O_DATA_OE_L       : out   std_logic;

    I_CS_L            : in    std_logic;
    I_RD_L            : in    std_logic;
    I_WR_L            : in    std_logic;

    I_PA              : in    std_logic_vector(7 downto 0);
    O_PA              : out   std_logic_vector(7 downto 0);
    O_PA_OE_L         : out   std_logic_vector(7 downto 0);

    I_PB              : in    std_logic_vector(7 downto 0);
    O_PB              : out   std_logic_vector(7 downto 0);
    O_PB_OE_L         : out   std_logic_vector(7 downto 0);

    I_PC              : in    std_logic_vector(7 downto 0);
    O_PC              : out   std_logic_vector(7 downto 0);
    O_PC_OE_L         : out   std_logic_vector(7 downto 0);

    RESET             : in    std_logic;
    ENA               : in    std_logic; -- (CPU) clk enable
    CLK               : in    std_logic
    );
end;

architecture RTL of I82C55 is

  -- registers
  signal bit_mask          : std_logic_vector(7 downto 0);
  signal r_porta           : std_logic_vector(7 downto 0);
  signal r_portb           : std_logic_vector(7 downto 0);
  signal r_portc           : std_logic_vector(7 downto 0);
  signal r_control         : std_logic_vector(7 downto 0);
  --
  signal porta_we          : std_logic;
  signal portb_we          : std_logic;
  signal porta_re          : std_logic;
  signal portb_re          : std_logic;
  --
  signal porta_we_t1       : std_logic;
  signal portb_we_t1       : std_logic;
  signal porta_re_t1       : std_logic;
  signal portb_re_t1       : std_logic;
  --
  signal porta_we_rising   : boolean;
  signal portb_we_rising   : boolean;
  signal porta_re_rising   : boolean;
  signal portb_re_rising   : boolean;
  --
  signal groupa_mode       : std_logic_vector(1 downto 0); -- port a/c upper
  signal groupb_mode       : std_logic;                    -- port b/c lower
  --
  signal porta_read        : std_logic_vector(7 downto 0);
  signal portb_read        : std_logic_vector(7 downto 0);
  signal portc_read        : std_logic_vector(7 downto 0);
  signal control_read      : std_logic_vector(7 downto 0);
  signal mode_clear        : std_logic;
  --
  signal a_inte1           : std_logic;
  signal a_inte2           : std_logic;
  signal b_inte            : std_logic;
  --
  signal a_intr            : std_logic;
  signal a_obf_l           : std_logic;
  signal a_ibf             : std_logic;
  signal a_ack_l           : std_logic;
  signal a_stb_l           : std_logic;
  signal a_ack_l_t1        : std_logic;
  signal a_stb_l_t1        : std_logic;
  --
  signal b_intr            : std_logic;
  signal b_obf_l           : std_logic;
  signal b_ibf             : std_logic;
  signal b_ack_l           : std_logic;
  signal b_stb_l           : std_logic;
  signal b_ack_l_t1        : std_logic;
  signal b_stb_l_t1        : std_logic;
  --
  signal a_ack_l_rising    : boolean;
  signal a_stb_l_rising    : boolean;
  signal b_ack_l_rising    : boolean;
  signal b_stb_l_rising    : boolean;
  --
  signal porta_ipreg       : std_logic_vector(7 downto 0);
  signal portb_ipreg       : std_logic_vector(7 downto 0);
begin
  --
  -- mode 0   - basic input/output
  -- mode 1   - strobed input/output
  -- mode 2/3 - bi-directional bus
  --
  -- control word (write)
  --
  -- D7    mode set flag        1 = active
  -- D6..5 GROUPA mode selection (mode 0,1,2)
  -- D4    GROUPA porta         1 = input, 0 = output
  -- D3    GROUPA portc upper   1 = input, 0 = output
  -- D2    GROUPB mode selection (mode 0 ,1)
  -- D1    GROUPB portb         1 = input, 0 = output
  -- D0    GROUPB portc lower   1 = input, 0 = output
  --
  -- D7    bit set/reset        0 = active
  -- D6..4 x
  -- D3..1 bit select
  -- d0    1 = set, 0 - reset
  --
  -- all output registers including status are reset when mode is changed
    --1. Port A:
    --All Modes: Output data is cleared, input data is not cleared.

    --2. Port B:
    --Mode 0: Output data is cleared, input data is not cleared.
    --Mode 1 and 2: Both output and input data are cleared.

    --3. Port C:
    --Mode 0:Output data is cleared, input data is not cleared.
    --Mode 1 and 2: IBF and INTR are cleared and OBF# is set.
    --Outputs in Port C which are not used for handshaking or interrupt signals are cleared.
    --Inputs such as STB#, ACK#, or "spare" inputs are not affected. The interrupts for Ports A and B are disabled.

  p_bit_mask : process(I_DATA)
  begin
    bit_mask <= x"01";
    case I_DATA(3 downto 1) is
      when "000" => bit_mask <= x"01";
      when "001" => bit_mask <= x"02";
      when "010" => bit_mask <= x"04";
      when "011" => bit_mask <= x"08";
      when "100" => bit_mask <= x"10";
      when "101" => bit_mask <= x"20";
      when "110" => bit_mask <= x"40";
      when "111" => bit_mask <= x"80";
      when others => null;
    end case;
  end process;

  p_write_reg_reset : process(RESET, CLK)
    variable r_portc_masked : std_logic_vector(7 downto 0);
    variable r_portc_setclr : std_logic_vector(7 downto 0);
  begin
    if (RESET = '1') then
      r_porta <= x"00";
      r_portb <= x"00";
      r_portc <= x"00";
      r_control <= x"9B"; -- 10011011
      mode_clear <= '1';
    elsif rising_edge(CLK) then

      r_portc_masked := (not bit_mask) and r_portc;
      for i in 0 to 7 loop
        r_portc_setclr(i) := bit_mask(i) and I_DATA(0);
      end loop;

      if (ENA = '1') then
        mode_clear <= '0';
        if (I_CS_L = '0') and (I_WR_L = '0') then
          case I_ADDR is
            when "00" => r_porta   <= I_DATA;
            when "01" => r_portb   <= I_DATA;
            when "10" => r_portc   <= I_DATA;

            when "11" => if (I_DATA(7) = '0') then -- set/clr
                           r_portc <= r_portc_masked or r_portc_setclr;
                         else
                           --mode_clear <= '1';
                           --r_porta    <= x"00";
                           --r_portb    <= x"00"; -- clear port b input reg
                           --r_portc    <= x"00"; -- clear control sigs
                           r_control  <= I_DATA; -- load new mode
                         end if;
            when others => null;
          end case;
        end if;
      end if;
    end if;
  end process;

  p_decode_control : process(r_control)
  begin
    groupa_mode <= r_control(6 downto 5);
    groupb_mode <= r_control(2);
  end process;

  p_oe : process(I_CS_L, I_RD_L)
  begin
    O_DATA_OE_L <= '1';
    if (I_CS_L = '0') and (I_RD_L = '0') then
      O_DATA_OE_L <= '0';
    end if;
  end process;

  p_read : process(I_ADDR, porta_read, portb_read, portc_read, control_read)
  begin
    O_DATA <= x"00"; -- default
    --if (I_CS_L = '0') and (I_RD_L = '0') then -- not required
      case I_ADDR is
        when "00" => O_DATA <= porta_read;
        when "01" => O_DATA <= portb_read;
        when "10" => O_DATA <= portc_read;
        when "11" => O_DATA <= control_read;
        when others => null;
      end case;
    --end if;
  end process;
  control_read(7) <= '1'; -- always 1
  control_read(6 downto 0) <= r_control(6 downto 0);

  p_rw_control : process(I_CS_L, I_RD_L, I_WR_L, I_ADDR)
  begin
    porta_we <= '0';
    portb_we <= '0';
    porta_re <= '0';
    portb_re <= '0';

    if (I_CS_L = '0') and (I_ADDR = "00") then
      porta_we <= not I_WR_L;
      porta_re <= not I_RD_L;
    end if;

    if (I_CS_L = '0') and (I_ADDR = "01") then
      portb_we <= not I_WR_L;
      portb_re <= not I_RD_L;
    end if;
  end process;

  p_rw_control_reg : process
  begin
    wait until rising_edge(CLK);
    if (ENA = '1') then
      porta_we_t1 <= porta_we;
      portb_we_t1 <= portb_we;
      porta_re_t1 <= porta_re;
      portb_re_t1 <= portb_re;

      a_stb_l_t1 <= a_stb_l;
      a_ack_l_t1 <= a_ack_l;
      b_stb_l_t1 <= b_stb_l;
      b_ack_l_t1 <= b_ack_l;
    end if;
  end process;

  porta_we_rising <= (porta_we = '0') and (porta_we_t1 = '1'); -- falling as inverted
  portb_we_rising <= (portb_we = '0') and (portb_we_t1 = '1'); --  "
  porta_re_rising <= (porta_re = '0') and (porta_re_t1 = '1'); -- falling as inverted
  portb_re_rising <= (portb_re = '0') and (portb_re_t1 = '1'); --  "
  --
  a_stb_l_rising  <= (a_stb_l = '1') and (a_stb_l_t1 = '0');
  a_ack_l_rising  <= (a_ack_l = '1') and (a_ack_l_t1 = '0');
  b_stb_l_rising  <= (b_stb_l = '1') and (b_stb_l_t1 = '0');
  b_ack_l_rising  <= (b_ack_l = '1') and (b_ack_l_t1 = '0');
  --
  -- GROUP A
  -- in mode 1
  --
  -- d4=1 (porta = input)
  --   pc7,6 io (d3=1 input, d3=0 output)
  --   pc5 output a_ibf
  --   pc4 input  a_stb_l
  --   pc3 output a_intr
  --
  -- d4=0 (porta = output)
  --   pc7 output a_obf_l
  --   pc6 input  a_ack_l
  --   pc5,4 io (d3=1 input, d3=0 output)
  --   pc3 output a_intr
  --
  -- GROUP B
  -- in mode 1
  -- d1=1 (portb = input)
  --   pc2 input  b_stb_l
  --   pc1 output b_ibf
  --   pc0 output b_intr
  --
  -- d1=0 (portb = output)
  --   pc2 input  b_ack_l
  --   pc1 output b_obf_l
  --   pc0 output b_intr


  -- WHEN AN INPUT
  --
  -- stb_l a low on this input latches input data
  -- ibf   a high on this output indicates data latched. set by stb_l and reset by rising edge of RD_L
  -- intr  a high on this output indicates interrupt. set by stb_l high, ibf high and inte high. reset by falling edge of RD_L
  -- inte A controlled by bit/set PC4
  -- inte B controlled by bit/set PC2

  -- WHEN AN OUTPUT
  --
  -- obf_l output will go low when cpu has written data
  -- ack_l input - a low on this clears obf_l
  -- intr  output set when ack_l is high, obf_l is high and inte is one. reset by falling edge of WR_L
  -- inte A controlled by bit/set PC6
  -- inte B controlled by bit/set PC2

  -- GROUP A
  -- in mode 2
  --
  -- porta = IO
  --
  --  control bits 2..0 still control groupb/c lower 2..0
  --
  --
  --  PC7 output a_obf
  --  PC6 input  a_ack_l
  --  PC5 output a_ibf
  --  PC4 input  a_stb_l
  --  PC3 is still interrupt out
  p_control_flags : process(RESET, CLK)
    variable we   : boolean;
    variable set1 : boolean;
    variable set2 : boolean;
  begin
    if (RESET = '1') then
      a_obf_l <= '1';
      a_inte1 <= '0';
      a_ibf   <= '0';
      a_inte2 <= '0';
      a_intr  <= '0';
      --
      b_inte  <= '0';
      b_obf_l <= '1';
      b_ibf   <= '0';
      b_intr  <= '0';
    elsif rising_edge(CLK) then
      we := (I_CS_L = '0') and (I_WR_L = '0') and (I_ADDR = "11") and (I_DATA(7) = '0');

      if (ENA = '1') then
        if (mode_clear = '1') then
          a_obf_l <= '1';
          a_inte1 <= '0';
          a_ibf   <= '0';
          a_inte2 <= '0';
          a_intr  <= '0';
          --
          b_inte  <= '0';
          b_obf_l <= '1';
          b_ibf   <= '0';
          b_intr  <= '0';
        else
          if (bit_mask(7) = '1') and we then
            a_obf_l <= I_DATA(0);
          else
            if porta_we_rising then
              a_obf_l <= '0';
            elsif (a_ack_l = '0') then
              a_obf_l <= '1';
            end if;
          end if;
          --
          if (bit_mask(6) = '1') and we then a_inte1 <= I_DATA(0); end if; -- bus set when mode1 & input?
          --
          if (bit_mask(5) = '1') and we then
            a_ibf   <= I_DATA(0);
          else
            if porta_re_rising then
              a_ibf <= '0';
            elsif (a_stb_l = '0') then
              a_ibf <= '1';
            end if;
          end if;
          --
          if (bit_mask(4) = '1') and we then a_inte2 <= I_DATA(0); end if; -- bus set when mode1 & output?
          --
          set1 := a_ack_l_rising and (a_obf_l = '1') and (a_inte1 = '1');
          set2 := a_stb_l_rising and (a_ibf   = '1') and (a_inte2 = '1');
          --
          if (bit_mask(3) = '1') and we then
            a_intr  <= I_DATA(0);
          else
            if (groupa_mode(1) = '1') then
              if (porta_we = '1') or (porta_re = '1') then
                 a_intr <= '0';
               elsif set1 or set2 then
                 a_intr <= '1';
               end if;
            else
              if    (r_control(4) = '0') then -- output
                if (porta_we = '1') then -- falling ?
                  a_intr <= '0';
                elsif set1 then
                  a_intr <= '1';
                end if;
              elsif (r_control(4) = '1') then -- input
                if (porta_re = '1') then -- falling ?
                  a_intr <= '0';
                elsif set2 then
                  a_intr <= '1';
                end if;
              end if;
            end if;
          end if;
          --
          if (bit_mask(2) = '1') and we then b_inte  <= I_DATA(0); end if; -- bus set?

          if (bit_mask(1) = '1') and we then
            b_obf_l <= I_DATA(0);
          else
            if (r_control(1) = '0') then -- output
              if portb_we_rising then
                b_obf_l <= '0';
              elsif (b_ack_l = '0') then
                b_obf_l <= '1';
              end if;
            else
              if portb_re_rising then
                b_ibf <= '0';
              elsif (b_stb_l = '0') then
                b_ibf <= '1';
              end if;
            end if;
          end if;

          if (bit_mask(0) = '1') and we then
            b_intr  <= I_DATA(0);
          else
            if (r_control(1) = '0') then -- output
              if (portb_we = '1') then -- falling ?
                b_intr <= '0';
              elsif b_ack_l_rising and (b_obf_l = '1') and (b_inte = '1') then
                b_intr <= '1';
              end if;
            else
              if (portb_re = '1') then -- falling ?
                b_intr <= '0';
              elsif b_stb_l_rising and (b_ibf = '1') and (b_inte = '1') then
                b_intr <= '1';
              end if;
            end if;
          end if;

        end if;
      end if;
    end if;
  end process;

  p_porta : process(r_control, groupa_mode, r_porta, I_PA, porta_ipreg, a_ack_l)
  begin
    -- D4    GROUPA porta         1 = input, 0 = output
    O_PA       <= x"FF"; -- if not driven, float high
    O_PA_OE_L  <= x"FF";
    porta_read <= x"00";

    if    (groupa_mode = "00") then -- simple io
      if (r_control(4) = '0') then -- output
        O_PA       <= r_porta;
        O_PA_OE_L  <= x"00";
      end if;
      porta_read <= I_PA;
    elsif (groupa_mode = "01") then -- strobed
      if (r_control(4) = '0') then -- output
        O_PA       <= r_porta;
        O_PA_OE_L  <= x"00";
      end if;
      porta_read <= porta_ipreg;
    else -- if (groupa_mode(1) = '1') then -- bi dir
      if (a_ack_l = '0') then -- output enable
        O_PA       <= r_porta;
        O_PA_OE_L  <= x"00";
      end if;
      porta_read <= porta_ipreg; -- latched data
    end if;

  end process;

  p_portb : process(r_control, groupb_mode, r_portb, I_PB, portb_ipreg)
  begin
    O_PB       <= x"FF"; -- if not driven, float high
    O_PB_OE_L  <= x"FF";
    portb_read <= x"00";

    if (groupb_mode = '0') then -- simple io
      if (r_control(1) = '0') then -- output
        O_PB       <= r_portb;
        O_PB_OE_L  <= x"00";
      end if;
      portb_read <= I_PB;
    else -- strobed mode
      if (r_control(1) = '0') then -- output
        O_PB       <= r_portb;
        O_PB_OE_L  <= x"00";
      end if;
      portb_read <= portb_ipreg;
    end if;
  end process;

  p_portc_out : process(r_portc, r_control, groupa_mode, groupb_mode,
                        a_obf_l, a_ibf, a_intr,b_obf_l, b_ibf, b_intr)
  begin
    O_PC       <= x"FF"; -- if not driven, float high
    O_PC_OE_L  <= x"FF";

    -- bits 7..4
    if    (groupa_mode = "00") then -- simple io
      if (r_control(3) = '0') then -- output
        O_PC     (7 downto 4)  <= r_portc(7 downto 4);
        O_PC_OE_L(7 downto 4)  <= x"0";
      end if;
    elsif (groupa_mode = "01") then -- mode1

      if (r_control(4) = '0') then -- port a output
        O_PC     (7) <= a_obf_l;
        O_PC_OE_L(7) <= '0';
        -- 6 is ack_l input
        if (r_control(3) = '0') then -- port c output
          O_PC     (5 downto 4) <= r_portc(5 downto 4);
          O_PC_OE_L(5 downto 4) <= "00";
        end if;
      else -- port a input
        if (r_control(3) = '0') then -- port c output
          O_PC     (7 downto 6) <= r_portc(7 downto 6);
          O_PC_OE_L(7 downto 6) <= "00";
        end if;
        O_PC     (5) <= a_ibf;
        O_PC_OE_L(5) <= '0';
        -- 4 is stb_l input
      end if;

    else -- if (groupa_mode(1) = '1') then -- mode2
      O_PC     (7) <= a_obf_l;
      O_PC_OE_L(7) <= '0';
      -- 6 is ack_l input
      O_PC     (5) <= a_ibf;
      O_PC_OE_L(5) <= '0';
      -- 4 is stb_l input
    end if;

    -- bit 3 (controlled by group a)
    if    (groupa_mode = "00") then -- group a steals this bit
      --if (groupb_mode = '0') then -- we will let bit 3 be driven, data sheet is a bit confused about this
        if (r_control(0) = '0') then -- ouput (note, groupb control bit)
          O_PC     (3) <= r_portc(3);
          O_PC_OE_L(3) <= '0';
        end if;
      --
    else -- stolen
      O_PC     (3) <= a_intr;
      O_PC_OE_L(3) <= '0';
    end if;

    -- bits 2..0
    if    (groupb_mode = '0') then -- simple io
      if (r_control(0) = '0') then -- output
        O_PC     (2 downto 0)  <= r_portc(2 downto 0);
        O_PC_OE_L(2 downto 0)  <= "000";
      end if;
    else
      -- mode 1
      -- 2 is input
      if (r_control(1) = '0') then -- output
        O_PC     (1) <= b_obf_l;
        O_PC_OE_L(1) <= '0';
      else -- input
        O_PC     (1) <= b_ibf;
        O_PC_OE_L(1) <= '0';
      end if;
      O_PC     (0) <= b_intr;
      O_PC_OE_L(0) <= '0';
    end if;
  end process;

  p_portc_in : process(r_portc, I_PC, r_control, groupa_mode, groupb_mode, a_ibf, b_obf_l,
                       a_obf_l, a_inte1, a_inte2, a_intr, b_inte, b_ibf, b_intr)
  begin
    portc_read <= x"00";

    a_stb_l <= '1';
    a_ack_l <= '1';
    b_stb_l <= '1';
    b_ack_l <= '1';

    if    (groupa_mode = "01") then -- mode1 or 2
      if (r_control(4) = '0') then -- port a output
        a_ack_l <= I_PC(6);
      else -- port a input
        a_stb_l <= I_PC(4);
      end if;
    elsif (groupa_mode(1) = '1') then -- mode 2
      a_ack_l <= I_PC(6);
      a_stb_l <= I_PC(4);
    end if;

    if (groupb_mode = '1') then
      if (r_control(1) = '0') then -- output
        b_ack_l <= I_PC(2);
      else -- input
        b_stb_l <= I_PC(2);
      end if;
    end if;

    if    (groupa_mode = "00") then -- simple io
      portc_read(7 downto 3) <= I_PC(7 downto 3);
    elsif (groupa_mode = "01") then
      if (r_control(4) = '0') then -- port a output
        portc_read(7 downto 3) <= a_obf_l & a_inte1 & I_PC(5 downto 4) & a_intr;
      else -- input
        portc_read(7 downto 3) <= I_PC(7 downto 6) & a_ibf & a_inte2 & a_intr;
      end if;
    else -- mode 2
      portc_read(7 downto 3) <= a_obf_l & a_inte1 & a_ibf & a_inte2 & a_intr;
    end if;

    if    (groupb_mode = '0') then -- simple io
      portc_read(2 downto 0) <= I_PC(2 downto 0);
    else
      if (r_control(1) = '0') then -- output
        portc_read(2 downto 0) <= b_inte & b_obf_l & b_intr;
      else -- input
        portc_read(2 downto 0) <= b_inte & b_ibf   & b_intr;
      end if;
    end if;
  end process;

  p_ipreg : process
  begin
    wait until rising_edge(CLK);
    --   pc4 input  a_stb_l
    --   pc2 input  b_stb_l

    if (ENA = '1') then
      if (a_stb_l = '0') then
        porta_ipreg <= I_PA;
      end if;

      if (mode_clear = '1') then
        portb_ipreg <= (others => '0');
      elsif (b_stb_l = '0') then
        portb_ipreg <= I_PB;
      end if;
    end if;
  end process;

end architecture RTL;
