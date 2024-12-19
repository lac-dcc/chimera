// Seed: 2333322821
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    input wor id_2,
    input wand id_3,
    input wire id_4,
    output wand id_5,
    input wire id_6,
    input supply0 id_7
    , id_10,
    output tri1 id_8
);
  id_11(
      .id_0(id_7), .id_1(), .id_2(1), .id_3(1), .id_4(), .id_5(1)
  );
  wire id_12;
endmodule
module module_1 (
    output wand id_0,
    input supply0 id_1,
    input supply1 id_2,
    input wand id_3,
    input wand id_4,
    output wand id_5
    , id_15,
    input tri id_6,
    input wand id_7,
    input wire id_8,
    output wire id_9,
    input tri id_10,
    input tri id_11,
    output tri0 id_12,
    output tri1 id_13
);
  always @(id_6) begin : LABEL_0
    #1 id_15 = 1;
  end
  xor primCall (id_0, id_8, id_7, id_15, id_6);
  module_0 modCall_1 (
      id_0,
      id_11,
      id_4,
      id_4,
      id_4,
      id_0,
      id_7,
      id_4,
      id_0
  );
  assign modCall_1.type_15 = 0;
endmodule
