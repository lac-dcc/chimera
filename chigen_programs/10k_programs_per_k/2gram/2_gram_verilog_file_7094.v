// Seed: 1108105579
module module_0 (
    output wor id_0,
    output tri1 id_1,
    input tri id_2,
    output supply1 id_3,
    input tri id_4,
    input supply0 id_5,
    input supply1 id_6,
    input wand id_7,
    input wand id_8,
    output supply1 id_9,
    input wand id_10,
    output wire id_11,
    output wand id_12
);
  assign id_1 = 1;
  always begin
    $display;
  end
endmodule
module module_1 (
    output supply1 id_0,
    output uwire id_1,
    output tri1 id_2,
    input wor id_3,
    output tri id_4,
    output tri0 id_5,
    output uwire id_6,
    input wor id_7,
    output wire id_8
);
  assign id_2 = 1;
  nor (id_5, id_7, id_3);
  module_0(
      id_0, id_1, id_7, id_8, id_3, id_3, id_7, id_3, id_3, id_2, id_7, id_0, id_5
  );
endmodule
