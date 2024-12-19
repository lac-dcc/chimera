// Seed: 3038067196
module module_0 (
    output tri1 id_0,
    output tri1 id_1
);
  genvar id_3;
endmodule
module module_1 (
    output uwire id_0,
    input  tri   id_1
    , id_6, id_7,
    output tri1  id_2,
    output wand  id_3,
    output wand  id_4
);
  generate
    for (id_8 = 1; 1; id_6 = 1) begin : LABEL_0
      id_9(
          .id_0(1),
          .id_1(id_7),
          .id_2(id_6),
          .id_3(id_3),
          .id_4(id_4),
          .id_5(1),
          .id_6(1),
          .id_7(1'b0)
      );
    end
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
