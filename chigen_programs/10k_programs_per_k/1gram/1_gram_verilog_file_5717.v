// Seed: 2625094093
module module_0 (
    output tri0 id_0,
    input tri1 id_1,
    output uwire id_2,
    output tri0 id_3,
    input tri1 id_4,
    input tri id_5,
    output tri0 id_6,
    input wire id_7,
    input wire id_8,
    output wand id_9,
    input tri0 id_10,
    input supply0 id_11
);
  tri1 id_13, id_14;
  logic [7:0] id_15, id_16, id_17;
  id_18(
      id_13 - 1, 1
  );
  always
    if (!1)
      if (id_13)
        if (1) begin : LABEL_0
          if (1) begin : LABEL_0
            id_9 = id_11;
          end
          deassign id_9;
          id_15[1] = id_8;
        end
endmodule
module module_1 (
    input tri id_0,
    output wor id_1,
    output supply1 id_2,
    input tri0 id_3,
    input uwire id_4,
    output wor id_5,
    output uwire id_6,
    output wire id_7,
    input uwire id_8,
    input tri1 id_9,
    inout wire id_10,
    output supply1 id_11,
    input wor id_12,
    input wor id_13
);
  wire id_15, id_16;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_2,
      id_5,
      id_13,
      id_3,
      id_11,
      id_4,
      id_0,
      id_11,
      id_12,
      id_8
  );
  assign modCall_1.id_5 = 0;
  id_17(
      {id_10, 1}
  );
endmodule
