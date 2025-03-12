// Seed: 3516174785
module module_0 (
    output uwire id_0
);
  assign id_0 = -1;
endmodule
module module_1 #(
    parameter id_4 = 32'd24,
    parameter id_7 = 32'd88
) (
    input  wor   id_0,
    output tri1  id_1,
    input  tri0  id_2,
    output wor   id_3,
    input  uwire _id_4
);
  logic [7:0] id_6;
  assign id_6[1 :-1] = id_4;
  static logic _id_7;
  module_0 modCall_1 (id_3);
  wire [id_7 : id_4  -  1] id_8;
endmodule
module module_2 #(
    parameter id_1 = 32'd83
);
  wire _id_1;
  wire id_2;
  logic [-1 : -1  <  id_1  (  1  )] id_3;
  wire id_4;
endmodule
module module_3 (
    id_1,
    id_2
);
  output wire id_2;
  output logic [7:0] id_1;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
