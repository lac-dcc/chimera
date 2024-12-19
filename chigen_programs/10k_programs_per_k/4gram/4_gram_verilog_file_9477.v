// Seed: 749280099
module module_0 (
    output tri0 id_0,
    input wor id_1,
    input tri0 id_2,
    input supply1 id_3,
    input wor id_4,
    input supply1 id_5,
    output wand id_6,
    input wor id_7
);
  assign id_6 = (1'b0);
  wire id_9;
  assign id_9 = id_2;
  wire id_10;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1
    , id_15,
    output supply1 id_2,
    input supply0 id_3,
    input wor id_4,
    output wand id_5,
    input wire id_6,
    input supply1 id_7,
    input tri id_8,
    input wor id_9,
    output tri1 id_10,
    output tri id_11,
    input wand id_12,
    output supply1 id_13
);
  always #1 begin : LABEL_0
    id_11 = id_3 | id_15;
  end
  module_0 modCall_1 (
      id_5,
      id_6,
      id_4,
      id_4,
      id_9,
      id_4,
      id_2,
      id_4
  );
  assign modCall_1.type_4 = 0;
  wire id_16;
  assign id_10 = 1;
endmodule
