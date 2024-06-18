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
module DoubleSimpleArray(
  input wire [63:0] data,
  output wire [31:0] out
);
  wire [31:0] data_unflattened[0:1];
  assign data_unflattened[0] = data[31:0];
  assign data_unflattened[1] = data[63:32];
  wire [31:0] tuple_index_210;
  wire [31:0] tuple_index_211;
  wire [30:0] add_214;
  assign tuple_index_210 = data_unflattened[1'h0][31:0];
  assign tuple_index_211 = data_unflattened[1'h1][31:0];
  assign add_214 = tuple_index_210[30:0] + tuple_index_211[30:0];
  assign out = {{add_214, 1'h0}};
endmodule
