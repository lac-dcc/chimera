// Seed: 2308032006
module module_0 (
    input uwire id_0,
    output wand id_1,
    output tri id_2,
    input supply0 id_3,
    input wor id_4,
    output supply1 id_5,
    input supply1 id_6,
    input tri0 id_7
);
  id_9(
      .id_0(id_3), .id_1(id_5)
  );
  supply1 id_10, id_11;
  initial begin : LABEL_0
    id_10 = 1'b0;
  end
endmodule
module module_1 (
    input  wor  id_0,
    input  wire id_1,
    output wand id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.type_5 = 0;
endmodule
