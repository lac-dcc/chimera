// Seed: 2147773042
module module_0 (
    input  uwire   id_0,
    output supply0 id_1,
    input  uwire   id_2,
    output uwire   id_3
);
  assign id_3 = 1;
  always @(negedge id_2 - 1) begin : LABEL_0
    id_3 = id_2#(1, 1);
    $display((1'h0) !=? id_0);
    assert (id_0);
  end
endmodule
module module_1 (
    input  uwire id_0,
    input  logic id_1,
    output logic id_2,
    input  wire  id_3,
    output tri1  id_4
);
  always @(posedge 1 or posedge 1 & 1) begin : LABEL_0
    id_2 <= (id_1 ? id_1 : 1);
  end
  module_0 modCall_1 (
      id_3,
      id_4,
      id_3,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
