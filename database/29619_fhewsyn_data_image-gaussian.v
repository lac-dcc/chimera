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
module kernel_gaussian_blur(
  input wire [71:0] window,
  output wire [7:0] out
);
  wire [7:0] window_unflattened[0:8];
  assign window_unflattened[0] = window[7:0];
  assign window_unflattened[1] = window[15:8];
  assign window_unflattened[2] = window[23:16];
  assign window_unflattened[3] = window[31:24];
  assign window_unflattened[4] = window[39:32];
  assign window_unflattened[5] = window[47:40];
  assign window_unflattened[6] = window[55:48];
  assign window_unflattened[7] = window[63:56];
  assign window_unflattened[8] = window[71:64];
  wire [7:0] array_index_416;
  wire [8:0] add_429;
  wire [7:0] array_index_433;
  wire [7:0] array_index_436;
  wire [7:0] array_index_438;
  wire [10:0] add_453;
  wire [8:0] add_463;
  wire [8:0] add_466;
  wire [8:0] add_469;
  wire [10:0] add_476;
  wire [10:0] add_479;
  wire [12:0] add_482;
  assign array_index_416 = window_unflattened[4'h0];
  assign add_429 = {2'h0, array_index_416[7:1]} + {1'h0, window_unflattened[4'h1]};
  assign array_index_433 = window_unflattened[4'h3];
  assign array_index_436 = window_unflattened[4'h6];
  assign array_index_438 = window_unflattened[4'h8];
  assign add_453 = {1'h0, add_429, array_index_416[0]} + {3'h0, window_unflattened[4'h2]};
  assign add_463 = {2'h0, array_index_433[7:1]} + {1'h0, window_unflattened[4'h4]};
  assign add_466 = {1'h0, window_unflattened[4'h5]} + {2'h0, array_index_436[7:1]};
  assign add_469 = {1'h0, window_unflattened[4'h7]} + {2'h0, array_index_438[7:1]};
  assign add_476 = {1'h0, add_453[10:1]} + {1'h0, add_463, array_index_433[0]};
  assign add_479 = {1'h0, add_466, array_index_436[0]} + {1'h0, add_469, array_index_438[0]};
  assign add_482 = {1'h0, add_476, add_453[0]} + {2'h0, add_479};
  assign out = add_482[11:4];
endmodule
