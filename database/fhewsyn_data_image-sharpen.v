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
module kernel_sharpen(
  input wire [71:0] window,
  output wire [7:0] out
);
  // lint_off MULTIPLY
  function automatic [10:0] umul11b_8b_x_3b (input reg [7:0] lhs, input reg [2:0] rhs);
    begin
      umul11b_8b_x_3b = lhs * rhs;
    end
  endfunction
  // lint_on MULTIPLY
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
  wire [10:0] umul_229;
  wire [7:0] add_230;
  wire [7:0] add_231;
  wire [7:0] add_233;
  wire [7:0] sub_235;
  wire [8:0] concat_236;
  wire sle_240;
  assign umul_229 = umul11b_8b_x_3b(window_unflattened[4'h4], 3'h5);
  assign add_230 = window_unflattened[4'h5] + window_unflattened[4'h7];
  assign add_231 = window_unflattened[4'h1] + window_unflattened[4'h3];
  assign add_233 = add_230 + add_231;
  assign sub_235 = umul_229[7:0] - add_233;
  assign concat_236 = {1'h0, sub_235};
  assign sle_240 = $signed(concat_236) <= $signed(9'h00f);
  assign out = ~($signed(concat_236) <= $signed(9'h04b) & sle_240) ? {4'h0, {4{~($signed(concat_236) > $signed(9'h04b) | sle_240)}}} : sub_235;
endmodule
