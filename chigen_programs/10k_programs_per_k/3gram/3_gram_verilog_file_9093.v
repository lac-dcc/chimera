// Seed: 1669990771
module module_0 (
    output wor id_0,
    input uwire id_1,
    input tri id_2,
    output wand id_3,
    input uwire id_4,
    input wor id_5,
    input uwire id_6,
    output uwire id_7,
    input uwire id_8,
    output supply0 id_9,
    output tri id_10,
    output tri id_11,
    input supply1 id_12,
    output wire id_13,
    output wire id_14,
    input wire id_15
    , id_21,
    input wor id_16,
    input supply0 id_17,
    input supply1 id_18,
    input wand id_19
);
  for (id_22 = id_1; 1; id_11 = 1) begin : LABEL_0
    assign id_14 = id_19;
  end
  assign module_1.id_1 = 0;
  id_23(
      .id_0(1), .id_1(id_1), .id_2(1'b0), .id_3(id_2), .id_4(!1), .id_5(1), .id_6(id_10)
  );
endmodule
module module_1 (
    output wand id_0,
    input  wire id_1,
    input  wand id_2
);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_1,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1
  );
endmodule
