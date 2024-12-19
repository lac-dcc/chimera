// Seed: 2483246994
module module_0 (
    output uwire id_0,
    input wor id_1,
    input wand id_2,
    output tri1 id_3,
    input wire id_4,
    input supply0 id_5,
    input tri0 id_6,
    inout tri0 id_7,
    output tri1 id_8,
    input wand id_9,
    input tri0 id_10,
    output tri0 id_11,
    input tri0 id_12
    , id_16,
    output wor id_13,
    output tri id_14
);
  assign id_8  = 1;
  assign id_13 = id_10 ? 1 : 1;
endmodule
module module_1 (
    input  tri0  id_0,
    input  wor   id_1,
    input  uwire id_2,
    input  tri0  id_3,
    output wand  id_4
);
  assign id_4 = 1;
  assign id_4 = 1;
  genvar id_6;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_2,
      id_6,
      id_0,
      id_3,
      id_3,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_1,
      id_6,
      id_4
  );
  assign modCall_1.id_0 = 0;
  assign id_4 = 1;
  logic [7:0] id_7;
  assign id_7[1] = {id_0, id_6};
endmodule
