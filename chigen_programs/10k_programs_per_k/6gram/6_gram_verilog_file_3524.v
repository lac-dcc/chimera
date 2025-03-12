// Seed: 3381394454
module module_0 (
    id_1,
    id_2,
    id_3
);
  output reg id_3;
  input wire id_2;
  output wire id_1;
  assign module_1.id_3 = 0;
  always @(posedge id_2) begin : LABEL_0
    id_3 <= id_2;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout tri id_3;
  output wire id_2;
  inout reg id_1;
  assign id_3 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1
  );
  assign id_2 = !id_1;
  always @(negedge 1'h0 or posedge -1 ^ -1) begin : LABEL_0
    id_1 = 1;
  end
endmodule
