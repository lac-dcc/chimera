// Seed: 2522788500
module module_0 (
    input wand  id_0,
    input uwire id_1,
    input wire  id_2,
    input uwire id_3,
    input tri1  id_4,
    input wand  id_5,
    input wor   id_6
);
  assign id_8 = id_0;
  assign id_8 = id_3;
  wire id_9, id_10, id_11;
  wire id_12;
  uwire id_13 = 1'b0, id_14, id_15;
  logic [7:0][1][1] id_16 (.id_0(1));
  id_17(
      id_8
  );
endmodule
module module_1 (
    inout tri1 id_0,
    input uwire id_1,
    output wand id_2,
    input supply0 id_3,
    input wor id_4,
    output wor id_5,
    output wire id_6,
    input wor id_7,
    output wor id_8,
    input supply0 id_9,
    input supply1 id_10,
    input supply0 id_11
);
  pullup (1, id_7, 1'b0);
  supply0 id_13, id_14, id_15;
  assign id_0 = id_9;
  wire id_16;
  assign id_5 = id_15 * 1;
  id_17[1] (
      id_4
  ); module_0(
      id_0, id_11, id_3, id_0, id_1, id_4, id_0
  );
endmodule
