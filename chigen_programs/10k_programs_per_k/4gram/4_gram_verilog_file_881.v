// Seed: 2299022038
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
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  assign module_1.id_3 = 0;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_15;
  wire id_16;
  ;
  logic id_17;
endmodule
module module_1 #(
    parameter id_3 = 32'd62,
    parameter id_4 = 32'd6
) (
    id_1,
    id_2,
    _id_3,
    _id_4
);
  input wire _id_4;
  input wire _id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  assign id_1 = id_2;
  assign id_2 = id_2[id_3] ? id_4 : id_4;
  logic [id_3  !=  id_4 : 1] id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_1,
      id_5,
      id_5
  );
endmodule
