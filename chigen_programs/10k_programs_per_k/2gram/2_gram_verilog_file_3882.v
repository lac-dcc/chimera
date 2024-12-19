// Seed: 1569558862
module module_0 (
    output supply0 id_0,
    output wor id_1,
    output supply0 id_2,
    output wire id_3,
    input supply1 id_4,
    input tri id_5,
    input supply1 id_6,
    input wor id_7,
    input tri0 id_8,
    input tri1 id_9,
    input tri0 id_10,
    input wire id_11,
    input supply0 id_12,
    input tri1 id_13,
    input wand id_14,
    output supply1 id_15,
    input wor id_16,
    input tri id_17,
    input uwire id_18
);
  task id_20;
    @(posedge id_14 or 1) begin : LABEL_0
      id_20 = 1'b0;
    end
  endtask : SymbolIdentifier
  assign id_0 = id_4;
  id_21(
      .id_0(id_11)
  );
endmodule
module module_1 (
    output tri0 id_0,
    input supply0 id_1,
    output supply1 id_2
);
  `define pp_4 0
  buf primCall (id_0, id_1);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_12 = 0;
endmodule
