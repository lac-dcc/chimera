// Seed: 2199437666
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
  always @(posedge id_2 or posedge id_2) if (id_2) id_1 <= 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_3;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_1 = 0;
  always @* begin : LABEL_0
    id_3[1] <= 1;
    id_1 <= 1 & 1 & id_2;
    assign id_1 = 1'b0;
  end
endmodule
