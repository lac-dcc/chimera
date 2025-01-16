// Seed: 3586088868
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    output supply1 id_2,
    input uwire id_3,
    output supply1 id_4,
    output tri1 id_5,
    output supply0 id_6,
    output supply0 id_7,
    output tri0 id_8,
    output wor id_9,
    input wand id_10,
    input tri0 id_11,
    input uwire id_12
);
  wire id_14, id_15;
  wire id_16;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    input tri id_2,
    output tri1 id_3,
    input supply1 id_4,
    input tri1 id_5
);
  supply1 id_7;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_7,
      id_2,
      id_3,
      id_3,
      id_7,
      id_3,
      id_7,
      id_3,
      id_0,
      id_2,
      id_7
  );
  assign modCall_1.type_5 = 0;
  wire id_8, id_9;
  always begin : LABEL_0
    id_7.id_2 = 1;
  end
endmodule
