// Seed: 2338552410
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
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = -1'b0;
  bit id_8;
  always @(posedge 1 or posedge id_5) if (1) id_8 = 1 ? -1 : 1;
endmodule
module module_1 #(
    parameter id_11 = 32'd26
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
    _id_11,
    id_12
);
  inout wire id_12;
  output wire _id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_10,
      id_9,
      id_8,
      id_10,
      id_12
  );
  assign modCall_1.id_8 = 0;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  logic [1 : -1  ^  id_11] id_13;
endmodule
