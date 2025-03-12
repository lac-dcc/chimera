// Seed: 4086651296
module module_0 (
    input type_12 id_0,
    output uwire id_1,
    input supply1 id_2,
    output wand id_3,
    output tri id_4,
    input wand id_5,
    input tri0 id_6,
    output tri1 id_7,
    input tri0 id_8,
    input wire id_9,
    output tri id_10
);
  supply0 module_0;
  ;
endmodule
module module_1 (
    input  tri1  id_0,
    input  wire  id_1,
    input  uwire id_2,
    output uwire id_3
);
  assign id_3 = id_0;
  not primCall (id_3, id_2);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_0,
      id_3,
      id_3,
      id_1,
      id_2,
      id_3,
      id_2,
      id_0,
      id_3
  );
  assign modCall_1.id_0 = 0;
  wire [-1 : ""] id_5;
endmodule
