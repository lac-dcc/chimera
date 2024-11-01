// Seed: 1532718673
module module_0 (
    input uwire id_0,
    input tri id_1,
    output uwire id_2,
    output wor id_3,
    output wor id_4,
    input uwire id_5,
    output uwire id_6,
    input wand id_7,
    input wire id_8,
    input wor id_9,
    input supply0 id_10,
    output supply1 id_11,
    output wand id_12
);
  wire id_14;
  assign id_3 = id_0;
  wire id_15;
  assign id_6 = 1 - ~id_8;
  assign id_3 = 1 ? id_8 : 1;
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    output supply1 id_2,
    input wand id_3,
    input tri id_4
);
  wire id_6;
  module_0(
      id_3, id_0, id_2, id_2, id_2, id_3, id_2, id_4, id_3, id_1, id_4, id_2, id_2
  );
endmodule
