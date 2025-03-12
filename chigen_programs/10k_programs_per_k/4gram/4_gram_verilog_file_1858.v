// Seed: 2612854905
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_10;
endmodule
module module_1 #(
    parameter id_3 = 32'd19,
    parameter id_4 = 32'd70
) (
    id_1,
    id_2,
    _id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire _id_4;
  inout wire _id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_5,
      id_2,
      id_1,
      id_5,
      id_7,
      id_7,
      id_2
  );
  wire id_9;
  assign id_3 = id_4;
  wire [id_4 : id_3] id_10;
endmodule
