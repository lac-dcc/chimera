// Seed: 1265211049
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
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_6 = id_3;
  always
  fork
  join_none
  assign id_5 = id_7;
  assign id_6 = id_4;
endmodule
module module_1 #(
    parameter id_1 = 32'd89
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_5,
      id_5,
      id_2,
      id_4,
      id_5
  );
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire _id_1;
  reg id_7;
  initial id_7 <= -1'b0;
  wire [-1 : id_1] module_1;
  genvar id_8;
endmodule
