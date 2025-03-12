// Seed: 826982649
module module_0 (
    output tri id_0,
    input wor id_1,
    output tri0 id_2,
    output wor id_3,
    output tri1 id_4,
    input uwire id_5,
    input supply1 id_6,
    output uwire id_7
    , id_19,
    output wor id_8,
    input uwire id_9,
    input wire id_10,
    output tri id_11,
    input tri id_12,
    input wand id_13,
    output wire id_14,
    input tri1 id_15,
    output tri0 id_16
    , id_20,
    output wor id_17
);
  always @(~id_13 or -1'b0 or posedge id_10#(
      .id_20(~(1 && 1 && 1 && 1)),
      .id_5(-1'b0)
  ))
    id_20 = #1 -1'b0;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    output tri1 id_2,
    output wand id_3,
    output tri1 id_4
);
  assign id_2 = id_1;
  not primCall (id_3, id_1);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_3,
      id_3,
      id_1,
      id_1,
      id_4,
      id_3,
      id_1,
      id_1,
      id_4,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3
  );
endmodule
