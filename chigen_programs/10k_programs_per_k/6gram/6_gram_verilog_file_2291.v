// Seed: 469199350
module module_0 (
    input  uwire id_0,
    output logic id_1
);
  always @(posedge 1) id_1 <= 1;
  always @(1 or id_0) begin : LABEL_0
    id_1 = 1 & 1;
  end
endmodule
module module_1 (
    input  tri1  id_0,
    output logic id_1,
    input  logic id_2,
    input  wire  id_3,
    output tri0  id_4,
    output tri   id_5,
    output logic id_6,
    output uwire id_7
);
  supply1 id_9 = id_3;
  module_0 modCall_1 (
      id_3,
      id_1
  );
  assign modCall_1.type_0 = 0;
  assign id_6 = id_2;
  assign id_5 = 1;
  initial begin : LABEL_0
    id_1 <= 1 == !id_2;
    $display(id_2);
    id_6 <= 1;
  end
endmodule
