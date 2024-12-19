// Seed: 3956259039
module module_0 (
    output tri0 id_0,
    input uwire id_1,
    input tri0 id_2,
    output wand id_3,
    input tri id_4,
    input tri0 id_5,
    input wire id_6,
    input supply0 id_7,
    input wor id_8,
    output tri0 id_9,
    input uwire id_10,
    input tri1 id_11,
    input supply0 id_12,
    output wire id_13,
    output wand id_14,
    input supply0 id_15,
    input supply1 id_16,
    output uwire id_17,
    input uwire id_18
);
  genvar id_20;
  id_21(
      id_0
  );
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    input tri0 void id_2,
    output tri1 id_3,
    input wor id_4,
    input wor id_5
);
  assign id_3 = 1'd0;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_2,
      id_3,
      id_2,
      id_2,
      id_4,
      id_4,
      id_2,
      id_3,
      id_5,
      id_1,
      id_1,
      id_3,
      id_3,
      id_4,
      id_5,
      id_3,
      id_2
  );
  assign modCall_1.id_4 = 0;
  assign id_3 = 1;
  wire id_7 = id_7;
endmodule
