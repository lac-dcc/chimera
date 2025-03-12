// Seed: 2251962092
module module_0 (
    output supply0 id_0,
    input wand id_1,
    output uwire id_2,
    input uwire id_3,
    input wire id_4,
    output uwire id_5,
    input uwire id_6,
    output tri id_7,
    output wand id_8,
    input tri1 id_9#(
        .id_17(1),
        .id_18(1 ? 1 : 1)
    ),
    output wire id_10,
    output uwire id_11,
    input supply0 id_12,
    input tri0 id_13,
    output supply0 id_14,
    input tri1 id_15
);
  if (1) logic id_19;
  logic [7:0] id_20, id_21, id_22[1 : 1];
  assign module_1.id_3 = 0;
  for (id_23 = id_12; -1'b0; id_22[-1] = id_17) begin : LABEL_0
    assign id_22 = id_21;
  end
endmodule
module module_1 (
    output wire id_0,
    input  tri0 id_1,
    input  tri  id_2,
    input  wand id_3
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_1,
      id_3,
      id_0,
      id_2
  );
  logic id_5 = 1;
endmodule
