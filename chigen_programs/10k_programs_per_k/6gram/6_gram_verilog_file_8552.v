// Seed: 3062731676
module module_0 (
    output tri1 id_0,
    input tri1 id_1,
    output wire id_2,
    output uwire id_3,
    output tri id_4,
    output supply1 id_5,
    output tri id_6,
    output wire id_7,
    input wor id_8,
    input wand id_9,
    output tri0 id_10
);
  assign id_10 = id_1 * id_9;
endmodule
module module_1 (
    input tri id_0,
    input wor id_1,
    output supply0 id_2
    , id_18,
    output tri id_3,
    output supply0 id_4,
    input supply0 id_5,
    input wire id_6,
    input supply0 id_7,
    input supply0 id_8,
    output supply0 id_9
    , id_19,
    output supply1 id_10,
    input supply1 id_11,
    output tri0 id_12,
    input tri1 id_13,
    output supply1 id_14,
    input tri id_15
    , id_20,
    input wor id_16
);
  initial begin : LABEL_0
    fork
      id_21;
      repeat (id_11 < 1) begin : LABEL_1
        assert (id_19);
      end
    join_none
    assert (-1);
    disable id_22;
  end
  module_0 modCall_1 (
      id_14,
      id_1,
      id_4,
      id_4,
      id_4,
      id_2,
      id_3,
      id_9,
      id_15,
      id_16,
      id_14
  );
  assign modCall_1.id_3 = 0;
endmodule
