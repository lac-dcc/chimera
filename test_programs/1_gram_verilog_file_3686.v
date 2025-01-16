// Seed: 2243139920
module module_0 (
    output tri1 id_0,
    input wand id_1,
    input supply1 id_2,
    output uwire id_3,
    output tri0 id_4,
    output tri1 id_5,
    output wor id_6,
    output tri id_7,
    input tri1 id_8
);
  assign module_2.type_0 = 0;
  assign module_1.id_4   = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    output wire id_2,
    input tri0 id_3,
    input wor id_4
);
  assign id_2 = id_3;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_3
  );
endmodule
module module_2 (
    output supply0 id_0,
    output supply1 id_1,
    input wire id_2,
    input wire id_3,
    input tri0 id_4,
    output tri1 id_5
);
  wire id_7, id_8 = 1;
  wire id_9;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_0,
      id_5,
      id_5,
      id_5,
      id_1,
      id_3
  );
  localparam id_10 = 1;
endmodule
