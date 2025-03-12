// Seed: 1741224648
module module_0 #(
    parameter id_7 = 32'd0
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  assign id_3[1] = -1'b0;
  wire _id_7;
  assign id_2[id_7] = id_3;
endmodule
module module_1 #(
    parameter id_2 = 32'd87,
    parameter id_5 = 32'd8
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    _id_5
);
  inout wire _id_5;
  output logic [7:0] id_4;
  output wire id_3;
  output wire _id_2;
  output logic [7:0] id_1;
  parameter id_6 = -1;
  logic [7:0] id_7;
  ;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_7,
      id_6,
      id_6,
      id_6
  );
  assign id_2 = id_7[id_5];
endmodule
