// Seed: 2592052333
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout logic [7:0] id_1;
  final $clog2(36);
  ;
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd24,
    parameter id_4 = 32'd14
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7
);
  inout logic [7:0] id_7;
  inout wire id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_1,
      id_6
  );
  inout wire _id_4;
  output logic [7:0] id_3;
  input wire _id_2;
  inout logic [7:0] id_1;
  wire id_8;
  assign id_1[id_2] = 1;
  assign id_8 = id_7[id_4];
  assign id_3[1] = -1 || 1;
endmodule
