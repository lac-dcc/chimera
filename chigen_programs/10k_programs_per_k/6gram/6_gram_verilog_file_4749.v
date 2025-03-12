// Seed: 4291335061
module module_0 (
    input wand id_0,
    output tri0 id_1,
    input wor id_2,
    input supply0 id_3,
    output tri0 id_4,
    output wire id_5,
    input supply1 id_6,
    input tri1 id_7,
    output wire id_8
);
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    inout wand id_2,
    input wand id_3,
    output tri0 id_4
);
  assign id_2 = id_2 || 1'b0 || ((id_1 == 1));
  assign id_0 = ~id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_0,
      id_2,
      id_2,
      id_1,
      id_0
  );
endmodule
