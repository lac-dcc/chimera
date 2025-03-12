// Seed: 3755591470
module module_0 (
    output tri1 id_0,
    output supply0 id_1,
    output wire id_2,
    input uwire id_3,
    input tri1 id_4,
    output wire id_5,
    input tri0 id_6,
    output uwire id_7,
    input wor id_8,
    output tri0 id_9,
    output wand id_10,
    output supply0 id_11,
    input uwire id_12
);
  assign id_9 = ('b0 == (-1));
  assign module_1.id_9 = 0;
  wire id_14;
endmodule
module module_1 (
    output tri0 id_0,
    input uwire id_1,
    output wor id_2,
    input supply0 id_3,
    input tri1 id_4,
    output supply1 id_5,
    output uwire id_6,
    input uwire id_7,
    input wor id_8,
    input tri1 id_9,
    input tri1 id_10,
    input wand id_11
);
  generate
    assign id_6 = id_10(1'b0, -1);
  endgenerate
  module_0 modCall_1 (
      id_5,
      id_0,
      id_2,
      id_8,
      id_1,
      id_5,
      id_4,
      id_2,
      id_11,
      id_0,
      id_0,
      id_6,
      id_1
  );
endmodule
