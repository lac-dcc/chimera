// Seed: 358986298
module module_0 (
    id_1,
    id_2,
    id_3
);
  output tri1 id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = 1 ? id_1 : -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout reg id_1;
  always @(posedge 1) begin : LABEL_0
    id_1 <= 1;
  end
  assign id_3 = 1;
  wire id_4;
  logic [1 : 1] id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5
  );
  assign id_5 = -1'b0;
endmodule
