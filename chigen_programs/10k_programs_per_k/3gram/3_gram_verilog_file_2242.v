// Seed: 205557733
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd7
) (
    id_1,
    _id_2
);
  input wire _id_2;
  output logic [7:0] id_1;
  wire [-1  |  id_2 : 1 'b0] id_3 = id_2;
  parameter id_4 = 1;
  assign id_1[1] = id_2 + -1'd0;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3
  );
endmodule
