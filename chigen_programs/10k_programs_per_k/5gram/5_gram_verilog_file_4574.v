// Seed: 628880664
module module_0 (
    output tri0 id_0,
    input  tri1 id_1,
    output tri0 id_2
);
  assign id_0 = id_1 ? id_1 : -1;
endmodule
module module_1 #(
    parameter id_13 = 32'd99,
    parameter id_4  = 32'd24
) (
    output supply1 id_0,
    output tri id_1,
    input supply1 id_2,
    output tri1 id_3,
    input uwire _id_4,
    inout tri1 id_5,
    input wor id_6,
    output uwire id_7,
    input tri id_8,
    input uwire id_9
);
  parameter id_11 = 1 != 1;
  and primCall (id_5, id_8, id_6, id_11, id_9, id_2);
  assign id_7 = 1;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5
  );
  assign modCall_1.id_0 = 0;
  wire id_12;
  wire [-1 : 1] _id_13;
  generate
    assign id_3 = -1 ? 1 - id_2 : id_11 ? {id_11[id_4 : id_13] & id_6, id_11} : id_12;
  endgenerate
endmodule
