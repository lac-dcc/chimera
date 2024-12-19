// Seed: 642605293
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
    id_22,
    id_23,
    id_24
);
  input wire id_24;
  input wire id_23;
  input wire id_22;
  output wire id_21;
  output wire id_20;
  inout wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_8 = 1'b0;
  assign id_3 = id_6;
  wire id_25;
  wire id_26;
  assign module_1.id_4 = 0;
  assign id_13 = 1 - 1;
  wire id_27;
  final id_16 = id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    assert ({id_2, id_2, 1} && id_2 && 1'h0);
  end
  uwire id_5 = 1'b0;
  uwire id_6;
  wire  id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_3,
      id_6,
      id_1,
      id_6,
      id_1,
      id_3,
      id_6,
      id_4,
      id_3,
      id_7,
      id_1,
      id_3,
      id_7,
      id_2,
      id_6,
      id_3,
      id_7,
      id_4,
      id_6,
      id_3,
      id_5
  );
  assign id_4 = id_2 ? 1 ? 1 : (1) : id_6;
  xnor primCall (id_3, id_1, id_7, id_6, id_2);
endmodule
