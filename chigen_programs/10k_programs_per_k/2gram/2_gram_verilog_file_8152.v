// Seed: 1301306287
module module_0 (
    input tri1 id_0,
    output tri1 id_1,
    output supply1 id_2,
    input wor id_3,
    output uwire id_4,
    input wor id_5,
    output tri1 id_6,
    input supply1 id_7,
    input wire id_8,
    input wire id_9,
    output tri1 id_10,
    output wire id_11,
    input uwire id_12,
    output tri0 id_13,
    input supply1 id_14
);
  initial @(1, posedge id_5) disable id_16;
  wire id_17;
  assign id_4 = id_14;
endmodule
module module_1 (
    input wand id_0,
    output wand id_1,
    output tri0 id_2,
    input supply0 id_3,
    input wor id_4,
    input wor id_5,
    input tri0 id_6
);
  supply0 id_8 = id_0;
  module_0(
      id_8, id_2, id_1, id_0, id_1, id_4, id_1, id_6, id_3, id_3, id_2, id_8, id_5, id_8, id_3
  );
endmodule
