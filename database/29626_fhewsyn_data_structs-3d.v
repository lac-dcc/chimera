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
module DoubleSimpleArray3D(
  input wire [255:0] data,
  output wire [31:0] out
);
  wire [31:0] data_unflattened[0:1][0:1][0:1];
  assign data_unflattened[0][0][0] = data[31:0];
  assign data_unflattened[0][0][1] = data[63:32];
  assign data_unflattened[0][1][0] = data[95:64];
  assign data_unflattened[0][1][1] = data[127:96];
  assign data_unflattened[1][0][0] = data[159:128];
  assign data_unflattened[1][0][1] = data[191:160];
  assign data_unflattened[1][1][0] = data[223:192];
  assign data_unflattened[1][1][1] = data[255:224];
  wire [31:0] tuple_index_1288;
  wire [31:0] tuple_index_1289;
  wire [31:0] tuple_index_1290;
  wire [31:0] tuple_index_1291;
  wire [31:0] tuple_index_1292;
  wire [31:0] tuple_index_1293;
  wire [31:0] tuple_index_1294;
  wire [31:0] tuple_index_1295;
  wire [30:0] add_1304;
  wire [30:0] add_1305;
  wire [30:0] add_1306;
  wire [30:0] add_1307;
  wire [30:0] add_1308;
  wire [30:0] add_1309;
  wire [30:0] add_1310;
  assign tuple_index_1288 = data_unflattened[1'h0][1'h0][1'h0][31:0];
  assign tuple_index_1289 = data_unflattened[1'h0][1'h0][1'h1][31:0];
  assign tuple_index_1290 = data_unflattened[1'h0][1'h1][1'h0][31:0];
  assign tuple_index_1291 = data_unflattened[1'h0][1'h1][1'h1][31:0];
  assign tuple_index_1292 = data_unflattened[1'h1][1'h0][1'h0][31:0];
  assign tuple_index_1293 = data_unflattened[1'h1][1'h0][1'h1][31:0];
  assign tuple_index_1294 = data_unflattened[1'h1][1'h1][1'h0][31:0];
  assign tuple_index_1295 = data_unflattened[1'h1][1'h1][1'h1][31:0];
  assign add_1304 = tuple_index_1288[30:0] + tuple_index_1289[30:0];
  assign add_1305 = tuple_index_1290[30:0] + tuple_index_1291[30:0];
  assign add_1306 = tuple_index_1292[30:0] + tuple_index_1293[30:0];
  assign add_1307 = tuple_index_1294[30:0] + tuple_index_1295[30:0];
  assign add_1308 = add_1304 + add_1305;
  assign add_1309 = add_1306 + add_1307;
  assign add_1310 = add_1308 + add_1309;
  assign out = {{add_1310, 1'h0}};
endmodule
