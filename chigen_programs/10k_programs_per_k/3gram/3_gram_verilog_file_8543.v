// Seed: 1944678889
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
    id_14,
    id_15,
    id_16,
    id_17
);
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout tri id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output uwire id_1;
  assign id_5 = (1);
  assign id_1 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd44
) (
    _id_1,
    id_2
);
  output logic [7:0] id_2;
  input wire _id_1;
  always @(posedge -1 or -1);
  buf primCall (id_2, id_3);
  logic id_3;
  ;
  assign id_2[id_1] = 1;
  always_ff @(*) cover (id_1);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
