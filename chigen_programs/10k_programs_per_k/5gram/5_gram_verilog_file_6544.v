// Seed: 1758535617
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
    id_11,
    id_12
);
  output wire id_12;
  output wire id_11;
  inout logic [7:0] id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_10[-1] = id_5;
endmodule
module module_1 #(
    parameter id_4 = 32'd51,
    parameter id_6 = 32'd50
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  inout wire id_12;
  module_0 modCall_1 (
      id_12,
      id_7,
      id_10,
      id_9,
      id_9,
      id_10,
      id_11,
      id_9,
      id_13,
      id_2,
      id_13,
      id_8
  );
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  nor primCall (id_8, id_9, id_3, id_11, id_12, id_1, id_5, id_2, id_10, id_13);
  inout wire _id_6;
  input wire id_5;
  input wire _id_4;
  inout wire id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  wire id_14;
  assign id_2[-1'b0==1 : id_6*id_4-1'b0] = 1'd0;
endmodule
