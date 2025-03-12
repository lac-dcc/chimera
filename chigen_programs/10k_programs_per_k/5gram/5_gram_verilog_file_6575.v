// Seed: 3592667590
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  genvar id_8;
endmodule
module module_1 #(
    parameter id_4 = 32'd63
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_8,
      id_1,
      id_8,
      id_1,
      id_7
  );
  input wire id_6;
  input logic [7:0] id_5;
  inout wire _id_4;
  output logic [7:0] id_3;
  output wire id_2;
  nor primCall (id_2, id_7, id_8, id_6, id_1, id_5);
  inout wire id_1;
  assign id_3[1==id_4] = id_5[id_4][-1];
endmodule
