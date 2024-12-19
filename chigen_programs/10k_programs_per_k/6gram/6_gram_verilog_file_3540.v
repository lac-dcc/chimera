// Seed: 2285948030
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output wor id_2,
    output wand id_3,
    input supply1 id_4,
    output uwire id_5
);
  id_7(
      .id_0(id_1 - 1), .id_1(id_5)
  );
  supply0 id_8;
  initial assume (id_8 == id_1);
endmodule
module module_1 (
    output logic id_0,
    output supply1 id_1,
    input tri1 id_2
);
  always @(id_2) begin : LABEL_0
    if ((id_2)) id_0 <= 1;
    else assert (id_2);
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_8 = 0;
endmodule
