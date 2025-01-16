// Seed: 1032853796
module module_0 (
    input  uwire id_0,
    output wire  id_1,
    input  uwire id_2,
    output tri   id_3,
    input  tri   id_4
);
  assign id_3 = 1 && -1;
  wire id_6;
  assign id_1 = id_0;
  wire id_7;
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1
);
  wire id_3, id_4;
  assign id_3 = id_3;
  wire id_5, id_6;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    output wire id_0,
    input supply0 id_1
);
  if (id_1) begin : LABEL_0
    assign id_0 = id_1;
    id_3(
        .id_0(-1 ? 1 : -1)
    );
  end : SymbolIdentifier
  wire id_4 = id_4 - -1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.type_8 = 0;
endmodule
