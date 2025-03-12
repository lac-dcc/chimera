// Seed: 3715951863
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic [1 : 1 'h0] id_10[-1 : -1];
  ;
endmodule
module module_1 #(
    parameter id_11 = 32'd28,
    parameter id_12 = 32'd25,
    parameter id_7  = 32'd91
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    _id_11
);
  inout wire _id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire _id_7;
  and primCall (id_3, id_1, id_8, id_10, id_9);
  module_0 modCall_1 (
      id_1,
      id_10,
      id_10,
      id_9,
      id_9,
      id_9,
      id_8,
      id_10,
      id_1
  );
  output wire id_6;
  output wire id_5;
  output logic [7:0] id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4[id_7<id_11] = -1'b0;
  logic _id_12 = id_1#(.id_7(1));
  assign id_4[id_12] = id_1;
endmodule
