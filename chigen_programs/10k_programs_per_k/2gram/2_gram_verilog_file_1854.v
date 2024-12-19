// Seed: 3121741862
module module_0 (
    input supply0 id_0,
    output wor id_1,
    input tri1 id_2,
    output supply1 id_3,
    input tri0 id_4,
    output supply0 id_5,
    output tri id_6
);
  id_8(
      .id_0(id_2), .id_1(1 - id_4)
  );
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    output supply0 id_2
);
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_0,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.type_11 = 0;
  for (id_4 = id_1; id_1; id_0 = 1'd0 << id_4) begin : LABEL_0
    wire id_5;
  end
  wire id_6;
endmodule
