// Seed: 1339201915
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    output uwire id_2,
    input tri0 id_3,
    input uwire id_4,
    input tri0 id_5,
    output supply0 id_6,
    input wand id_7,
    input wire id_8,
    input wand id_9,
    input supply1 id_10,
    output tri1 id_11,
    input wand id_12,
    input supply0 id_13,
    input supply1 id_14,
    output tri1 id_15,
    input tri1 id_16,
    output tri0 id_17,
    output tri1 id_18
);
endmodule
module module_1 (
    output tri1 id_0,
    input supply0 id_1,
    input tri1 id_2,
    output supply1 id_3,
    output wire id_4,
    output wor id_5,
    input tri1 id_6,
    output wand id_7,
    input wor id_8,
    output wor id_9,
    input tri id_10,
    output tri0 id_11,
    input tri0 id_12
);
  always @(posedge 1) begin : LABEL_0
    assert (id_2);
    return 1;
    {id_12, 1} = id_10;
  end
  module_0 modCall_1 (
      id_11,
      id_10,
      id_5,
      id_12,
      id_2,
      id_12,
      id_7,
      id_12,
      id_10,
      id_8,
      id_1,
      id_0,
      id_6,
      id_8,
      id_8,
      id_7,
      id_1,
      id_9,
      id_7
  );
  assign modCall_1.id_13 = 0;
  or primCall (id_7, id_8, id_6, id_2, id_12, id_1, id_10);
endmodule
