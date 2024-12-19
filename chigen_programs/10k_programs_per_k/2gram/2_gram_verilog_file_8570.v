// Seed: 177288575
module module_0 (
    input tri0 id_0,
    output wor id_1,
    output supply1 id_2,
    output supply0 id_3,
    output wire id_4,
    input wire id_5,
    input uwire id_6,
    input supply0 id_7,
    input tri id_8,
    output tri id_9,
    input tri0 id_10,
    input uwire id_11
);
  assign module_1.id_4 = 0;
  assign id_9 = 1;
  assign id_1 = 1'b0 ? id_10 : 1 ? 1 : (id_7);
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    output wire id_2,
    output supply0 id_3,
    output uwire id_4,
    input tri0 id_5,
    output wire id_6,
    input tri0 id_7,
    output wand id_8,
    input tri id_9,
    input supply0 id_10,
    output tri1 id_11
);
  assign id_2 = id_1;
  wire id_13 = id_10;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_8,
      id_3,
      id_11,
      id_13,
      id_7,
      id_13,
      id_10,
      id_8,
      id_1,
      id_0
  );
endmodule
