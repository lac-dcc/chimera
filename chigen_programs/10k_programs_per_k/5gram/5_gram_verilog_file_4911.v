// Seed: 580673422
module module_0 (
    input  tri1  id_0,
    input  wor   id_1,
    input  wor   id_2,
    input  tri1  id_3,
    output wand  id_4,
    input  uwire id_5
);
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    input wand id_2,
    input tri id_3,
    output wire id_4,
    input supply1 id_5,
    input supply0 id_6
);
  assign id_4 = id_2 == -1'b0 ? 1'b0 : id_2;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_2,
      id_4,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2 (
    input supply0 id_0,
    input supply1 id_1,
    output tri1 id_2,
    input uwire id_3,
    output wire id_4,
    input wand id_5,
    input supply1 id_6,
    input wire id_7,
    input supply1 id_8,
    input supply0 id_9
);
  assign id_4 = -1 == -1'd0;
  assign id_4 = id_0;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_9,
      id_4,
      id_6
  );
endmodule
