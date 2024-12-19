// Seed: 3348122707
module module_0 (
    output tri1 id_0,
    output tri id_1,
    input supply0 id_2,
    inout supply1 id_3,
    input uwire id_4,
    input tri1 id_5,
    input supply1 id_6,
    input tri1 id_7,
    input tri1 id_8,
    input tri0 id_9,
    input supply1 id_10,
    output tri1 id_11,
    output supply0 id_12,
    input wor id_13,
    output wor id_14,
    input supply0 id_15
);
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input wor id_0
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0
  );
  id_3 :
  assert property (@(posedge id_0, id_0) id_0) $display(^1, id_2, {1}, |id_2 + id_2, id_3, 1, id_3);
endmodule
