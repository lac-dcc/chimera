// Seed: 407996595
module module_0 (
    id_1
);
  output wire id_1;
  wire id_2;
endmodule
module module_1 #(
    parameter id_10 = 32'd91
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
    _id_10
);
  inout wire _id_10;
  module_0 modCall_1 (id_4);
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  or primCall (id_4, id_5, id_8, id_6, id_9, id_7);
  output wire id_4;
  output logic [7:0] id_3;
  output wire id_2;
  output wire id_1;
  assign id_3[id_10] = id_7;
endmodule
