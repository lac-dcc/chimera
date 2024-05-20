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
module sum3d(
  input wire [95:0] a,
  input wire [95:0] b,
  output wire [223:0] out
);
  wire [7:0] a_unflattened[0:1][0:2][0:1];
  assign a_unflattened[0][0][0] = a[7:0];
  assign a_unflattened[0][0][1] = a[15:8];
  assign a_unflattened[0][1][0] = a[23:16];
  assign a_unflattened[0][1][1] = a[31:24];
  assign a_unflattened[0][2][0] = a[39:32];
  assign a_unflattened[0][2][1] = a[47:40];
  assign a_unflattened[1][0][0] = a[55:48];
  assign a_unflattened[1][0][1] = a[63:56];
  assign a_unflattened[1][1][0] = a[71:64];
  assign a_unflattened[1][1][1] = a[79:72];
  assign a_unflattened[1][2][0] = a[87:80];
  assign a_unflattened[1][2][1] = a[95:88];
  wire [7:0] b_unflattened[0:1][0:2][0:1];
  assign b_unflattened[0][0][0] = b[7:0];
  assign b_unflattened[0][0][1] = b[15:8];
  assign b_unflattened[0][1][0] = b[23:16];
  assign b_unflattened[0][1][1] = b[31:24];
  assign b_unflattened[0][2][0] = b[39:32];
  assign b_unflattened[0][2][1] = b[47:40];
  assign b_unflattened[1][0][0] = b[55:48];
  assign b_unflattened[1][0][1] = b[63:56];
  assign b_unflattened[1][1][0] = b[71:64];
  assign b_unflattened[1][1][1] = b[79:72];
  assign b_unflattened[1][2][0] = b[87:80];
  assign b_unflattened[1][2][1] = b[95:88];
  wire [8:0] add_2398;
  wire [8:0] add_2400;
  wire [8:0] add_2402;
  wire [8:0] add_2404;
  wire [8:0] add_2406;
  wire [8:0] add_2408;
  wire [8:0] add_2410;
  wire [8:0] add_2412;
  wire [9:0] add_2446;
  wire [9:0] add_2448;
  wire [9:0] add_2450;
  wire [9:0] add_2452;
  wire [8:0] add_2454;
  wire [8:0] add_2456;
  wire [8:0] add_2458;
  wire [8:0] add_2460;
  wire [10:0] add_2470;
  wire [10:0] add_2472;
  wire [9:0] add_2474;
  wire [9:0] add_2476;
  wire [11:0] add_2482;
  wire [10:0] add_2484;
  wire [12:0] add_2488;
  assign add_2398 = {1'h0, a_unflattened[1'h0][2'h0][1'h0]} + {1'h0, b_unflattened[1'h0][2'h0][1'h0]};
  assign add_2400 = {1'h0, a_unflattened[1'h0][2'h0][1'h1]} + {1'h0, b_unflattened[1'h0][2'h0][1'h1]};
  assign add_2402 = {1'h0, a_unflattened[1'h0][2'h1][1'h0]} + {1'h0, b_unflattened[1'h0][2'h1][1'h0]};
  assign add_2404 = {1'h0, a_unflattened[1'h0][2'h1][1'h1]} + {1'h0, b_unflattened[1'h0][2'h1][1'h1]};
  assign add_2406 = {1'h0, a_unflattened[1'h0][2'h2][1'h0]} + {1'h0, b_unflattened[1'h0][2'h2][1'h0]};
  assign add_2408 = {1'h0, a_unflattened[1'h0][2'h2][1'h1]} + {1'h0, b_unflattened[1'h0][2'h2][1'h1]};
  assign add_2410 = {1'h0, a_unflattened[1'h1][2'h0][1'h0]} + {1'h0, b_unflattened[1'h1][2'h0][1'h0]};
  assign add_2412 = {1'h0, a_unflattened[1'h1][2'h0][1'h1]} + {1'h0, b_unflattened[1'h1][2'h0][1'h1]};
  assign add_2446 = {1'h0, add_2398} + {1'h0, add_2400};
  assign add_2448 = {1'h0, add_2402} + {1'h0, add_2404};
  assign add_2450 = {1'h0, add_2406} + {1'h0, add_2408};
  assign add_2452 = {1'h0, add_2410} + {1'h0, add_2412};
  assign add_2454 = {1'h0, a_unflattened[1'h1][2'h1][1'h0]} + {1'h0, b_unflattened[1'h1][2'h1][1'h0]};
  assign add_2456 = {1'h0, a_unflattened[1'h1][2'h1][1'h1]} + {1'h0, b_unflattened[1'h1][2'h1][1'h1]};
  assign add_2458 = {1'h0, a_unflattened[1'h1][2'h2][1'h0]} + {1'h0, b_unflattened[1'h1][2'h2][1'h0]};
  assign add_2460 = {1'h0, a_unflattened[1'h1][2'h2][1'h1]} + {1'h0, b_unflattened[1'h1][2'h2][1'h1]};
  assign add_2470 = {1'h0, add_2446} + {1'h0, add_2448};
  assign add_2472 = {1'h0, add_2450} + {1'h0, add_2452};
  assign add_2474 = {1'h0, add_2454} + {1'h0, add_2456};
  assign add_2476 = {1'h0, add_2458} + {1'h0, add_2460};
  assign add_2482 = {1'h0, add_2470} + {1'h0, add_2472};
  assign add_2484 = {1'h0, add_2474} + {1'h0, add_2476};
  assign add_2488 = {1'h0, add_2482} + {2'h0, add_2484};
  assign out = {{19'h0_0000, add_2488}, {{{a_unflattened[1][2][1], a_unflattened[1][2][0]}, {a_unflattened[1][1][1], a_unflattened[1][1][0]}, {a_unflattened[1][0][1], a_unflattened[1][0][0]}}, {{a_unflattened[0][2][1], a_unflattened[0][2][0]}, {a_unflattened[0][1][1], a_unflattened[0][1][0]}, {a_unflattened[0][0][1], a_unflattened[0][0][0]}}}, {{{b_unflattened[1][2][1], b_unflattened[1][2][0]}, {b_unflattened[1][1][1], b_unflattened[1][1][0]}, {b_unflattened[1][0][1], b_unflattened[1][0][0]}}, {{b_unflattened[0][2][1], b_unflattened[0][2][0]}, {b_unflattened[0][1][1], b_unflattened[0][1][0]}, {b_unflattened[0][0][1], b_unflattened[0][0][0]}}}};
endmodule
