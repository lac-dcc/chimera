// Seed: 78583969
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output uwire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_7 = -1;
endmodule
module module_1 #(
    parameter id_10 = 32'd83,
    parameter id_5  = 32'd73,
    parameter id_7  = 32'd58
) (
    id_1,
    .id_9(id_2),
    id_3,
    id_4,
    _id_5,
    id_6,
    _id_7,
    id_8
);
  output uwire id_8;
  input wire _id_7;
  inout wire id_6;
  inout wire _id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  parameter [-1 : id_7] id_10 = 1 ^ 1'h0;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_1,
      id_8,
      id_4,
      id_6
  );
  wire [-1 'b0 : id_10  ==  id_5] id_11;
  assign id_8 = id_6 == -1 - id_10;
endmodule
