// Seed: 2311750131
module module_0 (
    input tri0 id_0,
    input tri id_1,
    input tri id_2,
    input wor id_3,
    input supply1 id_4,
    input tri id_5,
    output wand id_6,
    input wor id_7,
    input wire id_8,
    output tri0 id_9,
    input supply1 id_10,
    input wand id_11,
    input uwire id_12,
    input supply0 id_13,
    output uwire id_14,
    input wire id_15
);
  assign id_14 = -1;
  assign module_1.id_4 = 0;
  tri id_17;
  assign id_17 = 1;
  logic id_18;
  assign id_14 = id_10#(
      .id_10(1),
      .id_17(1)
  );
endmodule
macromodule module_1 (
    input  wand id_0,
    input  tri0 id_1,
    output tri1 id_2,
    input  wand id_3,
    input  tri0 id_4,
    output tri0 id_5,
    input  wire id_6
);
  logic id_8;
  ;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_0,
      id_6,
      id_4,
      id_5,
      id_6,
      id_3,
      id_5,
      id_0,
      id_0,
      id_6,
      id_3,
      id_2,
      id_6
  );
  localparam integer id_9 = 1;
endmodule
