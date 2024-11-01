// Seed: 2366631231
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output supply0 id_2,
    input wor id_3,
    input wire id_4,
    input wand id_5,
    input tri id_6
);
  supply1 id_8;
  wire id_9;
  id_10(
      .id_0(id_3 ^ 1 + {id_8, id_6}), .id_1(id_9)
  );
  assign id_8 = 1 ? 1 : 1;
  assign id_2 = {1{1}};
  wire id_11;
endmodule
module module_1 (
    output tri id_0,
    output wor id_1,
    input tri id_2,
    input supply1 id_3,
    input supply0 id_4,
    input wand id_5
    , id_12,
    output wire id_6,
    input tri0 id_7,
    input wor id_8,
    input tri1 id_9,
    input tri id_10
);
  wire id_13 = id_12#(.id_10(1'b0 == ~id_9));
  module_0(
      id_8, id_5, id_1, id_5, id_2, id_9, id_7
  );
  wire id_14, id_15;
  or (id_0, id_12, id_13, id_5, id_3, id_2);
  assign id_0 = id_7 ? id_7 : id_5;
  assign id_0 = 1;
endmodule
