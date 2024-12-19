// Seed: 1447376810
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    output tri0 id_2,
    output wor id_3,
    input tri0 id_4
);
  wire id_6;
endmodule
module module_1 (
    input wire id_0,
    output supply0 id_1,
    input logic id_2,
    input wor id_3,
    output supply1 id_4,
    output wand id_5,
    input wand id_6,
    input tri id_7,
    input uwire id_8,
    inout logic id_9,
    output uwire id_10,
    inout wor id_11,
    input wor id_12,
    output uwire id_13,
    output uwire id_14,
    input uwire id_15,
    input supply1 id_16,
    input supply0 id_17,
    input supply1 id_18,
    output tri id_19
);
  genvar id_21;
  initial begin : LABEL_0
    id_9 <= 1;
  end
  wire id_22;
  initial begin : LABEL_0
    id_21[1'd0] <= id_2;
  end
  final $display(1);
  module_0 modCall_1 (
      id_3,
      id_16,
      id_1,
      id_19,
      id_0
  );
  assign modCall_1.type_2 = 0;
endmodule
