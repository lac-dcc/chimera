// Seed: 3776331813
module module_0 (
    output supply0 id_0,
    output uwire id_1,
    input uwire id_2,
    output supply1 id_3,
    input tri id_4
);
  wire id_6;
  assign module_1.id_11 = 0;
  wire id_7;
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    inout tri0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    input wor id_7,
    output wand id_8,
    output supply0 id_9,
    input tri1 id_10,
    input wor id_11,
    output tri0 id_12,
    input supply0 id_13,
    input uwire id_14,
    output tri1 id_15
);
  specify
    if (1'b0) (negedge id_17 => (id_18 +: 1'b0)) = (id_0 & 1'h0, &1);
    (id_19 => id_20) = (1  : id_18  : id_10, 1'b0 : 1 == 1  : 1);
    (id_21 *> id_22) = (id_19, id_5);
    if (id_20) (posedge id_23 => (id_24 +: id_13 | 1)) = (id_23 == id_19, 1  : 1  : 1'b0);
    (id_25 => id_26) = (id_24  : 1  : 1, id_26);
  endspecify
  and primCall (
      id_8,
      id_1,
      id_5,
      id_3,
      id_21,
      id_6,
      id_2,
      id_19,
      id_11,
      id_18,
      id_4,
      id_17,
      id_23,
      id_13,
      id_14,
      id_22,
      id_26,
      id_24,
      id_0,
      id_25,
      id_10,
      id_20,
      id_7
  );
  module_0 modCall_1 (
      id_20,
      id_20,
      id_5,
      id_9,
      id_1
  );
endmodule
