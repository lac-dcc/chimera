// Seed: 1163505941
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  input wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_23;
  assign id_2[1] = id_5;
  genvar id_24;
  always id_6 <= #1 id_19;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  logic [7:0] id_7;
  logic [7:0] id_8;
  wire id_9;
  assign id_7 = id_3;
  always force id_7 = id_8[1];
  wire id_10;
  module_0 modCall_1 (
      id_10,
      id_8,
      id_5,
      id_9,
      id_5,
      id_4,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_5,
      id_6,
      id_10,
      id_9,
      id_6,
      id_6,
      id_6,
      id_4,
      id_10,
      id_6,
      id_2
  );
  always id_4 <= #1 id_3[""+:1'b0];
endmodule
