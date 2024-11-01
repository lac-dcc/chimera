// Seed: 135145825
module module_0 (
    input  tri0  id_0,
    input  uwire id_1,
    output tri0  id_2,
    input  wor   id_3,
    input  tri0  id_4,
    output uwire id_5,
    output wand  id_6,
    input  tri   id_7,
    output tri0  id_8
);
  assign id_5 = id_4;
  assign id_2.id_1 = id_0;
  assign id_8 = 1;
  always begin
    #1 $display(id_7 == id_1);
    $display(1);
  end
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    input tri1 id_2,
    input wire id_3,
    input tri0 id_4,
    input wand id_5,
    input supply0 id_6,
    output tri0 id_7,
    output wor id_8,
    output tri id_9,
    input uwire id_10,
    input wand id_11
);
  assign id_8 = 1;
  assign id_7 = id_1;
  module_0(
      id_10, id_4, id_8, id_5, id_6, id_7, id_8, id_3, id_7
  );
endmodule
