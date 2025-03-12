// Seed: 2266544504
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = 1 + id_3;
endmodule
module module_1 #(
    parameter id_1 = 32'd28,
    parameter id_6 = 32'd27
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input logic [7:0] id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_5,
      id_5,
      id_5
  );
  inout wire _id_1;
  parameter id_6 = 1;
  always @(!id_1 or posedge !id_5 | -1) force id_2[id_1] = -1;
  assign id_5 = id_3[id_6+-1 :-1];
endmodule
