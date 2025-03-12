// Seed: 1371676098
module module_0 (
    output wor id_0
    , id_13,
    input tri1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    output tri id_4,
    output uwire id_5,
    output uwire id_6,
    input supply1 id_7,
    input tri id_8,
    output wire id_9,
    input tri1 id_10,
    input uwire id_11
);
  if (1) begin : LABEL_0
    assign id_4 = -1'b0;
    logic id_14;
    always @(posedge -1) begin : LABEL_1
      disable id_15;
    end
  end else assign id_4 = -1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output wor  id_0,
    input  tri1 id_1
);
  always_ff @(posedge 1) id_0 -= 1'd0 & id_1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1
  );
endmodule
