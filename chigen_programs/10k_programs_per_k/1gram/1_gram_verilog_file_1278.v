// Seed: 4001554383
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input tri0 id_2,
    input wor id_3,
    input tri0 id_4,
    output uwire id_5,
    input tri1 id_6,
    output supply0 id_7,
    input wand id_8,
    input tri id_9,
    input tri0 id_10
);
  assign id_7 = ~1;
  initial begin : LABEL_0
    id_7 = id_0;
  end
  wire id_12;
endmodule
module module_1 (
    output tri0 id_0,
    input tri1 id_1,
    output supply1 id_2,
    input uwire id_3,
    input supply1 id_4,
    input tri1 id_5,
    output supply0 id_6,
    input wire id_7,
    input tri1 id_8,
    output wand id_9
);
  assign id_6 = id_5;
  module_0 modCall_1 (
      id_7,
      id_8,
      id_5,
      id_1,
      id_5,
      id_6,
      id_7,
      id_2,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.type_5 = 0;
  id_11(
      1
  );
  always id_9 = 1;
endmodule
