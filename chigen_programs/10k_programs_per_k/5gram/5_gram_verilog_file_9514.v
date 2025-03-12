// Seed: 3772931075
module module_0 #(
    parameter id_1 = 32'd33
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire _id_1;
  assign module_1.id_7 = 0;
  logic id_6[1 : id_1];
  ;
endmodule
module module_1 #(
    parameter id_14 = 32'd45,
    parameter id_4  = 32'd14
) (
    output supply1 id_0,
    output tri0 id_1,
    output wor id_2,
    output logic id_3,
    input supply1 _id_4,
    output logic id_5,
    output wand id_6,
    output wor id_7,
    input wor id_8,
    input uwire id_9,
    input supply1 id_10
);
  parameter id_12 = 1;
  assign id_2 = id_8 <= 1;
  assign id_5 = id_4 ? -1 : 1 ? id_4 : id_12;
  wire id_13 = id_8;
  parameter id_14 = -1 < 1;
  always @* id_3 = id_9;
  wor  [ id_4 : -1] id_15 = ((id_14)) < (id_9);
  wire [-1 : id_14] id_16 = id_12;
  module_0 modCall_1 (
      id_14,
      id_12,
      id_12,
      id_12,
      id_16
  );
  initial id_5 = id_16;
  assign id_2 = id_16;
endmodule
