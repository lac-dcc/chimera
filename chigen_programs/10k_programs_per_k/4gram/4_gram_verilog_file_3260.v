// Seed: 2496745733
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  wire \id_4 ;
endmodule
module module_0 #(
    parameter id_10 = 32'd39
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    module_1,
    id_12
);
  output wire id_12;
  input wire id_11;
  inout wire _id_10;
  inout wire id_9;
  output wire id_8;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5
  );
  input wire id_7;
  inout wire id_6;
  xnor primCall (id_5, id_6, id_4, id_2, id_7, id_9, id_3);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [-1 : id_10] id_13;
  wire id_14;
  ;
  wire id_15;
  assign #(id_5) id_5 = id_10;
endmodule
