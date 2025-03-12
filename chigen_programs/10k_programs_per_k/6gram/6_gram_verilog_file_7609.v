// Seed: 2062868912
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_8;
endmodule
module module_1 #(
    parameter id_1 = 32'd92
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  input logic [7:0] id_2;
  input wire _id_1;
  wire id_5 = id_2[id_1 :-1];
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_3
  );
  assign id_4 = id_3;
  assign id_5 = id_2;
endmodule
