// Seed: 1368954041
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
    id_15
);
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(id_1 or posedge id_5) id_9 <= (id_3);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_6 = id_2;
  id_7(
      .id_0(1), .id_1(1)
  );
  reg id_8;
  always @(1 + 1) id_8 <= id_1;
  assign id_3 = 1;
  reg id_9 = id_8;
  assign id_8 = 1;
  wire id_10, id_11;
  wire id_12;
  wire id_13;
  xnor primCall (id_6, id_10, id_12, id_1, id_15, id_13, id_11, id_5, id_9, id_14);
  wire id_14;
  wire id_15 = id_11;
  module_0 modCall_1 (
      id_14,
      id_12,
      id_9,
      id_14,
      id_10,
      id_4,
      id_2,
      id_15,
      id_9,
      id_13,
      id_10,
      id_11,
      id_11,
      id_13,
      id_10
  );
  wire id_16;
  wire id_17;
endmodule
