// Seed: 3991082123
module module_0 (
    input supply0 id_0,
    output wire id_1,
    input wor id_2,
    input tri1 id_3,
    input wand id_4,
    input uwire id_5,
    input wor id_6,
    input tri1 id_7,
    output supply0 id_8,
    input tri id_9,
    output tri1 id_10,
    output supply1 id_11,
    input supply1 id_12,
    input uwire id_13,
    output tri id_14,
    input tri id_15,
    output supply1 id_16,
    output tri id_17,
    output wire id_18
);
  assign id_10 = id_4;
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    output wor id_2,
    output uwire id_3
);
  always @(1 or posedge 1) begin : LABEL_0
    disable id_5;
  end
  module_0 modCall_1 (
      id_0,
      id_3,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_3,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_3,
      id_0,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.type_6 = 0;
endmodule
