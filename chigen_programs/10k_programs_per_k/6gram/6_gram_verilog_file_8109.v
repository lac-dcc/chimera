// Seed: 3864884952
module module_0 (
    output tri0 id_0,
    output wor  id_1,
    output tri  id_2,
    input  tri  id_3,
    output tri1 id_4
);
  assign module_0 = -1'd0;
  assign id_2 = id_3;
endmodule
module module_1 #(
    parameter id_0 = 32'd90
) (
    input supply1 _id_0,
    input tri0 id_1,
    output tri0 id_2,
    output supply1 id_3
);
  struct packed {
    logic [1 : !  id_0] id_5;
    logic id_6;
  } id_7;
  logic id_8;
  ;
  assign id_2 = {id_7, id_7 - id_0, id_8} - 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
