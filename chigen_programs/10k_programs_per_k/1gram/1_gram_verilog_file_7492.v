// Seed: 545761021
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_8, id_9, id_10, id_11;
  wire id_12;
  assign module_1.id_4 = 0;
  logic id_13;
endmodule
module module_1 #(
    parameter id_10 = 32'd41,
    parameter id_9  = 32'd48
) (
    id_1,
    id_2[id_9 : id_10],
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    _id_10
);
  inout wire _id_10;
  output wire _id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_1,
      id_7,
      id_7,
      id_6
  );
  input wire id_5;
  output supply0 id_4;
  output wire id_3;
  output logic [7:0] id_2;
  input wire id_1;
  logic id_11 = id_11[id_10&-1];
  assign id_4 = 1'b0;
endmodule
