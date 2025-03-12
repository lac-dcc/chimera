// Seed: 2526687908
module module_0 (
    output wire id_0,
    input wire id_1,
    input tri1 id_2,
    input tri0 id_3,
    input wire id_4,
    input wire id_5,
    input wand id_6,
    input tri0 id_7,
    input supply0 id_8,
    input supply1 id_9
);
  assign id_0 = id_5;
endmodule : SymbolIdentifier
module module_1 (
    input uwire id_0,
    output tri1 id_1,
    input wire id_2,
    input wand id_3,
    input supply1 id_4,
    input wand id_5,
    output logic id_6
);
  always @(posedge id_4 or posedge 1) begin : LABEL_0
    id_6 = 1;
  end
  assign id_6 = id_2 != -1'b0;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_2,
      id_5,
      id_0,
      id_5,
      id_0,
      id_2,
      id_5
  );
  assign modCall_1.id_0 = 0;
  logic id_8 = id_4;
endmodule
