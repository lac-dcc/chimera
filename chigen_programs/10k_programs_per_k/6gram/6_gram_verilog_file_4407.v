// Seed: 1236000852
module module_0 (
    output supply0 id_0,
    input wand id_1,
    output tri id_2,
    input uwire id_3
);
  assign module_1.type_18 = 0;
  wor id_5 = id_3;
  integer id_6;
  assign id_6 = id_3 - 1;
  supply0 id_7;
  assign id_0 = 1'h0 ? 1'b0 : id_6;
  assign id_0 = id_7;
endmodule
module module_1 (
    input wire id_0,
    output wire id_1,
    output wire id_2,
    output tri0 id_3,
    output wor id_4,
    input tri0 id_5,
    input supply1 id_6,
    input wire id_7,
    output tri0 id_8,
    input supply0 id_9,
    output tri1 id_10,
    input wand id_11,
    input uwire id_12,
    output tri0 id_13
);
  wire id_15;
  wor  id_16;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_2,
      id_5
  );
  assign id_13#(.id_6(id_16)) = {id_7, 1};
endmodule
