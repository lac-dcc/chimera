// Seed: 601164596
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input tri1 id_2,
    output supply1 id_3
);
  assign id_3 = 1'h0;
endmodule
module module_1 (
    output wor id_0,
    input uwire id_1,
    output wor id_2,
    input uwire id_3,
    input uwire id_4,
    input tri id_5,
    output wand id_6,
    input uwire id_7,
    output uwire id_8,
    input supply0 id_9,
    output tri id_10,
    input tri id_11,
    output supply1 id_12,
    output wire id_13,
    output wire id_14,
    output tri1 id_15,
    input supply1 id_16
);
  assign id_0 = id_3;
  logic [7:0] id_18, id_19, id_20;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_11,
      id_13
  );
  assign modCall_1.id_2 = 0;
  always @(negedge 1 && (1 == id_3)) begin : LABEL_0
    if (id_4) if (id_7) id_6 = 1;
  end
  wire id_21;
  assign id_15 = id_1;
  wire id_22;
endmodule
