// Seed: 3338601795
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input wor id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri id_5,
    input tri0 id_6,
    input wand id_7,
    input wire id_8,
    output supply0 id_9,
    output tri0 id_10,
    input wire id_11,
    output supply1 id_12
);
  specify
    (id_14 => id_15) = (id_7  : id_3  : 1'd0 == 1 << -1, -1  : id_2  : id_8);
    (id_16 => id_17) = (-1 == ~id_8);
    (id_18 *> id_19) = 1;
    (id_20 + => id_21) = (id_11  : id_19  : id_20 - id_2, id_19);
    (id_22 + *> id_23) = 1;
    (posedge id_24 => (id_25 +: (id_19 && id_3) == id_0)) = (-1, id_4);
    (id_26 => id_27) = 1;
  endspecify
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output wand id_0,
    output wire id_1,
    input uwire id_2,
    input supply1 id_3,
    input supply1 id_4,
    output supply1 id_5,
    output wand id_6
    , id_9,
    output tri0 id_7
);
  assign id_1 = id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_0,
      id_1,
      id_4,
      id_5
  );
endmodule
