// Seed: 698587018
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  wire [-1 : -1 'h0] id_9;
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd86
) (
    output wor id_0,
    output tri1 _id_1,
    input tri id_2,
    input supply1 id_3,
    input supply0 id_4,
    output supply1 id_5
);
  struct packed {
    logic [id_1 : !  1] id_7;
    logic id_8;
  } \id_9 ;
  ;
  module_0 modCall_1 (
      id_8,
      \id_9 ,
      id_7,
      \id_9 ,
      id_7,
      id_7,
      id_8,
      id_7
  );
  assign id_5 = \id_9 .id_8;
endmodule
