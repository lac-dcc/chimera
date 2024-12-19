// Seed: 939464316
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    output wor id_2,
    input wire id_3,
    input wand id_4,
    output tri id_5
);
  assign id_5 = ~id_3 > 1;
  initial begin : LABEL_0
    #1 id_5 = id_4;
    if (1'b0) begin : LABEL_0
      fork
        id_7(1 - 1);
      join : SymbolIdentifier
    end
  end
  assign module_1.LABEL_0.type_1 = 0;
  wand id_8 = id_1;
  wire id_9;
  wire id_10;
  assign id_8 = id_4;
endmodule
module module_1 (
    input wor id_0,
    input tri1 id_1,
    output supply1 id_2
    , id_5,
    output tri1 id_3
);
  string id_6 = "";
  module_0 modCall_1 (
      id_1,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3
  );
  always @(posedge 1) repeat (1'd0) @(id_0 - 1);
endmodule
