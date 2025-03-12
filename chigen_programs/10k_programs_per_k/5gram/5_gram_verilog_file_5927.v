// Seed: 2442533429
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    input wand id_2,
    input tri1 id_3,
    input uwire id_4,
    input tri0 id_5
);
  assign id_0 = 1;
  tri1 id_7 = -1;
  wor  id_8 = {-1'b0, id_2};
endmodule
module module_1 (
    input  tri1 id_0,
    output tri0 id_1
);
  logic id_3;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    output tri1  id_0,
    input  tri1  id_1,
    input  wand  id_2,
    output tri0  id_3,
    input  wand  id_4,
    input  uwire id_5
    , id_7
);
  wire id_8;
  and primCall (id_0, id_8, id_2, id_9, id_1, id_7, id_10, id_4);
  parameter id_9 = 1;
  wire id_10;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_4,
      id_1,
      id_4,
      id_5
  );
endmodule
