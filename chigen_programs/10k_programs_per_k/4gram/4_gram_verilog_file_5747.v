// Seed: 3818147674
module module_0 (
    id_1
);
  output wire id_1;
  assign id_1 = 1;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_5;
  assign id_4[1] = 1;
  xor primCall (id_4, id_1, id_5, id_3, id_2);
  module_0 modCall_1 (id_5);
  assign modCall_1.id_1 = 0;
endmodule
module module_2;
  wire id_1;
  assign module_0.id_1 = 0;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  module_2 modCall_1 ();
  logic [7:0] id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15 = id_13;
  generate
    always @(1)
      case (1'b0)
        1: id_6 <= {id_10[1]};
        (1'b0): begin : LABEL_0
          disable id_16;
        end
      endcase
  endgenerate
endmodule
