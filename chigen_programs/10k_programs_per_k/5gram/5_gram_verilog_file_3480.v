// Seed: 4018510778
module module_0 (
    output wire  id_0,
    output tri1  id_1,
    input  uwire id_2,
    input  tri1  id_3
);
  initial
  fork : SymbolIdentifier
  join_any
endmodule
module module_0 (
    input  tri0  id_0,
    output logic id_1,
    input  tri1  id_2,
    output tri0  id_3,
    output uwire module_1
);
  logic id_6, id_7;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_0
  );
  assign modCall_1.id_1 = 0;
  assign id_1 = id_0 ? id_6 : 1'd0;
  always begin : LABEL_0
    id_8(1'h0);
    id_6 <= 1'b0;
  end
  nand primCall (id_1, id_7, id_6, id_0, id_2);
endmodule
module module_2 (
    output supply1 id_0,
    input wor id_1,
    output tri0 id_2,
    input tri id_3,
    output tri id_4,
    output tri1 id_5,
    output tri1 id_6,
    input uwire id_7
);
  always @(1 or posedge id_7) id_5 = 1;
  assign id_6 = id_3;
  id_9(
      .id_0(1), .id_1(id_6), .id_2(id_4), .id_3(id_6), .id_4(1)
  );
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_3
  );
  assign modCall_1.type_0 = 0;
endmodule
