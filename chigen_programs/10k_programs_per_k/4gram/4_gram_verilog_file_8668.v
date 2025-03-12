// Seed: 3778912710
module module_0 (
    id_1
);
  inout wire id_1;
  localparam id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout logic [7:0] id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (id_3);
  assign id_4[-1] = 1;
endmodule
module module_2 #(
    parameter id_1 = 32'd19,
    parameter id_3 = 32'd89
) (
    _id_1,
    id_2,
    _id_3
);
  input wire _id_3;
  output logic [7:0] id_2;
  input wire _id_1;
  logic id_4;
  assign id_2[1] = id_4;
  module_0 modCall_1 (id_4);
  wire [id_1 : -1 'h0] id_5;
  assign id_2 = id_4;
  wire [id_3  &  -1 : 1] id_6;
endmodule
