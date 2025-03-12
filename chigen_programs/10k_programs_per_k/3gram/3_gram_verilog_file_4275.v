// Seed: 1421966615
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_5 = 32'd95,
    parameter id_6 = 32'd98
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5
);
  input wire _id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input logic [7:0] id_1;
  assign id_3 = id_5;
  assign id_3 = id_1[id_5];
  wire _id_6;
  logic [7:0] id_7;
  wire id_8;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_4,
      id_2
  );
  assign id_7[id_6] = id_7;
  assign {~id_5} = -1'b0;
endmodule
