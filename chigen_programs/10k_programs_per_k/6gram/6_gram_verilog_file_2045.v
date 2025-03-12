// Seed: 3139279076
module module_0 (
    output tri   id_0,
    input  uwire id_1,
    output tri1  id_2
);
  assign module_1.id_2 = 0;
  assign id_0 = id_1;
  assign module_2.id_8 = 0;
  assign id_2 = id_1 ? id_1 : -1 + -1'b0;
endmodule
module module_1 (
    input  wand  id_0,
    input  tri0  id_1,
    output uwire id_2,
    output wire  id_3
);
  nor primCall (id_3, id_0, id_1);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3
  );
  wire id_5;
  assign id_5 = id_0;
endmodule
module module_2 #(
    parameter id_7 = 32'd21
) (
    input uwire id_0
    , id_11,
    input wire id_1,
    output supply0 id_2,
    input tri id_3,
    input supply1 id_4,
    output tri id_5,
    input supply1 id_6,
    input wand _id_7,
    input wire id_8,
    output wor id_9
);
  wire [id_7 : (  -1  )] id_12;
  uwire id_13 = -1;
  module_0 modCall_1 (
      id_9,
      id_3,
      id_9
  );
endmodule
