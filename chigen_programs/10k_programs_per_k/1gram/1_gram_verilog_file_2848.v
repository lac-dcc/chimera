// Seed: 119318504
module module_0 #(
    parameter id_8 = 32'd9
) (
    output uwire id_0,
    input  wor   id_1,
    input  tri   id_2,
    input  tri0  id_3,
    output tri   id_4
);
  logic id_6;
  ;
  wire id_7;
  parameter id_8 = 1;
  wire  id_9;
  logic id_10;
  ;
  assign id_0 = id_10;
  logic id_11;
  wire [1 : id_8] id_12;
endmodule
module module_1 #(
    parameter id_1 = 32'd49
) (
    output supply1 id_0,
    input supply0 _id_1,
    input tri1 id_2
);
  wire [-1 : (  id_1  )] id_4;
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.id_8 = 0;
endmodule
