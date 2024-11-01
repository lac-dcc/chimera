// Seed: 111142049
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    input uwire id_2,
    input tri1 id_3,
    input supply1 id_4,
    output tri1 id_5,
    input supply1 id_6,
    input wire id_7,
    input tri1 id_8,
    input wand id_9
    , id_16,
    output uwire id_10,
    input wor id_11,
    input tri0 id_12,
    output tri1 id_13,
    output wand id_14
);
  initial begin
    #1;
    id_14 = 1;
    $display(id_9, id_11 - 1);
  end
endmodule
module module_1 (
    input wand id_0,
    input wand id_1,
    input supply0 id_2,
    output supply1 id_3,
    input tri0 id_4,
    input uwire id_5,
    output wand id_6
);
  assign id_3 = id_4;
  module_0(
      id_3, id_5, id_5, id_2, id_5, id_3, id_1, id_1, id_2, id_5, id_3, id_2, id_4, id_6, id_6
  );
endmodule
