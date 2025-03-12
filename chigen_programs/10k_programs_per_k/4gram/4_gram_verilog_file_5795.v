// Seed: 1486052369
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
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  assign module_1.id_9 = 0;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_8 = id_6;
  wire id_9;
endmodule
module module_1 #(
    parameter id_4 = 32'd57
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  output wire id_5;
  output wire _id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_6;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_6,
      id_6,
      id_1,
      id_6,
      id_6,
      id_6
  );
  wire id_7;
  logic [id_4 : -1] id_8;
  logic [-1 : 1] id_9;
  ;
  assign id_9 = id_8 & id_6;
endmodule
