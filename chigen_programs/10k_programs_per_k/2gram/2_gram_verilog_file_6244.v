// Seed: 3526043233
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    output supply1 id_2,
    output supply1 id_3,
    output tri0 id_4,
    output supply0 id_5
);
  wire id_7;
  assign module_1.id_9 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output wor id_1,
    input tri0 id_2,
    output supply1 id_3,
    input wand id_4,
    input uwire id_5,
    input uwire id_6,
    output wor id_7,
    output tri id_8,
    input wor id_9
);
  id_11(
      .id_0(1'b0), .id_1(id_6), .id_2(1), .id_3(1), .id_4(id_1), .id_5(id_4++), .id_6(1), .id_7(1)
  );
  logic [7:0] id_12;
  module_0 modCall_1 (
      id_8,
      id_0,
      id_8,
      id_8,
      id_1,
      id_7
  );
  id_13(
      .id_0(1), .id_1(1), .id_2(id_3)
  );
endmodule
