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


-- Revision 1.0  2007/02/04
-- Initial release



LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;



PACKAGE des_pkg IS


  FUNCTION ip  ( input_vector : std_logic_vector(0 TO 63) ) RETURN std_logic_vector;
  FUNCTION ipn ( input_vector : std_logic_vector(0 TO 63) ) RETURN std_logic_vector;

  FUNCTION e (input_vector : std_logic_vector(0 TO 31) ) RETURN std_logic_vector;
  FUNCTION p (input_vector : std_logic_vector(0 TO 31) ) RETURN std_logic_vector;

  FUNCTION s1 (input_vector : std_logic_vector(0 TO 5) ) RETURN std_logic_vector;
  FUNCTION s2 (input_vector : std_logic_vector(0 TO 5) ) RETURN std_logic_vector;
  FUNCTION s3 (input_vector : std_logic_vector(0 TO 5) ) RETURN std_logic_vector;
  FUNCTION s4 (input_vector : std_logic_vector(0 TO 5) ) RETURN std_logic_vector;
  FUNCTION s5 (input_vector : std_logic_vector(0 TO 5) ) RETURN std_logic_vector;
  FUNCTION s6 (input_vector : std_logic_vector(0 TO 5) ) RETURN std_logic_vector;
  FUNCTION s7 (input_vector : std_logic_vector(0 TO 5) ) RETURN std_logic_vector;
  FUNCTION s8 (input_vector : std_logic_vector(0 TO 5) ) RETURN std_logic_vector;

  FUNCTION f (input_r : std_logic_vector(0 TO 31); input_key : std_logic_vector(0 TO 47) ) RETURN std_logic_vector;

  FUNCTION pc1_c ( input_vector : std_logic_vector(0 TO 63) ) RETURN std_logic_vector;
  FUNCTION pc1_d ( input_vector : std_logic_vector(0 TO 63) ) RETURN std_logic_vector;
  FUNCTION pc2   ( input_vector : std_logic_vector(0 TO 55) ) RETURN std_logic_vector;

  TYPE ip_matrix IS ARRAY (0 TO 63) OF natural RANGE 0 TO 63;
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

  TYPE e_matrix IS ARRAY (0 TO 47) OF natural RANGE 0 TO 31;
  constant e_table : e_matrix := (31,  0,  1,  2,  3,  4,
                                 3,  4,  5,  6,  7,  8,
                                 7,  8,  9, 10, 11, 12,
                                11, 12, 13, 14, 15, 16,
                                15, 16, 17, 18, 19, 20,
                                19, 20, 21, 22, 23, 24,
                                23, 24, 25, 26, 27, 28,
                                27, 28, 29, 30, 31,  0);

  TYPE s_matrix IS ARRAY (0 TO 3, 0 TO 15) OF integer RANGE 0 TO 15;
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

  type pc_matrix IS ARRAY (0 TO 27) OF natural RANGE 0 TO 63;
  constant pc1c_table : pc_matrix := (56, 48, 40, 32, 24, 16,  8,
                                 0, 57, 49, 41, 33, 25, 17,
                                 9,  1, 58, 50, 42, 34, 26,
                                18, 10,  2, 59, 51, 43, 35);
  constant pc1d_table : pc_matrix := (62, 54, 46, 38, 30, 22, 14,
                                 6, 61, 53, 45, 37, 29, 21,
                                13,  5, 60, 52, 44, 36, 28,
                                20, 12,  4, 27, 19, 11,  3);

  type p_matrix IS ARRAY (0 TO 31) OF natural RANGE 0 TO 31;
  constant p_table : p_matrix := (15,  6, 19, 20,
                                28, 11, 27, 16,
                                 0, 14, 22, 25,
                                 4, 17, 30,  9,
                                 1,  7, 23, 13,
                                31, 26,  2,  8,
                                18, 12, 29,  5,
                                21, 10,  3, 24);

  type pc2_matrix IS ARRAY (0 TO 47) OF natural RANGE 0 TO 63;
  constant pc2_table : pc2_matrix := (13, 16, 10, 23,  0,  4,
                                 2, 27, 14,  5, 20,  9,
                                22, 18, 11,  3, 25,  7,
                                15,  6, 26, 19, 12,  1,
                                40, 51, 30, 36, 46, 54,
                                29, 39, 50, 44, 32, 47,
                                43, 48, 38, 55, 33, 52,
                                45, 41, 49, 35, 28, 31);


END PACKAGE des_pkg;



PACKAGE BODY des_pkg IS


  FUNCTION ip ( input_vector : std_logic_vector(0 TO 63) ) RETURN std_logic_vector IS
    VARIABLE result : std_logic_vector(0 TO 63);
  BEGIN
    FOR index IN 0 TO 63 LOOP
      result( index ) := input_vector( ip_table( index ) );
    END LOOP;
    RETURN result;
  END FUNCTION ip;

  FUNCTION ipn ( input_vector : std_logic_vector(0 TO 63) ) RETURN std_logic_vector IS
    VARIABLE result : std_logic_vector(0 TO 63);
  BEGIN
    FOR index IN 0 TO 63 LOOP
      result( index ) := input_vector( ipn_table( index ) );
    END LOOP;
    RETURN result;
  END FUNCTION ipn;

  FUNCTION e (input_vector : std_logic_vector(0 TO 31) ) RETURN std_logic_vector IS
    VARIABLE result : std_logic_vector(0 TO 47);
  BEGIN
    FOR index IN 0 TO 47 LOOP
      result( index ) := input_vector( e_table( index ) );
    END LOOP;
    RETURN result;
  END FUNCTION e;

  FUNCTION s1 ( input_vector : std_logic_vector(0 TO 5) ) RETURN std_logic_vector IS
    VARIABLE int : std_logic_vector(0 TO 1);
    VARIABLE i : integer RANGE 0 TO 3;
    VARIABLE j : integer RANGE 0 TO 15;
    VARIABLE result : std_logic_vector(0 TO 3);
  BEGIN
    int := input_vector( 0 ) & input_vector( 5 );
    i := to_integer( unsigned( int ) );
    j := to_integer( unsigned( input_vector( 1 TO 4) ) );
    result := std_logic_vector( to_unsigned( s1_table( i, j ), 4 ) );
    RETURN result;
  END FUNCTION s1;

  FUNCTION s2 ( input_vector : std_logic_vector(0 TO 5) ) RETURN std_logic_vector IS
    VARIABLE int : std_logic_vector(0 TO 1);
    VARIABLE i : integer RANGE 0 TO 3;
    VARIABLE j : integer RANGE 0 TO 15;
    VARIABLE result : std_logic_vector(0 TO 3);
  BEGIN
    int := input_vector( 0 ) & input_vector( 5 );
    i := to_integer( unsigned( int ) );
    j := to_integer( unsigned( input_vector( 1 TO 4) ) );
    result := std_logic_vector( to_unsigned( s2_table( i, j ), 4 ) );
    RETURN result;
  END FUNCTION s2;

  FUNCTION s3 ( input_vector : std_logic_vector(0 TO 5) ) RETURN std_logic_vector IS
    VARIABLE int : std_logic_vector(0 TO 1);
    VARIABLE i : integer RANGE 0 TO 3;
    VARIABLE j : integer RANGE 0 TO 15;
    VARIABLE result : std_logic_vector(0 TO 3);
  BEGIN
    int := input_vector( 0 ) & input_vector( 5 );
    i := to_integer( unsigned( int ) );
    j := to_integer( unsigned( input_vector( 1 TO 4) ) );
    result := std_logic_vector( to_unsigned( s3_table( i, j ), 4 ) );
    RETURN result;
  END FUNCTION s3;

  FUNCTION s4 ( input_vector : std_logic_vector(0 TO 5) ) RETURN std_logic_vector IS
    VARIABLE int : std_logic_vector(0 TO 1);
    VARIABLE i : integer RANGE 0 TO 3;
    VARIABLE j : integer RANGE 0 TO 15;
    VARIABLE result : std_logic_vector(0 TO 3);
  BEGIN
    int := input_vector( 0 ) & input_vector( 5 );
    i := to_integer( unsigned( int ) );
    j := to_integer( unsigned( input_vector( 1 TO 4) ) );
    result := std_logic_vector( to_unsigned( s4_table( i, j ), 4 ) );
    RETURN result;
  END FUNCTION s4;

  FUNCTION s5 ( input_vector : std_logic_vector(0 TO 5) ) RETURN std_logic_vector IS
    VARIABLE int : std_logic_vector(0 TO 1);
    VARIABLE i : integer RANGE 0 TO 3;
    VARIABLE j : integer RANGE 0 TO 15;
    VARIABLE result : std_logic_vector(0 TO 3);
  BEGIN
    int := input_vector( 0 ) & input_vector( 5 );
    i := to_integer( unsigned( int ) );
    j := to_integer( unsigned( input_vector( 1 TO 4) ) );
    result := std_logic_vector( to_unsigned( s5_table( i, j ), 4 ) );
    RETURN result;
  END FUNCTION s5;

  FUNCTION s6 ( input_vector : std_logic_vector(0 TO 5) ) RETURN std_logic_vector IS
    VARIABLE int : std_logic_vector(0 TO 1);
    VARIABLE i : integer RANGE 0 TO 3;
    VARIABLE j : integer RANGE 0 TO 15;
    VARIABLE result : std_logic_vector(0 TO 3);
  BEGIN
    int := input_vector( 0 ) & input_vector( 5 );
    i := to_integer( unsigned( int ) );
    j := to_integer( unsigned( input_vector( 1 TO 4) ) );
    result := std_logic_vector( to_unsigned( s6_table( i, j ), 4 ) );
    RETURN result;
  END FUNCTION s6;

  FUNCTION s7 ( input_vector : std_logic_vector(0 TO 5) ) RETURN std_logic_vector IS
    VARIABLE int : std_logic_vector(0 TO 1);
    VARIABLE i : integer RANGE 0 TO 3;
    VARIABLE j : integer RANGE 0 TO 15;
    VARIABLE result : std_logic_vector(0 TO 3);
  BEGIN
    int := input_vector( 0 ) & input_vector( 5 );
    i := to_integer( unsigned( int ) );
    j := to_integer( unsigned( input_vector( 1 TO 4) ) );
    result := std_logic_vector( to_unsigned( s7_table( i, j ), 4 ) );
    RETURN result;
  END FUNCTION s7;

  FUNCTION s8 ( input_vector : std_logic_vector(0 TO 5) ) RETURN std_logic_vector IS
    VARIABLE int : std_logic_vector(0 TO 1);
    VARIABLE i : integer RANGE 0 TO 3;
    VARIABLE j : integer RANGE 0 TO 15;
    VARIABLE result : std_logic_vector(0 TO 3);
  BEGIN
    int := input_vector( 0 ) & input_vector( 5 );
    i := to_integer( unsigned( int ) );
    j := to_integer( unsigned( input_vector( 1 TO 4) ) );
    result := std_logic_vector( to_unsigned( s8_table( i, j ), 4 ) );
    RETURN result;
  END FUNCTION s8;

  FUNCTION p (input_vector : std_logic_vector(0 TO 31) ) RETURN std_logic_vector IS
    VARIABLE result : std_logic_vector(0 TO 31);
  BEGIN
    FOR index IN 0 TO 31 LOOP
      result( index ) := input_vector( p_table( index ) );
    END LOOP;
    RETURN result;
  END FUNCTION p;

  FUNCTION f (input_r : std_logic_vector(0 TO 31); input_key : std_logic_vector(0 TO 47) ) RETURN std_logic_vector IS
    VARIABLE intern : std_logic_vector(0 TO 47);
    VARIABLE result : std_logic_vector(0 TO 31);
  BEGIN
    intern := e( input_r ) xor input_key;
    result := p( s1( intern(0 TO 5) ) & s2( intern(6 TO 11) ) & s3( intern(12 TO 17) ) & s4( intern(18 TO 23) ) &
              s5( intern(24 TO 29) ) & s6( intern(30 TO 35) ) & s7( intern(36 TO 41) ) & s8( intern(42 TO 47) ) );
    RETURN result;
  END FUNCTION f;

  FUNCTION pc1_c ( input_vector : std_logic_vector(0 TO 63) ) RETURN std_logic_vector IS
    VARIABLE result : std_logic_vector(0 TO 27);
  BEGIN
    FOR index IN 0 TO 27 LOOP
      result( index ) := input_vector( pc1c_table( index ) );
    END LOOP;
    RETURN result;
  END FUNCTION pc1_c;

  FUNCTION pc1_d ( input_vector : std_logic_vector(0 TO 63) ) RETURN std_logic_vector IS

    VARIABLE result : std_logic_vector(0 TO 27);
  BEGIN
    FOR index IN 0 TO 27 LOOP
      result( index ) := input_vector( pc1d_table( index ) );
    END LOOP;
    RETURN result;
  END FUNCTION pc1_d;

  FUNCTION pc2 ( input_vector : std_logic_vector(0 TO 55) ) RETURN std_logic_vector IS
    VARIABLE result : std_logic_vector(0 TO 47);
  BEGIN
    FOR index IN 0 TO 47 LOOP
      result( index ) := input_vector( pc2_table( index ) );
    END LOOP;
    RETURN result;
  END FUNCTION pc2;


END PACKAGE BODY des_pkg;
