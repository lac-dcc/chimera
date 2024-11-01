// Seed: 1680967087
module module_0 (
    input tri1 id_0,
    output tri1 id_1,
    output wand id_2,
    input uwire id_3,
    output wand id_4,
    input tri1 id_5,
    input tri1 id_6,
    input supply0 id_7,
    output uwire id_8,
    output supply1 id_9,
    input uwire id_10
    , id_15,
    input tri id_11,
    output wand id_12,
    output supply1 id_13
);
  assign id_12 = {id_10{id_10}};
  always
    repeat (1) begin
      id_4 = id_10;
    end
  assign id_13 = 1;
endmodule
module module_1 (
    input  uwire id_0,
    input  uwire id_1,
    output tri   id_2
);
  module_0(
      id_0, id_2, id_2, id_0, id_2, id_1, id_1, id_0, id_2, id_2, id_1, id_0, id_2, id_2
  );
endmodule
