// Seed: 4170791976
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout supply0 id_3;
  input wire id_2;
  assign module_3._id_8 = 0;
  input wire id_1;
  assign id_3 = 1;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
  initial
  fork : SymbolIdentifier
  join : SymbolIdentifier
endmodule
module module_1 (
    output supply1 id_0,
    output supply0 id_1,
    input wor id_2,
    input wand module_2,
    input supply1 id_4
);
  parameter int id_6 = 1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_3 #(
    parameter id_4 = 32'd4,
    parameter id_6 = 32'd51,
    parameter id_8 = 32'd5
) (
    output uwire id_0,
    output tri id_1,
    output uwire id_2,
    output supply1 id_3,
    input wire _id_4,
    output wor id_5,
    input uwire _id_6,
    output wor id_7,
    input supply0 _id_8
);
  wire [id_8 : id_4] id_10;
  id_11(
      -1
  );
  wire id_12;
  ;
  wire id_13;
  xor primCall (id_1, id_11, id_14, id_10, id_13, id_12);
  logic [-1 'h0 : id_6] id_14;
  ;
  module_0 modCall_1 (
      id_11,
      id_12,
      id_11
  );
  assign id_1 = id_4;
  assign id_1 = -1'h0;
endmodule
