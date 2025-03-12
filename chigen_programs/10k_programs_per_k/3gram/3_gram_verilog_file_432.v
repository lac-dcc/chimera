// Seed: 314982762
module module_0;
  localparam id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  module_0 modCall_1 ();
  input logic [7:0] id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_2 #(
    parameter id_6 = 32'd51
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6
);
  input wire _id_6;
  inout logic [7:0] id_5;
  output tri0 id_4;
  output wire id_3;
  output wire id_2;
  module_0 modCall_1 ();
  output logic [7:0] id_1;
  assign id_1[-1 : ""] = id_6 - id_5;
  assign id_4 = (1) & id_5;
  assign id_5[1 : id_6] = -1;
  generate
    logic id_7;
    ;
  endgenerate
endmodule
