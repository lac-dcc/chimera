// Seed: 3826179346
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
endmodule
module module_1 #(
    parameter id_1 = 32'd84
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout logic [7:0] id_5;
  input wire id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  inout wire _id_1;
  wire id_7;
  assign id_5[id_1 : 1'h0] = id_4;
  assign id_3[1] = id_3;
  always force id_3 = id_5;
  module_0 modCall_1 (
      id_7,
      id_2,
      id_4,
      id_7
  );
endmodule
