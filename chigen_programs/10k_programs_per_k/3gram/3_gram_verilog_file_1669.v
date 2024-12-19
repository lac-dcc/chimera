// Seed: 2748380071
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  supply0 id_3 = 1;
  wire id_4;
  wire id_5;
  wire id_6;
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
    id_14
);
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = "";
  assign id_5 = id_11;
  and primCall (id_11, id_4, id_13, id_8, id_5, id_14, id_1, id_6, id_3, id_2);
  assign id_6 = 1;
  module_0 modCall_1 (
      id_8,
      id_4
  );
  assign modCall_1.type_7 = 0;
  always_latch
    if (!id_2) begin : LABEL_0
      id_11 <= id_6;
      id_14 <= id_11;
    end else id_13 = id_11;
endmodule
