// Seed: 4109259512
module module_0 (
    output tri0 id_0,
    input supply1 id_1,
    output uwire id_2,
    output supply1 id_3,
    input supply0 id_4
);
  logic id_6, id_7;
  assign module_1.id_5 = 0;
  assign id_2 = id_7;
  tri0 id_8 = 1;
  assign module_2.id_5 = 0;
endmodule
module module_1 (
    output wand id_0,
    output wire id_1,
    input  wor  id_2
);
  wire id_4;
  assign id_1 = -1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_0,
      id_1,
      id_2
  );
  logic id_5 = 1;
endmodule
module module_2 #(
    parameter id_0  = 32'd68,
    parameter id_11 = 32'd87
) (
    output wand _id_0,
    output wand id_1,
    input supply0 id_2,
    input tri id_3,
    inout tri id_4,
    input tri1 id_5,
    input tri id_6,
    input tri id_7,
    output tri id_8[id_11 : id_0],
    output supply0 id_9[id_0 : id_11],
    output tri1 id_10,
    input wand _id_11
);
  assign id_9 = (id_11);
  or primCall (id_9, id_6, id_4, id_2, id_7, id_3);
  module_0 modCall_1 (
      id_10,
      id_6,
      id_10,
      id_9,
      id_5
  );
endmodule
