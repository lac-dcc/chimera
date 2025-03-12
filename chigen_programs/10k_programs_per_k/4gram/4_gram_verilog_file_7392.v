// Seed: 4205177644
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_5;
  parameter id_6 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd94,
    parameter id_4 = 32'd39,
    parameter id_5 = 32'd95
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_8,
      id_7
  );
  input wire _id_5;
  inout wire _id_4;
  output wire id_3;
  input wire id_2;
  inout wire _id_1;
  union packed {
    logic [id_5  ==?  id_1 : id_4] id_9;
    logic [1 'b0 : id_5] id_10;
  } id_11;
  assign id_11.id_9[-1] = -1;
  tri id_12;
  assign id_12 = -1;
endmodule
