// Seed: 3070280453
module module_0 (
    output wor id_0,
    input uwire id_1,
    input tri0 id_2,
    input tri id_3,
    output tri1 id_4,
    output supply1 id_5,
    input supply1 id_6,
    output supply1 id_7,
    input tri id_8,
    input wor id_9,
    input tri id_10,
    output uwire id_11
);
  assign id_5 = 1'b0;
  wire id_13;
  generate
    if ((1) == "") begin : LABEL_0
      assign id_7 = 1'd0;
    end else begin : LABEL_0
      supply1 id_14 = 1'h0;
    end : SymbolIdentifier
  endgenerate
  initial $display(1'b0 >= 1);
  assign module_1.type_10 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    output supply0 id_2,
    input tri id_3
    , id_6,
    output wor id_4
);
  wire id_7;
  id_8(
      .id_0(1), .id_1(1), .id_2(id_4), .id_3(1)
  );
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_0,
      id_4,
      id_4,
      id_1,
      id_2,
      id_3,
      id_3,
      id_0,
      id_4
  );
  id_9(
      .id_0(id_0), .id_1(1 !== 1)
  );
endmodule
