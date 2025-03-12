// Seed: 2625167867
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  always @(id_4 or 1) $clog2(18);
  ;
endmodule
module module_1 #(
    parameter id_7 = 32'd77
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
    id_11
);
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire _id_7;
  output wire id_6;
  module_0 modCall_1 (
      id_11,
      id_1,
      id_4,
      id_10
  );
  output logic [7:0] id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_12;
  assign id_11 = 1;
  assign id_5[{"", 1~^id_7} : 1] = -1;
endmodule
