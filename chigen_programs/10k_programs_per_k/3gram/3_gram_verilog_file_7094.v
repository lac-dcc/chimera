// Seed: 388037824
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = 1 - !id_1;
  assign {1, id_3} = 1;
  assign module_1.type_4 = 0;
  always_comb @(1 or posedge id_1) id_2 <= 1'd0;
  wire id_4;
  wire id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15;
  wire id_16 = id_7;
endmodule
module module_1;
  reg  id_2;
  wire id_3;
  generate
    initial begin : LABEL_0
      id_1 <= id_2;
    end
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3
  );
  assign id_1 = 1;
endmodule
