// Seed: 1019831885
module module_0 (
    input uwire id_0,
    output tri id_1,
    output supply0 id_2,
    input tri0 id_3,
    input tri1 id_4,
    output wor id_5
);
  logic id_7;
  assign id_2 = id_0 / id_4;
  logic id_8;
  assign id_7 = id_3;
  wire id_9, id_10;
endmodule
module module_1 #(
    parameter id_0 = 32'd46,
    parameter id_2 = 32'd66,
    parameter id_3 = 32'd67
) (
    output uwire _id_0,
    output tri0  id_1,
    input  tri1  _id_2,
    input  uwire _id_3[-1 : id_0],
    input  tri1  id_4,
    input  tri1  id_5,
    input  wand  id_6,
    input  tri   id_7
);
  logic id_9 = -1;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_1,
      id_4,
      id_5,
      id_1
  );
  assign modCall_1.id_2 = 0;
  parameter [(  -1  ) : id_3  +  (  id_2  )] id_10 = 1;
  assign id_9 = 1;
endmodule : SymbolIdentifier
