// Seed: 2542887732
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout supply1 id_1;
  assign id_1 = {1, '0};
  wire id_3;
  parameter id_4 = 1;
  assign module_1.id_1 = 0;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  inout tri0 id_1;
  assign id_1 = 1;
endmodule
module module_2 #(
    parameter id_1 = 32'd10
) (
    output wor  id_0,
    input  wor  _id_1,
    output wor  id_2,
    input  wand id_3,
    input  tri0 id_4,
    input  tri  id_5,
    input  tri1 id_6
);
  wire [-1 'h0 : (  id_1  )] id_8;
  xor primCall (id_2, id_3, id_5, id_4, id_8);
  module_0 modCall_1 (
      id_8,
      id_8
  );
endmodule
