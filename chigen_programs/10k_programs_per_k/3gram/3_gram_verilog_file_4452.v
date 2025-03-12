// Seed: 3384507651
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd49,
    parameter id_4 = 32'd35
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  input wire _id_4;
  inout logic [7:0] id_3;
  input wire _id_2;
  input wire id_1;
  assign id_3[id_4 :-1] = 1;
  wire [1 : ~  id_2] id_7;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_7,
      id_6,
      id_6,
      id_6,
      id_1,
      id_7,
      id_6,
      id_7,
      id_5
  );
  assign id_5 = id_6;
  wire [id_2 : -1] id_8;
  assign id_6 = 1;
endmodule
