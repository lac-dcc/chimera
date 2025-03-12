// Seed: 2162281317
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    output wand id_2,
    output wand id_3,
    input supply0 id_4,
    input wor id_5,
    output wor id_6,
    input wor id_7,
    output tri0 id_8,
    input tri0 id_9,
    output wand id_10
);
  wire id_12;
  ;
  wire id_13;
  localparam id_14 = -1;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    inout supply1 id_2,
    input wor id_3,
    output wire id_4,
    output wand id_5,
    output tri id_6,
    input uwire id_7,
    input supply0 id_8,
    input supply0 id_9,
    input supply1 id_10
);
  wire [1 : 1] id_12;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_4,
      id_5,
      id_1,
      id_7,
      id_5,
      id_7,
      id_6,
      id_8,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
