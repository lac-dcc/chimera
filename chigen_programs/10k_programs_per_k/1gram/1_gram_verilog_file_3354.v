// Seed: 2390893874
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_7 = 32'd78,
    parameter id_8 = 32'd88
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5[1'b0 : id_8&id_7],
    id_6,
    _id_7,
    _id_8
);
  input wire _id_8;
  input wire _id_7;
  inout wire id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_6,
      id_1,
      id_4
  );
  output logic [7:0] id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  parameter id_9 = 1;
  assign id_5 = id_4;
  wire id_10;
endmodule
