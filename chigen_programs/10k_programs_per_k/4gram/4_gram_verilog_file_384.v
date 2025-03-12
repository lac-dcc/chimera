// Seed: 1561889016
module module_0 (
    input supply0 id_0,
    input wor id_1,
    output uwire id_2,
    input tri id_3,
    input wand id_4,
    input supply0 id_5,
    input wand id_6,
    input tri0 id_7,
    output tri1 id_8,
    input tri1 id_9,
    input uwire id_10,
    input uwire id_11
);
  wire id_13;
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input wor id_3,
    output wand id_4,
    inout uwire id_5,
    output uwire id_6,
    input tri id_7,
    input tri id_8,
    output logic id_9,
    input wire id_10
);
  always_latch @* id_9 = id_3;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_0,
      id_7,
      id_7,
      id_1,
      id_10,
      id_8,
      id_0,
      id_10,
      id_10,
      id_8
  );
endmodule
