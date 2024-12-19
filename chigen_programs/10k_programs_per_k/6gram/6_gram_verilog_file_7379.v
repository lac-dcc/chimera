// Seed: 1963942199
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    input wand id_2
    , id_20,
    input uwire id_3,
    input supply1 id_4,
    output wire id_5,
    input tri0 id_6,
    output tri id_7,
    input wor id_8,
    output tri id_9
    , id_21,
    output supply1 id_10,
    input supply1 id_11,
    input wor id_12,
    input supply1 id_13,
    input tri0 id_14,
    output uwire id_15,
    input tri0 id_16,
    output tri1 id_17,
    output wire id_18
);
  supply0 id_22 = 1'h0;
  wire id_23;
  tri id_24 = 1'b0;
  wire id_25;
  wire id_26, id_27;
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    output tri id_2,
    output supply0 id_3,
    input tri0 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_1,
      id_1,
      id_1,
      id_3,
      id_4,
      id_3,
      id_1,
      id_3,
      id_3,
      id_1,
      id_1,
      id_1,
      id_4,
      id_0,
      id_4,
      id_3,
      id_2
  );
  assign modCall_1.id_4 = 0;
  id_7(
      (1), 1, 1
  );
  always @(*) begin : LABEL_0
    id_2 = id_4 ~^ id_1;
  end
endmodule
