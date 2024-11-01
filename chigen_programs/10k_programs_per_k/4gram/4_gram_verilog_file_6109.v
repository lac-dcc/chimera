// Seed: 171640074
module module_0 (
    input supply1 id_0,
    output wand id_1,
    output tri1 id_2,
    input uwire id_3,
    input supply1 id_4,
    output wire module_0,
    input supply0 id_6,
    input supply0 id_7,
    input uwire id_8,
    input wire id_9,
    output uwire id_10,
    output wand id_11,
    output wor id_12,
    output uwire id_13
);
  wire id_15;
  assign id_11 = id_3;
  assign id_13 = id_8;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    output tri id_2,
    output wor id_3,
    input tri id_4,
    output tri0 id_5,
    input uwire id_6,
    input tri0 id_7,
    input wor id_8,
    input tri1 id_9,
    output tri0 id_10
);
  assign id_2  = (id_7);
  assign id_10 = ~id_7;
  logic [7:0] id_12;
  module_0(
      id_8, id_10, id_2, id_8, id_6, id_5, id_4, id_7, id_1, id_8, id_0, id_10, id_5, id_0
  ); id_13(
      .id_0(id_2), .id_1(id_1), .id_2('h0 | id_4), .id_3(id_12[1])
  );
endmodule
