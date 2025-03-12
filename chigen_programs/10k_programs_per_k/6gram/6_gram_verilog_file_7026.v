// Seed: 2155432896
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd0
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout uwire id_7;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_7,
      id_7,
      id_7
  );
  output wire id_6;
  input wire id_5;
  input logic [7:0] id_4;
  input wire _id_3;
  output wire id_2;
  input wire id_1;
  assign id_7 = id_5;
  assign id_6 = id_7;
  assign id_7 = id_8 ? id_4 : -1 < id_4;
  assign id_6 = id_4[~id_3];
endmodule
