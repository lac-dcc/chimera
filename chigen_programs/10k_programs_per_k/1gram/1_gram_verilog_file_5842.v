// Seed: 1590848480
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = 1'b0;
  supply0 id_10 = id_8 ? 1 !== 1 : 1, id_11;
endmodule
module module_1 (
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
  input wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  id_16(
      1, 1'b0, (1)
  );
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_11,
      id_10,
      id_10,
      id_12,
      id_4,
      id_1
  );
  assign modCall_1.id_8 = 0;
  wire id_17;
  nand primCall (id_1, id_13, id_9, id_11, id_12, id_8, id_16, id_2, id_10, id_6, id_7, id_4);
  assign id_4 = 1;
  wire id_18;
  reg  id_19;
  reg id_20, id_21, id_22;
  assign id_21 = id_13;
  wire id_23, id_24;
  id_25 :
  assert property (@(posedge "" ? 1 : id_21) 1) id_22 <= id_19;
  wire id_26;
  assign id_17 = (1'b0);
  assign id_9  = id_11;
  wire id_27;
endmodule
