// Seed: 634708931
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input wand id_2,
    input wand id_3,
    input wor id_4
);
  if (1'b0) begin : LABEL_0
    tri0 id_6 = 1;
  end
  uwire id_7 = 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    input wor id_2,
    input wand id_3,
    output uwire id_4,
    output supply0 id_5,
    input wire id_6,
    output tri0 id_7,
    input supply0 id_8,
    input tri1 id_9,
    output supply1 id_10,
    output tri1 id_11,
    input uwire id_12
);
  wire id_14;
  supply1 id_15;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_15,
      id_6,
      id_9
  );
  assign id_15 = id_12;
endmodule
