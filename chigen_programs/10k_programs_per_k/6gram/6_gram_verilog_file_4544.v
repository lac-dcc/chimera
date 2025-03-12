// Seed: 2765046744
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic [-1 : -1] id_8;
endmodule
module module_1 #(
    parameter id_4 = 32'd88
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire _id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [-1  +  id_4 : 1] id_7 = 1;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_3,
      id_2,
      id_1,
      id_5,
      id_6
  );
  and primCall (id_6, id_5, id_7, id_2, id_3);
endmodule
