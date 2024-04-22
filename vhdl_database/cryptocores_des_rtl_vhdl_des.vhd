-- ======================================================================
-- DES encryption/decryption
-- algorithm according to FIPS 46-3 specification
-- Copyright (C) 2007 Torsten Meissner
-------------------------------------------------------------------------
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-- ======================================================================


library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use work.des_pkg.all;



entity des is
  generic (
    design_type : string := "ITER"
  );
  port (
    reset_i     : in  std_logic;                  -- async reset
    clk_i       : in  std_logic;                  -- clock
    mode_i      : in  std_logic;                  -- des-modus: 0 = encrypt, 1 = decrypt
    key_i       : in  std_logic_vector(0 to 63);  -- key input
    data_i      : in  std_logic_vector(0 to 63);  -- data input
    valid_i     : in  std_logic;                  -- input key/data valid
    accept_o    : out std_logic;                  -- input accept
    data_o      : out std_logic_vector(0 to 63);  -- data output
    valid_o     : out std_logic;                  -- output data valid flag
    accept_i    : in  std_logic                   -- output accept
  );
end entity des;



architecture rtl of des is


begin


  PipeG : if design_type = "PIPE" generate

  begin

    crypt : process (clk_i, reset_i) is
      -- variables for key calculation
      variable c0  : std_logic_vector(0 to 27) := (others => '0');
      variable c1  : std_logic_vector(0 to 27) := (others => '0');
      variable c2  : std_logic_vector(0 to 27) := (others => '0');
      variable c3  : std_logic_vector(0 to 27) := (others => '0');
      variable c4  : std_logic_vector(0 to 27) := (others => '0');
      variable c5  : std_logic_vector(0 to 27) := (others => '0');
      variable c6  : std_logic_vector(0 to 27) := (others => '0');
      variable c7  : std_logic_vector(0 to 27) := (others => '0');
      variable c8  : std_logic_vector(0 to 27) := (others => '0');
      variable c9  : std_logic_vector(0 to 27) := (others => '0');
      variable c10 : std_logic_vector(0 to 27) := (others => '0');
      variable c11 : std_logic_vector(0 to 27) := (others => '0');
      variable c12 : std_logic_vector(0 to 27) := (others => '0');
      variable c13 : std_logic_vector(0 to 27) := (others => '0');
      variable c14 : std_logic_vector(0 to 27) := (others => '0');
      variable c15 : std_logic_vector(0 to 27) := (others => '0');
      variable c16 : std_logic_vector(0 to 27) := (others => '0');
      variable d0  : std_logic_vector(0 to 27) := (others => '0');
      variable d1  : std_logic_vector(0 to 27) := (others => '0');
      variable d2  : std_logic_vector(0 to 27) := (others => '0');
      variable d3  : std_logic_vector(0 to 27) := (others => '0');
      variable d4  : std_logic_vector(0 to 27) := (others => '0');
      variable d5  : std_logic_vector(0 to 27) := (others => '0');
      variable d6  : std_logic_vector(0 to 27) := (others => '0');
      variable d7  : std_logic_vector(0 to 27) := (others => '0');
      variable d8  : std_logic_vector(0 to 27) := (others => '0');
      variable d9  : std_logic_vector(0 to 27) := (others => '0');
      variable d10 : std_logic_vector(0 to 27) := (others => '0');
      variable d11 : std_logic_vector(0 to 27) := (others => '0');
      variable d12 : std_logic_vector(0 to 27) := (others => '0');
      variable d13 : std_logic_vector(0 to 27) := (others => '0');
      variable d14 : std_logic_vector(0 to 27) := (others => '0');
      variable d15 : std_logic_vector(0 to 27) := (others => '0');
      variable d16 : std_logic_vector(0 to 27) := (others => '0');
      -- key variables
      variable key1  : std_logic_vector(0 to 47) := (others => '0');
      variable key2  : std_logic_vector(0 to 47) := (others => '0');
      variable key3  : std_logic_vector(0 to 47) := (others => '0');
      variable key4  : std_logic_vector(0 to 47) := (others => '0');
      variable key5  : std_logic_vector(0 to 47) := (others => '0');
      variable key6  : std_logic_vector(0 to 47) := (others => '0');
      variable key7  : std_logic_vector(0 to 47) := (others => '0');
      variable key8  : std_logic_vector(0 to 47) := (others => '0');
      variable key9  : std_logic_vector(0 to 47) := (others => '0');
      variable key10 : std_logic_vector(0 to 47) := (others => '0');
      variable key11 : std_logic_vector(0 to 47) := (others => '0');
      variable key12 : std_logic_vector(0 to 47) := (others => '0');
      variable key13 : std_logic_vector(0 to 47) := (others => '0');
      variable key14 : std_logic_vector(0 to 47) := (others => '0');
      variable key15 : std_logic_vector(0 to 47) := (others => '0');
      variable key16 : std_logic_vector(0 to 47) := (others => '0');
      -- variables for left & right data blocks
      variable l0  : std_logic_vector( 0 to 31) := (others => '0');
      variable l1  : std_logic_vector( 0 to 31) := (others => '0');
      variable l2  : std_logic_vector( 0 to 31) := (others => '0');
      variable l3  : std_logic_vector( 0 to 31) := (others => '0');
      variable l4  : std_logic_vector( 0 to 31) := (others => '0');
      variable l5  : std_logic_vector( 0 to 31) := (others => '0');
      variable l6  : std_logic_vector( 0 to 31) := (others => '0');
      variable l7  : std_logic_vector( 0 to 31) := (others => '0');
      variable l8  : std_logic_vector( 0 to 31) := (others => '0');
      variable l9  : std_logic_vector( 0 to 31) := (others => '0');
      variable l10 : std_logic_vector( 0 to 31) := (others => '0');
      variable l11 : std_logic_vector( 0 to 31) := (others => '0');
      variable l12 : std_logic_vector( 0 to 31) := (others => '0');
      variable l13 : std_logic_vector( 0 to 31) := (others => '0');
      variable l14 : std_logic_vector( 0 to 31) := (others => '0');
      variable l15 : std_logic_vector( 0 to 31) := (others => '0');
      variable l16 : std_logic_vector( 0 to 31) := (others => '0');
      variable r0  : std_logic_vector( 0 to 31) := (others => '0');
      variable r1  : std_logic_vector( 0 to 31) := (others => '0');
      variable r2  : std_logic_vector( 0 to 31) := (others => '0');
      variable r3  : std_logic_vector( 0 to 31) := (others => '0');
      variable r4  : std_logic_vector( 0 to 31) := (others => '0');
      variable r5  : std_logic_vector( 0 to 31) := (others => '0');
      variable r6  : std_logic_vector( 0 to 31) := (others => '0');
      variable r7  : std_logic_vector( 0 to 31) := (others => '0');
      variable r8  : std_logic_vector( 0 to 31) := (others => '0');
      variable r9  : std_logic_vector( 0 to 31) := (others => '0');
      variable r10 : std_logic_vector( 0 to 31) := (others => '0');
      variable r11 : std_logic_vector( 0 to 31) := (others => '0');
      variable r12 : std_logic_vector( 0 to 31) := (others => '0');
      variable r13 : std_logic_vector( 0 to 31) := (others => '0');
      variable r14 : std_logic_vector( 0 to 31) := (others => '0');
      variable r15 : std_logic_vector( 0 to 31) := (others => '0');
      variable r16 : std_logic_vector( 0 to 31) := (others => '0');
      -- variables for mode & valid shift registers
      variable mode  : std_logic_vector(0 to 16) := (others => '0');
      variable valid : std_logic_vector(0 to 17) := (others => '0');
    begin
      if(reset_i = '0') then
        data_o  <= (others => '0');
        valid_o <= '0';
      elsif rising_edge( clk_i ) then
        -- shift registers
        valid(1 to 17) := valid(0 to 16);
        valid(0) := valid_i;
        mode(1 to 16) := mode(0 to 15);
        mode(0)  := mode_i;
        -- output stage
        accept_o <= '1';
        valid_o  <= valid(17);
        data_o   <= ipn( ( r16 & l16 ) );
        -- 16. stage
        if mode(16) = '0' then
          c16 := c15(1 to 27) & c15(0);
          d16 := d15(1 to 27) & d15(0);
        else
          c16 := c15(27) & c15(0 to 26);
          d16 := d15(27) & d15(0 to 26);
        end if;
        key16 := pc2( ( c16 & d16 ) );
        l16 := r15;
        r16 := l15 xor ( f( r15, key16 ) );
        -- 15. stage
        if mode(15) = '0' then
          c15 := c14(2 to 27) & c14(0 to 1);
          d15 := d14(2 to 27) & d14(0 to 1);
        else
          c15 := c14(26 to 27) & c14(0 to 25);
          d15 := d14(26 to 27) & d14(0 to 25);
        end if;
        key15 := pc2( ( c15 & d15 ) );
        l15 := r14;
        r15 := l14 xor ( f( r14, key15 ) );
        -- 14. stage
        if mode(14) = '0' then
          c14 := c13(2 to 27) & c13(0 to 1);
          d14 := d13(2 to 27) & d13(0 to 1);
        else
          c14 := c13(26 to 27) & c13(0 to 25);
          d14 := d13(26 to 27) & d13(0 to 25);
        end if;
        key14 := pc2( ( c14 & d14 ) );
        l14 := r13;
        r14 := l13 xor ( f( r13, key14 ) );
        -- 13. stage
        if mode(13) = '0' then
          c13 := c12(2 to 27) & c12(0 to 1);
          d13 := d12(2 to 27) & d12(0 to 1);
        else
          c13 := c12(26 to 27) & c12(0 to 25);
          d13 := d12(26 to 27) & d12(0 to 25);
        end if;
        key13 := pc2( ( c13 & d13 ) );
        l13 := r12;
        r13 := l12 xor ( f( r12, key13 ) );
        -- 12. stage
        if mode(12) = '0' then
          c12 := c11(2 to 27) & c11(0 to 1);
          d12 := d11(2 to 27) & d11(0 to 1);
        else
          c12 := c11(26 to 27) & c11(0 to 25);
          d12 := d11(26 to 27) & d11(0 to 25);
        end if;
        key12 := pc2( ( c12 & d12 ) );
        l12 := r11;
        r12 := l11 xor ( f( r11, key12 ) );
        -- 11. stage
        if mode(11) = '0' then
          c11 := c10(2 to 27) & c10(0 to 1);
          d11 := d10(2 to 27) & d10(0 to 1);
        else
          c11 := c10(26 to 27) & c10(0 to 25);
          d11 := d10(26 to 27) & d10(0 to 25);
        end if;
        key11 := pc2( ( c11 & d11 ) );
        l11 := r10;
        r11 := l10 xor ( f( r10, key11 ) );
        -- 10. stage
        if mode(10) = '0' then
          c10 := c9(2 to 27) & c9(0 to 1);
          d10 := d9(2 to 27) & d9(0 to 1);
        else
          c10 := c9(26 to 27) & c9(0 to 25);
          d10 := d9(26 to 27) & d9(0 to 25);
        end if;
        key10 := pc2( ( c10 & d10 ) );
        l10 := r9;
        r10 := l9 xor ( f( r9, key10 ) );
        -- 9. stage
        if mode(9) = '0' then
          c9 := c8(1 to 27) & c8(0);
          d9 := d8(1 to 27) & d8(0);
        else
          c9 := c8(27) & c8(0 to 26);
          d9 := d8(27) & d8(0 to 26);
        end if;
        key9 := pc2( ( c9 & d9 ) );
        l9 := r8;
        r9 := l8 xor ( f( r8, key9 ) );
        -- 8. stage
        if mode(8) = '0' then
          c8 := c7(2 to 27) & c7(0 to 1);
          d8 := d7(2 to 27) & d7(0 to 1);
        else
          c8 := c7(26 to 27) & c7(0 to 25);
          d8 := d7(26 to 27) & d7(0 to 25);
        end if;
        key8 := pc2( ( c8 & d8 ) );
        l8 := r7;
        r8 := l7 xor ( f( r7, key8 ) );
        -- 7. stage
        if mode(7) = '0' then
          c7 := c6(2 to 27) & c6(0 to 1);
          d7 := d6(2 to 27) & d6(0 to 1);
        else
          c7 := c6(26 to 27) & c6(0 to 25);
          d7 := d6(26 to 27) & d6(0 to 25);
        end if;
        key7 := pc2( ( c7 & d7 ) );
        l7 := r6;
        r7 := l6 xor ( f( r6, key7 ) );
        -- 6. stage
        if mode(6) = '0' then
          c6 := c5(2 to 27) & c5(0 to 1);
          d6 := d5(2 to 27) & d5(0 to 1);
        else
          c6 := c5(26 to 27) & c5(0 to 25);
          d6 := d5(26 to 27) & d5(0 to 25);
        end if;
        key6 := pc2( ( c6 & d6 ) );
        l6 := r5;
        r6 := l5 xor ( f( r5, key6 ) );
        -- 5. stage
        if mode(5) = '0' then
          c5 := c4(2 to 27) & c4(0 to 1);
          d5 := d4(2 to 27) & d4(0 to 1);
        else
          c5 := c4(26 to 27) & c4(0 to 25);
          d5 := d4(26 to 27) & d4(0 to 25);
        end if;
        key5 := pc2( ( c5 & d5 ) );
        l5 := r4;
        r5 := l4 xor ( f( r4, key5 ) );
        -- 4. stage
        if mode(4) = '0' then
          c4 := c3(2 to 27) & c3(0 to 1);
          d4 := d3(2 to 27) & d3(0 to 1);
        else
          c4 := c3(26 to 27) & c3(0 to 25);
          d4 := d3(26 to 27) & d3(0 to 25);
        end if;
        key4 := pc2( ( c4 & d4 ) );
        l4 := r3;
        r4 := l3 xor ( f( r3, key4 ) );
        -- 3. stage
        if mode(3) = '0' then
          c3 := c2(2 to 27) & c2(0 to 1);
          d3 := d2(2 to 27) & d2(0 to 1);
        else
          c3 := c2(26 to 27) & c2(0 to 25);
          d3 := d2(26 to 27) & d2(0 to 25);
        end if;
        key3 := pc2( ( c3 & d3 ) );
        l3 := r2;
        r3 := l2 xor ( f( r2, key3 ) );
        -- 2. stage
        if mode(2) = '0' then
          c2 := c1(1 to 27) & c1(0);
          d2 := d1(1 to 27) & d1(0);
        else
          c2 := c1(27) & c1(0 to 26);
          d2 := d1(27) & d1(0 to 26);
        end if;
        key2 := pc2( ( c2 & d2 ) );
        l2 := r1;
        r2 := l1 xor ( f( r1, key2 ) );
        -- 1. stage
        if mode(1) = '0' then
          c1 := c0(1 to 27) & c0(0);
          d1 := d0(1 to 27) & d0(0);
        else
          c1 := c0;
          d1 := d0;
        end if;
        key1 := pc2( ( c1 & d1 ) );
        l1 := r0;
        r1 := l0 xor ( f( r0, key1 ) );
        -- input stage
        l0 := ip( data_i )(0 to 31);
        r0 := ip( data_i )(32 to 63);
        c0 := pc1_c( key_i );
        d0 := pc1_d( key_i );
      end if;
    end process crypt;

  end generate PipeG;


  AreaG : if design_type = "ITER" generate

    signal s_accept : std_logic;
    signal s_valid  : std_logic;

    signal s_l : std_logic_vector( 0 to 31);
    signal s_r : std_logic_vector( 0 to 31);

  begin

    cryptP : process (clk_i, reset_i) is
      variable v_c       : std_logic_vector(0 to 27);
      variable v_d       : std_logic_vector(0 to 27);
      variable v_key     : std_logic_vector(0 to 47);
      variable v_mode    : std_logic;
      variable v_rnd_cnt : natural;
    begin
      if(reset_i = '0') then
        v_c       := (others => '0');
        v_d       := (others => '0');
        v_key     := (others => '0');
        s_l       <= (others => '0');
        s_r       <= (others => '0');
        v_rnd_cnt := 0;
        v_mode    := '0';
        s_accept  <= '0';
        s_valid   <= '0';
      elsif rising_edge(clk_i) then
        case v_rnd_cnt is

          -- input stage
          when 0 =>
            s_accept <= '1';
            s_valid  <= '0';
            if (valid_i = '1' and s_accept = '1') then
              s_accept  <= '0';
              s_valid   <= '0';
              s_l       <= ip(data_i)(0 to 31);
              s_r       <= ip(data_i)(32 to 63);
              v_c       := pc1_c(key_i);
              v_d       := pc1_d(key_i);
              v_mode    := mode_i;
              v_rnd_cnt := v_rnd_cnt + 1;
            end if;

          -- stage 1
          when 1 =>
            if (v_mode = '0') then
              v_c := v_c(1 to 27) & v_c(0);
              v_d := v_d(1 to 27) & v_d(0);
            end if;
            v_key     := pc2((v_c & v_d));
            s_l       <= s_r;
            s_r       <= s_l xor (f(s_r, v_key));
            v_rnd_cnt := v_rnd_cnt + 1;

          when 2 =>
            if (v_mode = '0') then
              v_c := v_c(1 to 27) & v_c(0);
              v_d := v_d(1 to 27) & v_d(0);
            else
              v_c := v_c(27) & v_c(0 to 26);
              v_d := v_d(27) & v_d(0 to 26);
            end if;
            v_key     := pc2((v_c & v_d));
            s_l       <= s_r;
            s_r       <= s_l xor (f(s_r, v_key));
            v_rnd_cnt := v_rnd_cnt + 1;

          when 3 =>
            if (v_mode = '0') then
              v_c := v_c(2 to 27) & v_c(0 to 1);
              v_d := v_d(2 to 27) & v_d(0 to 1);
            else
              v_c := v_c(26 to 27) & v_c(0 to 25);
              v_d := v_d(26 to 27) & v_d(0 to 25);
            end if;
            v_key := pc2( ( v_c & v_d ) );
            s_l <= s_r;
            s_r <= s_l xor ( f( s_r, v_key ) );
            v_rnd_cnt := v_rnd_cnt + 1;

          when 4 =>
            if (v_mode = '0') then
              v_c := v_c(2 to 27) & v_c(0 to 1);
              v_d := v_d(2 to 27) & v_d(0 to 1);
            else
              v_c := v_c(26 to 27) & v_c(0 to 25);
              v_d := v_d(26 to 27) & v_d(0 to 25);
            end if;
            v_key := pc2( ( v_c & v_d ) );
            s_l <= s_r;
            s_r <= s_l xor ( f( s_r, v_key ) );
            v_rnd_cnt := v_rnd_cnt + 1;

          when 5 =>
            if (v_mode = '0') then
              v_c := v_c(2 to 27) & v_c(0 to 1);
              v_d := v_d(2 to 27) & v_d(0 to 1);
            else
              v_c := v_c(26 to 27) & v_c(0 to 25);
              v_d := v_d(26 to 27) & v_d(0 to 25);
            end if;
            v_key := pc2( ( v_c & v_d ) );
            s_l <= s_r;
            s_r <= s_l xor ( f( s_r, v_key ) );
            v_rnd_cnt := v_rnd_cnt + 1;

          when 6 =>
            if (v_mode = '0') then
              v_c := v_c(2 to 27) & v_c(0 to 1);
              v_d := v_d(2 to 27) & v_d(0 to 1);
            else
              v_c := v_c(26 to 27) & v_c(0 to 25);
              v_d := v_d(26 to 27) & v_d(0 to 25);
            end if;
            v_key := pc2( ( v_c & v_d ) );
            s_l <= s_r;
            s_r <= s_l xor ( f( s_r, v_key ) );
            v_rnd_cnt := v_rnd_cnt + 1;

          when 7 =>
            if (v_mode = '0') then
              v_c := v_c(2 to 27) & v_c(0 to 1);
              v_d := v_d(2 to 27) & v_d(0 to 1);
            else
              v_c := v_c(26 to 27) & v_c(0 to 25);
              v_d := v_d(26 to 27) & v_d(0 to 25);
            end if;
            v_key := pc2( ( v_c & v_d ) );
            s_l <= s_r;
            s_r <= s_l xor ( f( s_r, v_key ) );
            v_rnd_cnt := v_rnd_cnt + 1;

          when 8 =>
            if (v_mode = '0') then
              v_c := v_c(2 to 27) & v_c(0 to 1);
              v_d := v_d(2 to 27) & v_d(0 to 1);
            else
              v_c := v_c(26 to 27) & v_c(0 to 25);
              v_d := v_d(26 to 27) & v_d(0 to 25);
            end if;
            v_key := pc2( ( v_c & v_d ) );
            s_l <= s_r;
            s_r <= s_l xor ( f( s_r, v_key ) );
            v_rnd_cnt := v_rnd_cnt + 1;

          when 9 =>
            if (v_mode = '0') then
              v_c := v_c(1 to 27) & v_c(0);
              v_d := v_d(1 to 27) & v_d(0);
            else
              v_c := v_c(27) & v_c(0 to 26);
              v_d := v_d(27) & v_d(0 to 26);
            end if;
            v_key := pc2( ( v_c & v_d ) );
            s_l <= s_r;
            s_r <= s_l xor ( f( s_r, v_key ) );
            v_rnd_cnt := v_rnd_cnt + 1;

          when 10 =>
            if (v_mode = '0') then
              v_c := v_c(2 to 27) & v_c(0 to 1);
              v_d := v_d(2 to 27) & v_d(0 to 1);
            else
              v_c := v_c(26 to 27) & v_c(0 to 25);
              v_d := v_d(26 to 27) & v_d(0 to 25);
            end if;
            v_key := pc2( ( v_c & v_d ) );
            s_l <= s_r;
            s_r <= s_l xor ( f( s_r, v_key ) );
            v_rnd_cnt := v_rnd_cnt + 1;

          when 11 =>
            -- 11. stage
            if (v_mode = '0') then
              v_c := v_c(2 to 27) & v_c(0 to 1);
              v_d := v_d(2 to 27) & v_d(0 to 1);
            else
              v_c := v_c(26 to 27) & v_c(0 to 25);
              v_d := v_d(26 to 27) & v_d(0 to 25);
            end if;
            v_key := pc2( ( v_c & v_d ) );
            s_l <= s_r;
            s_r <= s_l xor ( f( s_r, v_key ) );
            v_rnd_cnt := v_rnd_cnt + 1;

          when 12 =>
            if (v_mode = '0') then
              v_c := v_c(2 to 27) & v_c(0 to 1);
              v_d := v_d(2 to 27) & v_d(0 to 1);
            else
              v_c := v_c(26 to 27) & v_c(0 to 25);
              v_d := v_d(26 to 27) & v_d(0 to 25);
            end if;
            v_key := pc2( ( v_c & v_d ) );
            s_l <= s_r;
            s_r <= s_l xor ( f( s_r, v_key ) );
            v_rnd_cnt := v_rnd_cnt + 1;

          when 13 =>
            if (v_mode = '0') then
              v_c := v_c(2 to 27) & v_c(0 to 1);
              v_d := v_d(2 to 27) & v_d(0 to 1);
            else
              v_c := v_c(26 to 27) & v_c(0 to 25);
              v_d := v_d(26 to 27) & v_d(0 to 25);
            end if;
            v_key := pc2( ( v_c & v_d ) );
            s_l <= s_r;
            s_r <= s_l xor ( f( s_r, v_key ) );
            v_rnd_cnt := v_rnd_cnt + 1;

          when 14 =>
            if (v_mode = '0') then
              v_c := v_c(2 to 27) & v_c(0 to 1);
              v_d := v_d(2 to 27) & v_d(0 to 1);
            else
              v_c := v_c(26 to 27) & v_c(0 to 25);
              v_d := v_d(26 to 27) & v_d(0 to 25);
            end if;
            v_key := pc2( ( v_c & v_d ) );
            s_l <= s_r;
            s_r <= s_l xor ( f( s_r, v_key ) );
            v_rnd_cnt := v_rnd_cnt + 1;

          when 15 =>
            if (v_mode = '0') then
              v_c := v_c(2 to 27) & v_c(0 to 1);
              v_d := v_d(2 to 27) & v_d(0 to 1);
            else
              v_c := v_c(26 to 27) & v_c(0 to 25);
              v_d := v_d(26 to 27) & v_d(0 to 25);
            end if;
            v_key     := pc2( ( v_c & v_d ) );
            s_l       <= s_r;
            s_r       <= s_l xor ( f( s_r, v_key ) );
            v_rnd_cnt := v_rnd_cnt + 1;

          when 16 =>
            if (v_mode = '0') then
              v_c := v_c(1 to 27) & v_c(0);
              v_d := v_d(1 to 27) & v_d(0);
            else
              v_c := v_c(27) & v_c(0 to 26);
              v_d := v_d(27) & v_d(0 to 26);
            end if;
            v_key     := pc2( ( v_c & v_d ) );
            s_l       <= s_r;
            s_r       <= s_l xor ( f( s_r, v_key ) );
            v_rnd_cnt := v_rnd_cnt + 1;

          when 17 =>
            s_valid <= '1';
            if (s_valid = '1') then
              if(accept_i = '1') then
                s_valid   <= '0';
                v_rnd_cnt := 0;
              end if;
            end if;

          when others =>
            null;

        end case;
      end if;
    end process cryptP;

    valid_o  <= s_valid;
    accept_o <= s_accept;
    data_o   <= ipn(s_r & s_l) when s_valid = '1' else (others => '0');

  end generate AreaG;


end architecture rtl;
