// Seed: 2902837508
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8#(.id_9(-1'd0)),
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
    id_22,
    id_23,
    id_24
);
  inout wire id_23;
  input wire id_22;
  input wire id_21;
  inout wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  wor   id_1,
    input  tri1  id_2,
    output tri   id_3
);
  uwire id_5, id_6, id_7;
  assign id_3 = id_2;
  assign id_6 = 1;
  nor primCall (id_3, id_6, id_5, id_1);
  module_0 modCall_1 (
      id_5,
      id_6,
      id_7,
      id_5,
      id_6,
      id_6,
      id_6,
      id_5,
      id_6,
      id_6,
      id_7,
      id_5,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_6,
      id_5,
      id_7,
      id_6,
      id_6,
      id_7
  );
  wire id_8;
  tri0 id_9 = -1'h0 ? -1 : 1;
  tri  id_10 = -1;
  parameter id_11 = 1'h0;
endmodule
