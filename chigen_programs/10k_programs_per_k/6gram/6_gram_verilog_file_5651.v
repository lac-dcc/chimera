// Seed: 3249426279
module module_0 #(
    parameter id_6 = 32'd69
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire _id_6;
  wire [1 : id_6] id_7;
  logic [-1 : 1] id_8 = -1 | id_1;
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
  inout wire id_5;
  input wire id_4;
  input logic [7:0] id_3;
  output reg id_2;
  output uwire id_1;
  generate
    for (id_7 = id_5; id_3[-1]; id_2 = -1 * id_6) begin : LABEL_0
      wor id_8 = 1;
      assign id_1 = -1;
    end
  endgenerate
  module_0 modCall_1 (
      id_4,
      id_5,
      id_7,
      id_1,
      id_7
  );
  assign modCall_1.id_6 = 0;
endmodule
