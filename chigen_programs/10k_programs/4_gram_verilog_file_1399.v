// Seed: 4150117199
module module_0 (
    input uwire id_0,
    input wand id_1,
    output wand id_2,
    input uwire id_3,
    input tri id_4,
    output tri1 id_5,
    input wand id_6,
    input supply1 id_7
    , id_13,
    output tri1 id_8,
    output tri0 id_9,
    input supply1 id_10,
    output tri id_11
);
  uwire id_14 = 1;
  always_comb @(id_0) begin
    #1;
  end
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    input wor id_2,
    output wor id_3,
    input tri0 id_4,
    input tri1 id_5,
    output tri0 id_6
);
  wire id_8;
  wire id_9;
  module_0(
      id_0, id_1, id_6, id_0, id_5, id_3, id_5, id_1, id_3, id_6, id_4, id_3
  );
  assign id_6 = {1{id_4}};
endmodule
