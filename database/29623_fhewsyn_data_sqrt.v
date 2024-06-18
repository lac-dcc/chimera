// This program was cloned from: https://github.com/Chair-for-Security-Engineering/fhewsyn
// License: BSD 3-Clause "New" or "Revised" License

// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
module isqrt(
  input wire [15:0] num,
  output wire [15:0] out
);
  wire [31:0] sign_ext_1895;
  wire sge_1900;
  wire [1:0] add_1903;
  wire [1:0] sel_1910;
  wire [15:0] sel_1912;
  wire [31:0] sign_ext_1916;
  wire [31:0] or_1917;
  wire sge_1923;
  wire [2:0] add_1925;
  wire [2:0] sel_1928;
  wire [15:0] sub_1935;
  wire [3:0] sel_1937;
  wire [15:0] sel_1939;
  wire [31:0] sign_ext_1943;
  wire [31:0] or_1944;
  wire sge_1950;
  wire [4:0] add_1952;
  wire [4:0] sel_1955;
  wire [15:0] sub_1962;
  wire [5:0] sel_1964;
  wire [15:0] sel_1966;
  wire [31:0] sign_ext_1970;
  wire [31:0] or_1971;
  wire sge_1977;
  wire [6:0] add_1979;
  wire [6:0] sel_1982;
  wire [15:0] sub_1989;
  wire [7:0] sel_1991;
  wire [15:0] sel_1993;
  wire [31:0] sign_ext_1997;
  wire [31:0] or_1998;
  wire sge_2004;
  wire [8:0] add_2006;
  wire [8:0] sel_2009;
  wire [15:0] sub_2016;
  wire [9:0] sel_2018;
  wire [15:0] sel_2020;
  wire [31:0] sign_ext_2024;
  wire [31:0] or_2025;
  wire sge_2031;
  wire [10:0] add_2033;
  wire [10:0] sel_2036;
  wire [15:0] sub_2043;
  wire [11:0] sel_2045;
  wire [15:0] sel_2047;
  wire [31:0] sign_ext_2051;
  wire [31:0] or_2052;
  wire sge_2058;
  wire [12:0] add_2060;
  wire [12:0] sel_2063;
  wire [15:0] sub_2070;
  wire [13:0] sel_2072;
  wire [15:0] sel_2074;
  wire [31:0] sign_ext_2078;
  wire [31:0] or_2079;
  wire [14:0] add_2085;
  wire [14:0] sel_2086;
  assign sign_ext_1895 = {{16{num[15]}}, num};
  assign sge_1900 = $signed(sign_ext_1895) >= $signed(32'h0000_4000);
  assign add_1903 = num[15:14] + 2'h3;
  assign sel_1910 = $signed(sign_ext_1895) < $signed(32'h0000_4000) ? {1'h0, sge_1900} : {sge_1900, 1'h0};
  assign sel_1912 = sge_1900 ? {add_1903, num[13:0]} : num;
  assign sign_ext_1916 = {{16{sel_1912[15]}}, sel_1912};
  assign or_1917 = {17'h0_0000, sel_1910, 13'h0000} | 32'h0000_1000;
  assign sge_1923 = $signed(sign_ext_1916) >= $signed(or_1917);
  assign add_1925 = {1'h0, sel_1910} + 3'h1;
  assign sel_1928 = sge_1923 ? add_1925 : {sel_1910, 1'h0};
  assign sub_1935 = sel_1912 - ({1'h0, sel_1910, 13'h0000} | 16'h1000);
  assign sel_1937 = $signed(sign_ext_1916) < $signed(or_1917) ? {1'h0, sel_1928} : {sel_1928, 1'h0};
  assign sel_1939 = sge_1923 ? sub_1935 : sel_1912;
  assign sign_ext_1943 = {{16{sel_1939[15]}}, sel_1939};
  assign or_1944 = {17'h0_0000, sel_1937, 11'h000} | 32'h0000_0400;
  assign sge_1950 = $signed(sign_ext_1943) >= $signed(or_1944);
  assign add_1952 = {1'h0, sel_1937} + 5'h01;
  assign sel_1955 = sge_1950 ? add_1952 : {sel_1937, 1'h0};
  assign sub_1962 = sel_1939 - ({1'h0, sel_1937, 11'h000} | 16'h0400);
  assign sel_1964 = $signed(sign_ext_1943) < $signed(or_1944) ? {1'h0, sel_1955} : {sel_1955, 1'h0};
  assign sel_1966 = sge_1950 ? sub_1962 : sel_1939;
  assign sign_ext_1970 = {{16{sel_1966[15]}}, sel_1966};
  assign or_1971 = {17'h0_0000, sel_1964, 9'h000} | 32'h0000_0100;
  assign sge_1977 = $signed(sign_ext_1970) >= $signed(or_1971);
  assign add_1979 = {1'h0, sel_1964} + 7'h01;
  assign sel_1982 = sge_1977 ? add_1979 : {sel_1964, 1'h0};
  assign sub_1989 = sel_1966 - ({1'h0, sel_1964, 9'h000} | 16'h0100);
  assign sel_1991 = $signed(sign_ext_1970) < $signed(or_1971) ? {1'h0, sel_1982} : {sel_1982, 1'h0};
  assign sel_1993 = sge_1977 ? sub_1989 : sel_1966;
  assign sign_ext_1997 = {{16{sel_1993[15]}}, sel_1993};
  assign or_1998 = {17'h0_0000, sel_1991, 7'h00} | 32'h0000_0040;
  assign sge_2004 = $signed(sign_ext_1997) >= $signed(or_1998);
  assign add_2006 = {1'h0, sel_1991} + 9'h001;
  assign sel_2009 = sge_2004 ? add_2006 : {sel_1991, 1'h0};
  assign sub_2016 = sel_1993 - ({1'h0, sel_1991, 7'h00} | 16'h0040);
  assign sel_2018 = $signed(sign_ext_1997) < $signed(or_1998) ? {1'h0, sel_2009} : {sel_2009, 1'h0};
  assign sel_2020 = sge_2004 ? sub_2016 : sel_1993;
  assign sign_ext_2024 = {{16{sel_2020[15]}}, sel_2020};
  assign or_2025 = {17'h0_0000, sel_2018, 5'h00} | 32'h0000_0010;
  assign sge_2031 = $signed(sign_ext_2024) >= $signed(or_2025);
  assign add_2033 = {1'h0, sel_2018} + 11'h001;
  assign sel_2036 = sge_2031 ? add_2033 : {sel_2018, 1'h0};
  assign sub_2043 = sel_2020 - ({1'h0, sel_2018, 5'h00} | 16'h0010);
  assign sel_2045 = $signed(sign_ext_2024) < $signed(or_2025) ? {1'h0, sel_2036} : {sel_2036, 1'h0};
  assign sel_2047 = sge_2031 ? sub_2043 : sel_2020;
  assign sign_ext_2051 = {{16{sel_2047[15]}}, sel_2047};
  assign or_2052 = {17'h0_0000, sel_2045, 3'h0} | 32'h0000_0004;
  assign sge_2058 = $signed(sign_ext_2051) >= $signed(or_2052);
  assign add_2060 = {1'h0, sel_2045} + 13'h0001;
  assign sel_2063 = sge_2058 ? add_2060 : {sel_2045, 1'h0};
  assign sub_2070 = sel_2047 - ({1'h0, sel_2045, 3'h0} | 16'h0004);
  assign sel_2072 = $signed(sign_ext_2051) < $signed(or_2052) ? {1'h0, sel_2063} : {sel_2063, 1'h0};
  assign sel_2074 = sge_2058 ? sub_2070 : sel_2047;
  assign sign_ext_2078 = {{16{sel_2074[15]}}, sel_2074};
  assign or_2079 = {17'h0_0000, sel_2072, 1'h0} | 32'h0000_0001;
  assign add_2085 = {1'h0, sel_2072} + 15'h0001;
  assign sel_2086 = $signed(sign_ext_2078) >= $signed(or_2079) ? add_2085 : {sel_2072, 1'h0};
  assign out = {1'h0, $signed(sign_ext_2078) < $signed(or_2079) ? {1'h0, sel_2086[14:1]} : sel_2086};
endmodule
