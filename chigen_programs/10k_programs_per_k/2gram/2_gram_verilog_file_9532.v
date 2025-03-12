// Seed: 1836627425
module module_0 (
    input supply0 id_0,
    input wor id_1,
    output supply0 id_2
);
  assign id_2 = id_0;
  parameter id_4 = 1;
  logic id_5;
  ;
  wire id_6;
  wire id_7;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    inout wire id_0,
    input supply0 id_1,
    input supply1 id_2,
    input uwire id_3
);
  wire id_5 = id_0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0
  );
endmodule
module module_2 (
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
    id_14
);
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_15;
  wire id_16 = id_10 - -1;
endmodule
module module_3 #(
    parameter id_15 = 32'd32
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
    _id_15,
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
    id_26
);
  output wire id_26;
  output wire id_25;
  inout wire id_24;
  input wire id_23;
  inout wire id_22;
  input wire id_21;
  output wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  inout reg id_16;
  input wire _id_15;
  inout wire id_14;
  input wire id_13;
  inout logic [7:0] id_12;
  module_2 modCall_1 (
      id_22,
      id_6,
      id_3,
      id_8,
      id_24,
      id_2,
      id_3,
      id_19,
      id_6,
      id_9,
      id_3,
      id_14,
      id_22,
      id_13
  );
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always_latch begin : LABEL_0
    id_16 <= id_15;
    {-1, id_12[id_15], {1, id_15}, id_16, id_11 - id_24 == {-1 !=? id_24, id_13}, id_13} <= id_6;
  end
  wire id_27;
  always begin : LABEL_1
    force id_27 = 1'h0;
  end
endmodule
