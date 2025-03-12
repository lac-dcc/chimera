// Seed: 4104103138
module module_0 (
    id_1,
    id_2,
    id_3
);
  output logic [7:0] id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3[1] = id_1;
endmodule
module module_1 #(
    parameter id_13 = 32'd36
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
    _id_13,
    id_14,
    id_15
);
  output wire id_15;
  input wire id_14;
  input wire _id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout logic [7:0] id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_2,
      id_11,
      id_8
  );
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = id_8[id_13];
endmodule
