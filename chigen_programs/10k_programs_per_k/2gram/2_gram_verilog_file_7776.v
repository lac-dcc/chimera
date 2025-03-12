// Seed: 345403331
module module_0 (
    output tri1 id_0,
    input supply0 id_1,
    input wor id_2,
    input supply0 id_3,
    output uwire id_4,
    input supply0 id_5
);
  parameter id_7 = 1;
  wire id_8;
endmodule
module module_1 #(
    parameter id_2 = 32'd16,
    parameter id_3 = 32'd60
) (
    input  uwire id_0,
    input  uwire id_1,
    input  tri0  _id_2,
    input  wor   _id_3,
    output wor   id_4
);
  wire [id_2 : id_3] id_6;
  assign id_4 = 1;
  nor primCall (id_4, id_7, id_0);
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_0,
      id_0,
      id_4,
      id_1
  );
  assign modCall_1.id_5 = 0;
endmodule
