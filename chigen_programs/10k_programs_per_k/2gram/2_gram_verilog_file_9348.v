// Seed: 413109569
module module_0 (
    output tri0 id_0,
    input supply0 id_1
    , id_6,
    input supply1 id_2,
    input uwire id_3,
    output tri1 id_4
);
  assign id_6 = "" - id_6 ? id_1 : id_3;
  wire id_7;
  assign id_4 = 1'h0;
  wire id_8;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    input tri0 id_2,
    output tri1 id_3,
    output wire id_4
    , id_8,
    input tri1 id_5,
    output logic id_6
);
  id_9(
      .id_0(id_5 - 1)
  );
  always_comb begin : LABEL_0
    if (1) id_6 <= !1;
    else id_6 <= (1);
  end
  or primCall (id_3, id_9, id_8, id_2, id_1);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_1,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
