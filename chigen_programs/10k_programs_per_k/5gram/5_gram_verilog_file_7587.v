// Seed: 746830009
module module_0 #(
    parameter id_6 = 32'd6
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wor id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire [-1 : 1] _id_6;
  assign id_5 = -1'b0;
  wire [-1 : id_6] id_7;
endmodule
module module_1 #(
    parameter id_14 = 32'd44
) (
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
    _id_14,
    id_15,
    id_16,
    id_17
);
  inout wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire _id_14;
  input wire id_13;
  output logic [7:0] id_12;
  inout wire id_11;
  inout logic [7:0] id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  or primCall (id_10, id_15, id_9, id_1, id_17, id_11, id_6, id_13, id_4);
  output wire id_5;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_16,
      id_11,
      id_15
  );
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_10[id_14] = ~id_17;
  parameter id_18 = {-1'd0 == 1, 1 && -1};
  assign id_12[1] = ~id_11 - id_10[-1];
endmodule
