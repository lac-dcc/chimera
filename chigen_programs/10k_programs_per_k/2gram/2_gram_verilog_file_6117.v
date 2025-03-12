// Seed: 3088689948
module module_0 (
    id_1#(.id_2(1 & -1'b0)),
    id_3,
    id_4,
    id_5#(
        .id_6(1),
        .id_7(id_8),
        .id_9(1'b0)
    ),
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  input wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  assign module_1.id_32 = 0;
  input wire id_1;
  parameter id_20 = -1;
endmodule
module module_1 #(
    parameter id_27 = 32'd95
) (
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
    id_24,
    id_25,
    id_26,
    _id_27,
    id_28,
    id_29,
    id_30,
    id_31
);
  inout wire id_31;
  output wire id_30;
  input wire id_29;
  output wire id_28;
  inout wire _id_27;
  input wire id_26;
  inout wire id_25;
  inout wire id_24;
  input wire id_23;
  inout wire id_22;
  inout wire id_21;
  inout wire id_20;
  output uwire id_19;
  inout wire id_18;
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  module_0 modCall_1 (
      id_6,
      id_29,
      id_20,
      id_12,
      id_30,
      id_7,
      id_6,
      id_4,
      id_18,
      id_25,
      id_15,
      id_9,
      id_3,
      id_20
  );
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout logic [7:0] id_2;
  inout wire id_1;
  id_32 :
  assert property (@(1) id_2[id_27 : 1'b0&&-1'b0])
  else;
  logic id_33;
endmodule
