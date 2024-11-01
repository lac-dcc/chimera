// Seed: 3116157089
module module_0 (
    input tri id_0,
    output supply0 id_1,
    input uwire id_2,
    input supply1 id_3,
    input wire id_4,
    input wire id_5,
    input tri1 id_6,
    input supply1 id_7,
    input tri id_8,
    output uwire id_9,
    input uwire id_10,
    output wor id_11,
    output wor id_12,
    input uwire id_13,
    output uwire id_14,
    output tri id_15,
    input wand id_16
);
  assign id_11 = id_16;
  wire id_18;
endmodule
module module_1 (
    input wire id_0,
    output supply0 id_1,
    input supply0 id_2,
    output supply1 id_3,
    input tri id_4
);
  specify
    (id_6 => id_7) = (1  : 1  : 1);
    (id_8 *> id_9) = (!id_0, id_7);
  endspecify
  wor id_10 = id_2;
  assign id_3  = 1;
  assign id_10 = (id_9);
  module_0(
      id_10,
      id_6,
      id_4,
      id_9,
      id_4,
      id_6,
      id_7,
      id_10,
      id_10,
      id_1,
      id_8,
      id_3,
      id_6,
      id_2,
      id_9,
      id_3,
      id_8
  );
endmodule
