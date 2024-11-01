// Seed: 4202013751
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input wand id_2,
    input tri0 id_3,
    input tri id_4,
    input tri1 id_5,
    input wand id_6,
    input wand id_7,
    input wor id_8,
    input uwire id_9,
    input uwire id_10,
    input wire id_11,
    input uwire id_12
);
  assign id_14 = 1;
endmodule
module module_1 (
    input wire id_0,
    input tri0 id_1,
    output uwire id_2,
    input uwire id_3,
    input tri1 id_4,
    output supply0 id_5,
    output uwire id_6,
    output wand id_7,
    output tri0 id_8,
    input supply0 id_9,
    output wand id_10,
    output supply0 id_11,
    input supply1 id_12,
    output tri1 id_13
);
  specify
    (id_15 => id_16) = (1  : 1  : id_9, 1  : 1  : id_3);
    (id_17 => id_18) = (1'h0, 1'd0 : 1 - 1  : 1);
    (id_19 => id_20) = 0;
  endspecify module_0(
      id_20, id_1, id_20, id_4, id_4, id_20, id_19, id_9, id_20, id_9, id_15, id_0, id_3
  );
endmodule
