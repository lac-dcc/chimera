// Seed: 1314678274
module module_0 (
    output tri1 id_0,
    output wor  id_1,
    input  wor  id_2,
    input  tri1 id_3,
    output wand id_4
);
endmodule
module module_1 (
    output logic id_0,
    input  uwire id_1,
    input  tri0  id_2,
    input  wor   id_3,
    output wand  id_4,
    input  logic id_5,
    input  wand  id_6
);
  always #0 id_0 <= id_5;
  specify
    (negedge id_8 => (id_9 +: id_1)) = (1  : id_3  : id_8, id_6);
  endspecify module_0(
      id_4, id_9, id_1, id_9, id_4
  );
endmodule
