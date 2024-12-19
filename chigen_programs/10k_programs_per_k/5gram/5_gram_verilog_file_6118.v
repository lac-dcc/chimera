// Seed: 1102312972
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input wand id_2,
    input uwire id_3,
    input tri0 id_4,
    input tri id_5,
    output wor id_6,
    input supply1 id_7,
    output wire id_8,
    output wor id_9,
    input tri0 id_10,
    output supply1 id_11
);
  wire id_13;
  assign id_8 = 1;
endmodule
module module_1 (
    output wire id_0,
    output tri0 id_1
    , id_6 = 1,
    input  wire id_2,
    input  wor  id_3,
    output tri0 id_4
);
  always @* begin : LABEL_0
    id_1 = id_6;
    id_6 += 1'b0;
  end
  module_0 modCall_1 (
      id_1,
      id_6,
      id_2,
      id_3,
      id_2,
      id_3,
      id_4,
      id_6,
      id_1,
      id_6,
      id_6,
      id_1
  );
  assign modCall_1.type_14 = 0;
endmodule
