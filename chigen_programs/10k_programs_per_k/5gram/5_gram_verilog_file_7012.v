// Seed: 2295055184
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
    id_10
);
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  generate
    assign id_9 = 1'b0;
  endgenerate
endmodule
module module_1 #(
    parameter id_8 = 32'd45
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output logic [7:0] id_3;
  output wire id_2;
  input wire id_1;
  wire [-1 : (  1  )] _id_8;
  wire id_9;
  module_0 modCall_1 (
      id_9,
      id_6,
      id_6,
      id_1,
      id_7,
      id_7,
      id_6,
      id_7,
      id_7,
      id_6
  );
  wire id_10;
  assign id_3[id_8] = id_5 == id_8;
endmodule
