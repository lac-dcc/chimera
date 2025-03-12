// Seed: 2991635462
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_8;
  ;
  parameter id_9 = 1;
endmodule
module module_1 #(
    parameter id_1  = 32'd79,
    parameter id_10 = 32'd41
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  xnor primCall (id_7, id_3, id_9, id_2, id_5, id_6);
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire _id_1;
  logic [id_1 : -1] _id_10;
  ;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_2,
      id_5,
      id_6,
      id_7
  );
  logic [7:0][(  id_1  ) : 1  <<  id_10] id_11;
  assign id_11[1-id_1] = 1 + id_6;
  always_comb @(*);
endmodule
