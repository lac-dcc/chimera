// Seed: 3352724268
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input tri0 id_2,
    input tri id_3,
    input wand id_4,
    output tri1 id_5
);
  assign id_5 = id_0;
endmodule
module module_1 (
    output tri0 id_0,
    input wor id_1,
    input wand id_2,
    input wire id_3,
    output supply0 id_4,
    output logic id_5,
    input tri0 id_6,
    input wire id_7,
    output supply0 id_8,
    output supply1 id_9
);
  always
  fork
    id_11;
    repeat (-1'b0) id_5 = 1'b0;
  join
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_7,
      id_7,
      id_9
  );
  assign modCall_1.id_1 = 0;
endmodule
