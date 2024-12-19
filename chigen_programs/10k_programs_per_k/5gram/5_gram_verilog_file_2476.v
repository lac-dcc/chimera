// Seed: 3803206493
module module_0 (
    id_1
);
  input wire id_1;
  assign module_1.id_2 = 0;
  assign id_2 = 1;
  always @(id_1 or posedge 1) begin : LABEL_0
    disable id_3;
    id_3 = id_2 + id_1;
  end
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 (id_3);
  assign {1, 1 == 1, 1, 1} = id_2;
  wire id_4;
  always @(posedge 1 or posedge 1'b0 == 1) begin : LABEL_0
    #1;
  end
  buf primCall (id_1, id_2);
endmodule
