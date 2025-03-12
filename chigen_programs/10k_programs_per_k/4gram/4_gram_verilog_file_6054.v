// Seed: 1985170540
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
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  logic [1 : -1 'h0] id_8;
endmodule
module module_1 #(
    parameter id_5 = 32'd2,
    parameter id_9 = 32'd3
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire _id_9;
  module_0 modCall_1 (
      id_7,
      id_12,
      id_10,
      id_7,
      id_7,
      id_13,
      id_11
  );
  output wire id_8;
  inout wire id_7;
  output logic [7:0] id_6;
  input wire _id_5;
  inout logic [7:0] id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  or primCall (id_7, id_4, id_13);
  assign id_6[id_5] = id_4[id_9];
endmodule
