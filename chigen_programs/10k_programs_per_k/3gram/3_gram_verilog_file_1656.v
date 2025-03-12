// Seed: 2363243276
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd14,
    parameter id_5 = 32'd73
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6
);
  output wire id_6;
  output wire _id_5;
  input wire id_4;
  output wire _id_3;
  input wire id_2;
  output wire id_1;
  struct packed {
    logic [-1 : {  id_3  ,  id_5  }  -  id_5] id_7;
    logic [1 'b0 : id_5] id_8;
  } id_9 = id_9.id_8;
  module_0 modCall_1 (
      id_7,
      id_8,
      id_9,
      id_4,
      id_8,
      id_4
  );
endmodule
