// Seed: 3862449561
module module_0 (
    output supply0 id_0,
    input wand id_1,
    input supply0 id_2,
    output tri1 id_3
);
  logic id_5;
  assign module_1.id_6 = 0;
endmodule : SymbolIdentifier
module module_1 (
    input wand id_0,
    output supply1 id_1,
    output tri id_2,
    input wor id_3,
    output supply0 id_4,
    output supply0 id_5,
    output tri0 id_6
);
  logic [7:0] id_8;
  always @(negedge -1) begin : LABEL_0
    id_8[-1] <= 1'b0;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_1
  );
  assign id_8 = ~id_0;
endmodule
