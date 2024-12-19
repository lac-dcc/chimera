// Seed: 4110786216
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input wand id_2,
    input uwire id_3
);
  wire id_5;
  assign module_2.id_5 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input wor id_1,
    input tri id_2,
    output uwire id_3,
    output tri1 id_4
);
  wire id_6 = id_2;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_2,
      id_1
  );
  assign modCall_1.type_0 = 0;
endmodule
module module_2 (
    input tri1 id_0,
    output supply1 id_1,
    input tri id_2
);
  generate
    tri1 id_4;
    assign id_1 = id_4 - id_0;
    wor id_5;
    always_comb begin : LABEL_0
      id_5 = id_2;
    end
  endgenerate
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_5
  );
  id_7(
      1, id_0 - id_4, 1, id_4 - id_5
  );
  always begin : LABEL_0
    id_7 = id_7;
  end
endmodule
