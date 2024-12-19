// Seed: 2794824839
module module_0;
  always @(posedge id_1) begin : LABEL_0
    id_1 = 1 ? id_1 : id_1;
  end
  always @(posedge id_1) begin : LABEL_0
    id_1[1] = 1'h0;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  assign id_3[{1{1}}] = id_1 ? 1 : 1 & 1'b0 - 1 ? id_3[1-1] : id_2 == 1;
  wor id_4 = id_2;
  module_0 modCall_1 ();
endmodule
