// Seed: 3412128225
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output uwire id_2,
    input tri1 id_3,
    input wire id_4,
    input tri0 id_5,
    output uwire id_6,
    output tri0 id_7,
    input uwire id_8,
    output wire id_9,
    output wor id_10
);
  assign id_6 = id_0 ? id_3 : id_8 == -1'b0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input wire id_1,
    input uwire id_2,
    input tri0 id_3,
    input supply1 id_4,
    input wand id_5,
    input wor id_6,
    input wire id_7,
    input wire id_8,
    output supply1 id_9
);
  assign id_0 = id_7;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_0,
      id_1,
      id_5,
      id_6,
      id_0,
      id_9,
      id_2,
      id_9,
      id_0
  );
endmodule
