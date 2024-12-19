// Seed: 3017451042
module module_0 (
    input supply0 id_0,
    input tri1 id_1
);
  logic [7:0] id_3;
  id_4(
      .id_0(id_3[1]), .id_1(1), .id_2(1'b0), .id_3(id_0)
  );
endmodule
module module_1 (
    output wor id_0,
    output supply1 id_1,
    input supply1 id_2,
    output wand id_3,
    output wor id_4,
    input wor id_5,
    input uwire id_6
);
  id_8(
      .id_0(), .id_1(1 & 1)
  );
  wire id_9;
  assign id_1 = id_6;
  xor primCall (id_1, id_9, id_2, id_5, id_6, id_8);
  module_0 modCall_1 (
      id_5,
      id_2
  );
endmodule
