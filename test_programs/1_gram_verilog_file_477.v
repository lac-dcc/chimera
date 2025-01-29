// Seed: 1384473842
module module_0 (
    input tri1 id_0,
    output tri id_1,
    input uwire id_2,
    input uwire id_3,
    input tri1 id_4,
    input wor id_5,
    input supply0 id_6
);
  assign id_1 = -1;
endmodule
module module_1 (
    input  tri   id_0,
    output wire  id_1,
    output wire  id_2,
    input  tri   id_3,
    output uwire id_4,
    output tri1  id_5,
    input  tri   id_6,
    input  tri   id_7
);
  module_0 modCall_1 (
      id_7,
      id_5,
      id_6,
      id_0,
      id_6,
      id_6,
      id_7
  );
  assign modCall_1.type_10 = 0;
endmodule
module module_2 (
    output tri1 id_0,
    output supply0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    input tri0 id_4,
    output supply1 id_5
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_2,
      id_3,
      id_4
  );
  assign modCall_1.type_10 = 0;
  uwire id_7, id_8, id_9;
  wire id_10;
  wire id_11, id_12, id_13;
  assign id_8 = 1;
  id_14(
      id_0
  );
endmodule
