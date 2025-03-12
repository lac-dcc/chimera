// Seed: 1993938954
module module_0 (
    input tri0 id_0,
    input wor id_1
    , id_4,
    output supply1 id_2
);
  parameter id_5 = {1, -1, 1'd0, 1};
  assign module_1.id_6 = 0;
  wire id_6;
  ;
  wire id_7;
  ;
  assign id_2 = id_6;
endmodule
module module_1 #(
    parameter id_2 = 32'd96
) (
    output tri0 id_0,
    input tri id_1,
    input wor _id_2,
    input supply0 id_3,
    output tri0 id_4,
    input tri0 id_5
    , id_10,
    input wand id_6,
    inout supply1 id_7,
    output tri0 id_8
);
  wire [-1 : id_2] id_11;
  nand primCall (id_4, id_1, id_7, id_5, id_3, id_10, id_6, id_11);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4
  );
endmodule
