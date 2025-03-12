// Seed: 3541328220
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_4;
endmodule
module module_1 #(
    parameter id_10 = 32'd89,
    parameter id_3  = 32'd72,
    parameter id_4  = 32'd8,
    parameter id_8  = 32'd58
) (
    id_1,
    id_2,
    _id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    _id_10,
    id_11,
    id_12
);
  inout wire id_12;
  input wire id_11;
  inout wire _id_10;
  inout wire id_9;
  output wire _id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire _id_4;
  module_0 modCall_1 (
      id_12,
      id_1,
      id_5
  );
  input wire _id_3;
  output logic [7:0] id_2;
  inout wire id_1;
  wire id_13 = !id_12;
  assign id_10 = id_5;
  assign id_2[id_10**id_3] = id_3 == 1;
  wire [id_10 : id_4] id_14 = $realtime;
  logic ["" : id_8] id_15;
  ;
endmodule
