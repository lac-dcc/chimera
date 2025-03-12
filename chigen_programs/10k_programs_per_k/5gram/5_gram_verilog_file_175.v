// Seed: 2591593527
module module_0 (
    output supply0 id_0,
    input wand id_1,
    output wor id_2,
    input wire id_3,
    output wand id_4,
    input wand id_5,
    input tri0 id_6,
    input wand id_7,
    output tri1 id_8,
    input wor id_9,
    output uwire id_10
);
  assign (weak1, weak0) id_4 = id_1 || 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input  uwire   id_1,
    output uwire   id_2
);
  assign id_2 = 1'b0;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2
  );
  timeprecision 1ps;
endmodule
