// Seed: 1274354216
module module_0 (
    input uwire id_0,
    input uwire id_1
);
  id_3(
      .id_0(1)
  );
  wire id_4;
  module_2 modCall_1 ();
endmodule
module module_1 (
    output logic   id_0,
    input  supply1 id_1
);
  supply1 id_3 = 1 || id_1;
  wand id_4 = 1, id_5;
  module_0 modCall_1 (
      id_1,
      id_1
  );
  assign modCall_1.type_0 = 0;
  always begin : LABEL_0
    id_0 <= 1;
  end
  assign id_3 = 1'b0;
  wire id_6;
endmodule
module module_2 ();
  always begin : LABEL_0
    id_1 <= 1;
    if (id_1)
      @(id_1) begin : LABEL_0
        if (1)
          if (id_1) begin : LABEL_0
            id_1 <= 1;
          end
      end
    else #1 @* fork : SymbolIdentifier id_1 <= 1'b0 & 1; join
    id_1 <= 1;
    id_1 <= 1;
  end
  assign module_0.LABEL_0.id_1 = 0;
endmodule
