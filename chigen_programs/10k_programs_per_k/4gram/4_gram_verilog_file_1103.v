// Seed: 2319795375
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input tri1 id_2,
    input tri1 id_3
    , id_18,
    input wand id_4,
    output tri0 id_5,
    input wand id_6,
    input supply0 id_7,
    output supply0 id_8,
    output wor id_9,
    output wire id_10,
    input tri1 id_11,
    input tri id_12,
    output supply1 id_13,
    input wire id_14,
    output uwire id_15,
    input wand id_16
);
  assign id_9 = id_0;
  assign id_9 = id_2;
  wire id_19;
  always @({id_1{~id_16}} + 1) begin : LABEL_0
    id_8 -= -1'b0;
  end
  wire id_20;
  assign module_1.type_9 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    output tri0 id_1,
    input tri id_2,
    input tri1 id_3,
    output tri0 id_4,
    input wand id_5,
    output supply1 id_6,
    input tri id_7
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_3,
      id_4,
      id_5,
      id_5,
      id_6,
      id_6,
      id_4,
      id_7,
      id_5,
      id_6,
      id_2,
      id_6,
      id_0
  );
endmodule
