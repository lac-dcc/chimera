// Seed: 2559341442
module module_0;
  wire id_1;
  wire id_2;
  assign module_1._id_1 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd50,
    parameter id_1 = 32'd92
) (
    output tri0 _id_0,
    input supply1 _id_1
);
  struct packed {
    logic [1 : !  id_0] id_3;
    logic [id_1 : 1] id_4;
  } [-1 : -1 'h0] id_5;
  ;
  parameter id_6 = 1;
  module_0 modCall_1 ();
  wand [id_1 : -1] id_7 = id_1;
  assign #(-1, id_5.id_4 - id_6) id_7 = -1;
endmodule
module module_2 #(
    parameter id_1 = 32'd53
) (
    input  tri1 id_0,
    input  wand _id_1,
    output tri0 id_2,
    input  wand id_3,
    output tri0 id_4
);
  nand primCall (id_2, id_3, id_6);
  logic [1 'b0 : id_1] id_6;
  ;
  module_0 modCall_1 ();
endmodule
