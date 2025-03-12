// Seed: 972246499
module module_0 (
    output wor   id_0,
    input  tri0  id_1,
    output wand  id_2,
    input  wand  id_3,
    input  uwire id_4,
    input  tri0  id_5,
    output tri0  id_6
);
  assign id_0 = id_5;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    output supply0 id_1,
    input uwire id_2,
    output wire id_3,
    output tri id_4,
    input supply1 id_5,
    output uwire id_6
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_2,
      id_5,
      id_0,
      id_1
  );
endmodule
module module_2 #(
    parameter id_0  = 32'd96,
    parameter id_10 = 32'd24
) (
    input  tri1 _id_0,
    output wor  id_1,
    input  tri0 id_2
);
  wire [id_0  ==  id_0 : -1] id_4;
  logic id_5 = -1;
  wire id_6, id_7, id_8;
  logic [7:0][-1 : -1] id_9;
  wire _id_10;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.id_1 = 0;
  assign id_9[-1'h0 : id_10] = id_8;
endmodule
