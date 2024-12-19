// Seed: 1642057505
module module_0 (
    input tri0 id_0,
    input wor id_1,
    output tri1 id_2,
    input tri0 id_3,
    input wire id_4,
    output supply0 id_5,
    input tri1 id_6,
    output supply0 id_7,
    output wire id_8
);
  always_comb @(posedge id_1 or 1) begin : LABEL_0
    if (1) begin : LABEL_0
      if (1) begin : LABEL_0
        id_5 = id_0 | ~id_6 && 1 && id_6;
      end
    end else id_7 = 1'b0;
  end
  assign module_1.type_5 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input wor id_1
    , id_3
);
  wire id_4;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0
  );
endmodule
