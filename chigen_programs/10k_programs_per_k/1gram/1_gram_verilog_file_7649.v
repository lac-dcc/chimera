// Seed: 2113770752
module module_0 (
    input wor id_0,
    input wor id_1,
    output wor id_2,
    output supply1 id_3,
    input supply1 id_4,
    input wand id_5,
    output uwire id_6,
    input supply0 id_7,
    input tri0 id_8,
    output tri id_9
    , id_19,
    output tri1 id_10,
    input tri1 id_11,
    output wand id_12,
    input tri0 id_13,
    input tri1 id_14,
    output supply1 id_15,
    input wor id_16,
    input wire id_17
);
  assign id_15 = id_1;
endmodule : SymbolIdentifier
module module_1 #(
    parameter id_2 = 32'd22,
    parameter id_5 = 32'd79,
    parameter id_6 = 32'd30,
    parameter id_7 = 32'd77,
    parameter id_9 = 32'd46
) (
    output tri0 id_0,
    input wand id_1,
    input wire _id_2,
    output supply0 id_3,
    input tri0 id_4,
    input tri1 _id_5[1 : ~  id_7],
    output wand _id_6,
    input tri _id_7[(  id_5  ) : id_6],
    input supply1 id_8,
    input uwire _id_9[id_2 : id_2],
    input supply0 id_10,
    input supply0 id_11
);
  always $signed(72);
  ;
  assign id_3 = -1'b0;
  union packed {logic id_13;} id_14;
  assign id_3 = id_5;
  assign id_14.id_13[id_9] = -1;
  assign id_14 = id_14.id_13;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_3,
      id_3,
      id_8,
      id_4,
      id_3,
      id_1,
      id_10,
      id_3,
      id_0,
      id_11,
      id_0,
      id_1,
      id_8,
      id_3,
      id_4,
      id_11
  );
  assign modCall_1.id_2 = 0;
  wire id_15;
  assign id_15 = id_1;
endmodule
