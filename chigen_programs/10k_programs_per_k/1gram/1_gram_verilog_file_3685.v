// Seed: 2040898244
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd59,
    parameter id_5 = 32'd18,
    parameter id_9 = 32'd38
) (
    id_1,
    id_2[1 : id_5],
    _id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11
);
  input wire id_11;
  output logic [7:0] id_10;
  input wire _id_9;
  inout reg id_8;
  inout tri0 id_7;
  module_0 modCall_1 (
      id_11,
      id_6
  );
  output wire id_6;
  output wire _id_5;
  inout wire id_4;
  inout wire _id_3;
  output logic [7:0] id_2;
  inout wire id_1;
  assign id_7  = 1;
  assign id_10 = id_7,  id_10[1 : id_9][id_9#(.id_3(1'd0))][-1] = "";
  assign id_5  = id_11;
  initial id_8 = id_1;
endmodule
