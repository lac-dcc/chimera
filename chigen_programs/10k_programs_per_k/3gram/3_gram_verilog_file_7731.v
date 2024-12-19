// Seed: 2078179978
module module_0 (
    input tri id_0,
    output wor id_1,
    output tri1 id_2,
    output tri1 id_3,
    output tri0 id_4,
    output wor id_5,
    input wor id_6,
    output supply1 id_7
);
  wire id_9, id_10, id_11, id_12, id_13, id_14;
  tri0 id_15 = 1;
endmodule
module module_1 (
    input wire  id_0,
    input logic id_1
);
  logic id_3;
  always @(posedge id_0) begin : LABEL_0
    id_3 = id_1;
    do id_3 <= 1'b0; while (id_0);
    #1;
    id_3 = 1'd0;
  end
  tri0 id_4;
  always @(posedge id_4) begin : LABEL_0
    id_3 = 1'b0;
  end
  assign id_3 = 1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_0,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
