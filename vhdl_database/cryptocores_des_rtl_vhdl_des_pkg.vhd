-- ======================================================================
-- DES encryption/decryption
-- package file with functions
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



package des_pkg is


  component des is
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
  end component des;


  type ip_matrix is array (0 to 63) of natural range 0 to 63;
  constant ip_table : ip_matrix := (57, 49, 41, 33, 25, 17,  9, 1,
                                59, 51, 43, 35, 27, 19, 11, 3,
                                61, 53, 45, 37, 29, 21, 13, 5,
                                63, 55, 47, 39, 31, 23, 15, 7,
                                56, 48, 40, 32, 24, 16,  8, 0,
                                58, 50, 42, 34, 26, 18, 10, 2,
                                60, 52, 44, 36, 28, 20, 12, 4,
                                62, 54, 46, 38, 30, 22, 14, 6);
  constant ipn_table : ip_matrix := (39,  7, 47, 15, 55, 23, 63, 31,
                                38,  6, 46, 14, 54, 22, 62, 30,
                                37,  5, 45, 13, 53, 21, 61, 29,
                                36,  4, 44, 12, 52, 20, 60, 28,
                                35,  3, 43, 11, 51, 19, 59, 27,
                                34,  2, 42, 10, 50, 18, 58, 26,
                                33,  1, 41,  9, 49, 17, 57, 25,
                                32,  0, 40,  8, 48, 16, 56, 24);

  type e_matrix is array (0 to 47) of natural range 0 to 31;
  constant e_table : e_matrix := (31,  0,  1,  2,  3,  4,
                                 3,  4,  5,  6,  7,  8,
                                 7,  8,  9, 10, 11, 12,
                                11, 12, 13, 14, 15, 16,
                                15, 16, 17, 18, 19, 20,
                                19, 20, 21, 22, 23, 24,
                                23, 24, 25, 26, 27, 28,
                                27, 28, 29, 30, 31,  0);

  type s_matrix is array (0 to 3, 0 to 15) of integer range 0 to 15;
  constant s1_table  : s_matrix := (0 => (14,  4, 13,  1,  2, 15, 11,  8,  3, 10,  6, 12,  5,  9,  0,  7),
                                    1 => ( 0, 15,  7,  4, 14,  2, 13,  1, 10,  6, 12, 11,  9,  5,  3,  8),
                                    2 => ( 4,  1, 14,  8, 13,  6,  2, 11, 15, 12,  9,  7,  3, 10,  5,  0),
                                    3 => (15, 12,  8,  2,  4,  9,  1,  7,  5, 11,  3, 14, 10,  0,  6, 13));
  constant s2_table  : s_matrix := (0 => (15,  1,  8, 14,  6, 11,  3,  4,  9,  7,  2, 13, 12,  0,  5, 10),
                                    1 => ( 3, 13,  4,  7, 15,  2,  8, 14, 12,  0,  1, 10,  6,  9, 11,  5),
                                    2 => ( 0, 14,  7, 11, 10,  4, 13,  1,  5,  8, 12,  6,  9,  3,  2, 15),
                                    3 => (13,  8, 10,  1,  3, 15,  4,  2, 11,  6,  7, 12,  0,  5, 14,  9));
  constant s3_table  : s_matrix := (0 => (10,  0,  9, 14,  6,  3, 15,  5,  1, 13, 12,  7, 11,  4,  2,  8),
                                    1 => (13,  7,  0,  9,  3,  4,  6, 10,  2,  8,  5, 14, 12, 11, 15,  1),
                                    2 => (13,  6,  4,  9,  8, 15,  3,  0, 11,  1,  2, 12,  5, 10, 14,  7),
                                    3 => ( 1, 10, 13,  0,  6,  9,  8,  7,  4, 15, 14,  3, 11,  5,  2, 12));
  constant s4_table  : s_matrix := (0 => ( 7, 13, 14,  3,  0,  6,  9, 10,  1,  2,  8,  5, 11, 12,  4,  15),
                                    1 => (13,  8, 11,  5,  6, 15,  0,  3,  4,  7,  2, 12,  1, 10, 14,   9),
                                    2 => (10,  6,  9,  0, 12, 11,  7, 13, 15,  1,  3, 14,  5,  2,  8,   4),
                                    3 => ( 3, 15,  0,  6, 10,  1, 13,  8,  9,  4,  5, 11, 12,  7,  2,  14));
  constant s5_table  : s_matrix := (0 => ( 2, 12,  4,  1,  7, 10, 11,  6,  8,  5,  3, 15, 13,  0, 14,  9),
                                    1 => (14, 11,  2, 12,  4,  7, 13,  1,  5,  0, 15, 10,  3,  9,  8,  6),
                                    2 => ( 4,  2,  1, 11, 10, 13,  7,  8, 15,  9, 12,  5,  6,  3,  0, 14),
                                    3 => (11,  8, 12,  7,  1, 14,  2, 13,  6, 15,  0,  9, 10,  4,  5,  3));
  constant s6_table  : s_matrix := (0 => (12,  1, 10, 15,  9,  2,  6,  8,  0, 13,  3,  4, 14,  7,  5, 11),
                                    1 => (10, 15,  4,  2,  7, 12,  9,  5,  6,  1, 13, 14,  0, 11,  3,  8),
                                    2 => ( 9, 14, 15,  5,  2,  8, 12,  3,  7,  0,  4, 10,  1, 13, 11,  6),
                                    3 => ( 4,  3,  2, 12,  9,  5, 15, 10, 11, 14,  1,  7,  6,  0,  8, 13));
  constant s7_table  : s_matrix := (0 => ( 4, 11,  2, 14, 15,  0,  8, 13,  3, 12,  9,  7,  5, 10,  6,  1),
                                    1 => (13,  0, 11,  7,  4,  9,  1, 10, 14,  3,  5, 12,  2, 15,  8,  6),
                                    2 => ( 1,  4, 11, 13, 12,  3,  7, 14, 10, 15,  6,  8,  0,  5,  9,  2),
                                    3 => ( 6, 11, 13,  8,  1,  4, 10,  7,  9,  5,  0, 15, 14,  2,  3, 12));
  constant s8_table  : s_matrix := (0 => (13,  2,  8,  4,  6, 15, 11,  1, 10,  9,  3, 14,  5,  0, 12,  7),
                                    1 => ( 1, 15, 13,  8, 10,  3,  7,  4, 12,  5,  6, 11,  0, 14,  9,  2),
                                    2 => ( 7, 11,  4,  1,  9, 12, 14,  2,  0,  6, 10, 13, 15,  3,  5,  8),
                                    3 => ( 2,  1, 14,  7,  4, 10,  8, 13, 15, 12,  9,  0,  3,  5,  6, 11));

  type pc_matrix is array (0 to 27) of natural range 0 to 63;
  constant pc1c_table : pc_matrix := (56, 48, 40, 32, 24, 16,  8,
                                 0, 57, 49, 41, 33, 25, 17,
                                 9,  1, 58, 50, 42, 34, 26,
                                18, 10,  2, 59, 51, 43, 35);
  constant pc1d_table : pc_matrix := (62, 54, 46, 38, 30, 22, 14,
                                 6, 61, 53, 45, 37, 29, 21,
                                13,  5, 60, 52, 44, 36, 28,
                                20, 12,  4, 27, 19, 11,  3);

  type p_matrix is array (0 to 31) of natural range 0 to 31;
  constant p_table : p_matrix := (15,  6, 19, 20,
                                28, 11, 27, 16,
                                 0, 14, 22, 25,
                                 4, 17, 30,  9,
                                 1,  7, 23, 13,
                                31, 26,  2,  8,
                                18, 12, 29,  5,
                                21, 10,  3, 24);

  type pc2_matrix is array (0 to 47) of natural range 0 to 63;
  constant pc2_table : pc2_matrix := (13, 16, 10, 23,  0,  4,
                                 2, 27, 14,  5, 20,  9,
                                22, 18, 11,  3, 25,  7,
                                15,  6, 26, 19, 12,  1,
                                40, 51, 30, 36, 46, 54,
                                29, 39, 50, 44, 32, 47,
                                43, 48, 38, 55, 33, 52,
                                45, 41, 49, 35, 28, 31);

  function ip  ( input_vector : std_logic_vector(0 to 63) ) return std_logic_vector;
  function ipn ( input_vector : std_logic_vector(0 to 63) ) return std_logic_vector;

  function e (input_vector : std_logic_vector(0 to 31) ) return std_logic_vector;
  function p (input_vector : std_logic_vector(0 to 31) ) return std_logic_vector;

  function s (input_vector : std_logic_vector(0 to 5); s_table : s_matrix ) return std_logic_vector;

  function f (input_r : std_logic_vector(0 to 31); input_key : std_logic_vector(0 to 47) ) return std_logic_vector;

  function pc1_c ( input_vector : std_logic_vector(0 to 63) ) return std_logic_vector;
  function pc1_d ( input_vector : std_logic_vector(0 to 63) ) return std_logic_vector;
  function pc2   ( input_vector : std_logic_vector(0 to 55) ) return std_logic_vector;


end package des_pkg;



package body des_pkg is


  function ip ( input_vector : std_logic_vector(0 to 63) ) return std_logic_vector is
    variable result : std_logic_vector(0 to 63);
  begin
    for index IN 0 to 63 loop
      result( index ) := input_vector( ip_table( index ) );
    end loop;
    return result;
  end function ip;


  function ipn ( input_vector : std_logic_vector(0 to 63) ) return std_logic_vector is
    variable result : std_logic_vector(0 to 63);
  begin
    for index IN 0 to 63 loop
      result( index ) := input_vector( ipn_table( index ) );
    end loop;
    return result;
  end function ipn;


  function e (input_vector : std_logic_vector(0 to 31) ) return std_logic_vector is
    variable result : std_logic_vector(0 to 47);
  begin
    for index IN 0 to 47 loop
      result( index ) := input_vector( e_table( index ) );
    end loop;
    return result;
  end function e;


  function s ( input_vector : std_logic_vector(0 to 5); s_table : s_matrix ) return std_logic_vector is
    variable int : std_logic_vector(0 to 1);
    variable i : integer range 0 to 3;
    variable j : integer range 0 to 15;
    variable result : std_logic_vector(0 to 3);
  begin
    int := input_vector( 0 ) & input_vector( 5 );
    i := to_integer( unsigned( int ) );
    j := to_integer( unsigned( input_vector( 1 to 4) ) );
    result := std_logic_vector( to_unsigned( s_table( i, j ), 4 ) );
    return result;
  end function s;


  function p (input_vector : std_logic_vector(0 to 31) ) return std_logic_vector is
    variable result : std_logic_vector(0 to 31);
  begin
    for index IN 0 to 31 loop
      result( index ) := input_vector( p_table( index ) );
    end loop;
    return result;
  end function p;


  function f (input_r : std_logic_vector(0 to 31); input_key : std_logic_vector(0 to 47) ) return std_logic_vector is
    variable intern : std_logic_vector(0 to 47);
    variable result : std_logic_vector(0 to 31);
  begin
    intern := e( input_r ) xor input_key;
    result := p( s( intern(0 to 5), s1_table )   & s( intern(6 to 11), s2_table )  & s( intern(12 to 17), s3_table ) &
                 s( intern(18 to 23), s4_table ) & s( intern(24 to 29), s5_table ) & s( intern(30 to 35), s6_table ) &
                 s( intern(36 to 41), s7_table ) & s( intern(42 to 47), s8_table ) );
    return result;
  end function f;


  function pc1_c ( input_vector : std_logic_vector(0 to 63) ) return std_logic_vector is
    variable result : std_logic_vector(0 to 27);
  begin
    for index IN 0 to 27 loop
      result( index ) := input_vector( pc1c_table( index ) );
    end loop;
    return result;
  end function pc1_c;


  function pc1_d ( input_vector : std_logic_vector(0 to 63) ) return std_logic_vector is
    variable result : std_logic_vector(0 to 27);
  begin
    for index IN 0 to 27 loop
      result( index ) := input_vector( pc1d_table( index ) );
    end loop;
    return result;
  end function pc1_d;


  function pc2 ( input_vector : std_logic_vector(0 to 55) ) return std_logic_vector is
    variable result : std_logic_vector(0 to 47);
  begin
    for index IN 0 to 47 loop
      result( index ) := input_vector( pc2_table( index ) );
    end loop;
    return result;
  end function pc2;


end package body des_pkg;
