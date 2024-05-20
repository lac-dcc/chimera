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
module ricker_wavelet(
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
  wire [8:0] add_353;
  wire [8:0] add_355;
  wire [8:0] add_357;
  wire [8:0] add_359;
  wire [9:0] add_365;
  wire [9:0] add_367;
  wire [10:0] add_371;
  wire [15:0] sub_378;
  assign add_353 = {1'h0, window_unflattened[4'h0]} + {1'h0, window_unflattened[4'h1]};
  assign add_355 = {1'h0, window_unflattened[4'h2]} + {1'h0, window_unflattened[4'h3]};
  assign add_357 = {1'h0, window_unflattened[4'h5]} + {1'h0, window_unflattened[4'h6]};
  assign add_359 = {1'h0, window_unflattened[4'h7]} + {1'h0, window_unflattened[4'h8]};
  assign add_365 = {1'h0, add_353} + {1'h0, add_355};
  assign add_367 = {1'h0, add_357} + {1'h0, add_359};
  assign add_371 = {1'h0, add_365} + {1'h0, add_367};
  assign sub_378 = {8'h00, window_unflattened[4'h4]} - {8'h00, add_371[10:3]};
  assign out = $signed({{16{sub_378[15]}}, sub_378}) > $signed(32'h0000_0000) ? sub_378[7:0] : -sub_378[7:0];
endmodule
