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
module my_package(
  input wire [15:0] x,
  input wire [15:0] y,
  input wire [7:0] op,
  output wire [15:0] out
);
  // lint_off SIGNED_TYPE
  // lint_off MULTIPLY
  function automatic [31:0] smul32b_16b_x_16b (input reg [15:0] lhs, input reg [15:0] rhs);
    reg signed [15:0] signed_lhs;
    reg signed [15:0] signed_rhs;
    reg signed [31:0] signed_result;
    begin
      signed_lhs = $signed(lhs);
      signed_rhs = $signed(rhs);
      signed_result = signed_lhs * signed_rhs;
      smul32b_16b_x_16b = $unsigned(signed_result);
    end
  endfunction
  // lint_on MULTIPLY
  // lint_on SIGNED_TYPE
  wire [31:0] sign_ext_221;
  wire [31:0] smul_227;
  wire [15:0] sub_229;
  wire [15:0] add_230;
  assign sign_ext_221 = {{24{op[7]}}, op};
  assign smul_227 = smul32b_16b_x_16b(x, y);
  assign sub_229 = x - y;
  assign add_230 = x + y;
  assign out = {~(sign_ext_221 == 32'h0000_002a | sign_ext_221 == 32'h0000_002d | sign_ext_221 == 32'h0000_002b) ? 16'hffff : (sign_ext_221 != 32'h0000_002a ? (sign_ext_221 != 32'h0000_002d ? add_230 : sub_229) : smul_227[15:0])};
endmodule
