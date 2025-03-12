// Seed: 844143273
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
  input wire id_5;
  output logic [7:0] id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_8;
  wire id_9;
  assign id_4[1] = 1 ? id_5 : id_8;
endmodule
module module_0 #(
    parameter id_5 = 32'd60
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    module_1,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  inout wire id_10;
  output logic [7:0] id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire _id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  xor primCall (id_6, id_8, id_11, id_10);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_10,
      id_9,
      id_6,
      id_2,
      id_6
  );
  assign id_9[1 : id_5] = -1'd0;
endmodule
