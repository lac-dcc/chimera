// Seed: 639420383
module module_0 (
    id_1,
    id_2
);
  output logic [7:0] id_2;
  output wire id_1;
  assign id_2[1] = -1;
endmodule
module module_1 #(
    parameter id_9 = 32'd60
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  inout logic [7:0] id_2;
  input wire id_1;
  wire _id_9;
  generate
    always id_2[id_9 : 1] = 1;
  endgenerate
endmodule
