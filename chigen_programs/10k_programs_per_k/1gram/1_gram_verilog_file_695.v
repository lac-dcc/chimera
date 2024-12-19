// Seed: 3089903105
module module_0 (
    output wor id_0
    , id_7,
    input uwire id_1,
    output tri1 id_2,
    input supply1 id_3,
    input wor id_4,
    output wor id_5
);
  id_8(
      .id_0(1'b0 - id_5), .id_1(id_7)
  );
  if (id_7) wire id_9;
  else assign id_0 = 1'h0;
  wor  id_10 = 1;
  wire id_11;
endmodule
module module_1 (
    output tri0 id_0,
    input tri0 id_1,
    input tri1 id_2,
    input supply1 id_3,
    output supply0 id_4,
    input supply1 id_5,
    input tri0 id_6
);
  assign id_4 = 1;
  xor primCall (id_0, id_3, id_2, id_1, id_5, id_6);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_4,
      id_2,
      id_5,
      id_0
  );
  assign modCall_1.type_13 = 0;
endmodule
