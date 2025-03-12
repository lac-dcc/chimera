// Seed: 466011170
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    input wand id_2,
    output tri id_3,
    input tri0 id_4,
    output uwire id_5
);
  id_7 :
  assert property (@(posedge id_0) {id_2} | -1) id_7 = id_7 != -1;
  else @(1) $unsigned(80);
  ;
  assign id_7 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd20,
    parameter id_5 = 32'd41
) (
    input  tri1 id_0,
    output tri  id_1,
    input  wand _id_2,
    output wor  id_3,
    input  wor  id_4,
    input  wand _id_5
);
  wire [~  id_5 : (  id_2  )  |  id_5] id_7[(  -1  ) : 1];
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_1,
      id_4,
      id_1
  );
  assign modCall_1.id_3 = 0;
  parameter id_8 = -1'b0;
  nand primCall (id_1, id_4, id_7, id_0);
  wire id_9, id_10, id_11;
  parameter id_12 = id_8 - 1;
endmodule
