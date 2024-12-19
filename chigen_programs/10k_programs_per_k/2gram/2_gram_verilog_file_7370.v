// Seed: 2343455114
module module_0 (
    output tri1  id_0,
    input  uwire id_1,
    input  tri0  id_2,
    input  wor   id_3
);
  tri0 id_5 = 1;
  wire id_6;
  id_7(
      .id_0(id_0), .id_1(-id_1)
  );
  assign module_1.type_6 = 0;
  assign id_0 = 1'b0;
endmodule
module module_1 (
    input  tri  id_0,
    input  wor  id_1,
    input  tri0 id_2,
    output tri  id_3
);
  assign id_3 = id_0;
  assign id_3 = (1);
  final
    while (1) begin : LABEL_0
      id_3 = 1;
      id_3 = id_1;
    end
  module_0 modCall_1 (
      id_3,
      id_2,
      id_0,
      id_2
  );
endmodule
