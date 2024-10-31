// Seed: 1550894749
module module_0 (
    input wor id_0,
    input uwire id_1,
    input wor id_2,
    output supply0 id_3,
    input supply1 id_4,
    input supply0 id_5,
    input supply0 id_6,
    output wor id_7,
    output wor id_8,
    output tri1 id_9,
    input wand id_10,
    input supply0 id_11,
    output wor id_12,
    input wire id_13,
    input wand id_14
);
  specify
    (id_16 => id_17) = (id_10  : 1  : 1);
    $width(negedge id_18, {1, 1'b0});
    (id_19 => id_20) = 1;
  endspecify
  wire id_21;
  wire id_22;
  wand id_23 = id_17, id_24, id_25;
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    input uwire id_2
);
  wire id_4;
  wire id_5;
  wire id_6;
  module_0(
      id_2, id_0, id_2, id_1, id_0, id_2, id_2, id_1, id_1, id_1, id_0, id_0, id_1, id_0, id_0
  );
endmodule
