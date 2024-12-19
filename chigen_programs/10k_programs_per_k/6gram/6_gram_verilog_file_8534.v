// Seed: 887635070
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input wand id_2,
    input uwire id_3,
    input wand id_4,
    output supply0 id_5,
    output tri id_6
    , id_17,
    input wor id_7,
    input wor id_8,
    output supply0 id_9,
    input tri id_10,
    input wire id_11,
    output wand id_12,
    output tri0 id_13,
    input supply1 id_14,
    output supply0 id_15
);
  wire id_18;
  assign module_1.type_14 = 0;
  always @(1 or posedge 1) begin : LABEL_0
    id_9 = id_11;
  end
endmodule
module module_1 (
    output supply1 id_0,
    output wand id_1,
    input tri0 id_2,
    input uwire id_3,
    output tri id_4,
    input wor id_5,
    input tri id_6,
    output supply1 id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_3,
      id_5,
      id_1,
      id_7,
      id_6,
      id_3,
      id_0,
      id_6,
      id_5,
      id_7,
      id_1,
      id_3,
      id_0
  );
  wire id_10;
  assign id_0 = id_6;
endmodule
