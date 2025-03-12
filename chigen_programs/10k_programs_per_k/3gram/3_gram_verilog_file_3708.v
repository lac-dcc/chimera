// Seed: 4138720496
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
endmodule
module module_1 #(
    parameter id_5 = 32'd46,
    parameter id_8 = 32'd39
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10
);
  output wire id_10;
  input wire id_9;
  output wire _id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_4
  );
  input wire id_6;
  input wire _id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  struct {
    logic id_11;
    logic [id_8 : -1] id_12;
  } id_13;
  ;
  wire [1 : id_5] id_14;
  assign id_2 = id_13.id_12++;
endmodule
