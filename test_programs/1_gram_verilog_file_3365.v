// Seed: 3122765846
module module_0 (
    input tri id_0,
    input wand id_1,
    output wire id_2,
    input supply1 id_3,
    output tri1 id_4,
    output tri0 id_5,
    input supply0 id_6,
    output wire id_7,
    output wor id_8
);
  id_10(
      -1'b0, id_1
  );
endmodule
module module_1 (
    input tri0 id_0,
    input logic id_1,
    input tri id_2,
    input wand id_3,
    output supply1 id_4,
    output tri1 id_5,
    output uwire id_6,
    input wor id_7,
    output tri1 id_8,
    output tri id_9,
    input uwire id_10,
    input supply0 id_11,
    output logic id_12,
    input wire id_13,
    input wor id_14,
    input supply1 id_15
);
  assign id_9 = 1 & id_1(id_15, id_10, 1, 1'b0 & $display, id_11);
  id_17(
      .id_0(id_11)
  );
  module_0 modCall_1 (
      id_0,
      id_11,
      id_6,
      id_0,
      id_4,
      id_5,
      id_13,
      id_4,
      id_8
  );
  assign modCall_1.type_1 = 0;
  initial @(id_7 or posedge 1 or -id_15) id_12 <= id_1;
endmodule
