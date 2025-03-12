// Seed: 1037991612
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  generate
    if (1 && 1 - 1) begin : LABEL_0
      wire id_5;
    end else assign id_2 = (id_4);
  endgenerate
endmodule
module module_1 #(
    parameter id_1 = 32'd28
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  input logic [7:0] id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire _id_1;
  assign id_3 = id_4[id_1];
  module_0 modCall_1 (
      id_2,
      id_3,
      id_3,
      id_2
  );
endmodule
