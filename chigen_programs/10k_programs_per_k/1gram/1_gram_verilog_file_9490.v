// Seed: 1603873432
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input tri id_2,
    input supply0 id_3,
    input wand id_4
);
  wire id_6, id_7;
  wire id_8;
  assign module_1.type_4 = 0;
  wire id_9;
endmodule
module module_1 (
    output supply0 id_0,
    output tri0 id_1,
    output supply1 id_2,
    input tri0 id_3,
    input wand id_4,
    output wire id_5,
    output tri id_6
);
  genvar id_8;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_3,
      id_3
  );
  id_9(
      id_2, 1
  );
endmodule
module module_2 (
    input  wor   id_0,
    input  wire  id_1,
    input  wor   id_2,
    input  uwire id_3,
    input  wor   id_4,
    input  uwire id_5,
    input  tri0  id_6,
    output uwire id_7,
    output tri   id_8,
    input  wire  id_9,
    input  uwire id_10
);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_9,
      id_9
  );
  assign modCall_1.id_3 = 0;
  assign id_8 = (1);
  assign id_7 = 1;
endmodule
