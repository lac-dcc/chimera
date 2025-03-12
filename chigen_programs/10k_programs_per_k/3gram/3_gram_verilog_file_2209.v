// Seed: 1551512033
module module_0 #(
    parameter id_8 = 32'd81
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output logic [7:0] id_1;
  wire _id_8;
  wire id_9;
  assign id_9 = -1;
  wire id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output logic [7:0] id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3
  );
  assign id_2[1] = id_3;
endmodule
