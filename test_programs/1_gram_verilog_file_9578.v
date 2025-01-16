// Seed: 3052047415
module module_0 (
    input wire id_0,
    input wand id_1,
    input supply1 id_2,
    input uwire id_3,
    id_6,
    input uwire id_4
);
  generate
    begin : LABEL_0
      assign id_7 = 1;
    end
  endgenerate
  assign module_1.type_24 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input tri id_1,
    input wor id_2,
    output tri1 id_3,
    input tri0 id_4,
    output wor id_5,
    input supply1 id_6,
    input wand id_7,
    input wand id_8,
    output wand id_9,
    output uwire id_10,
    output tri0 id_11,
    input supply1 id_12,
    output wand id_13#(
        .id_19(1),
        .id_20(~1)
    ),
    input wand id_14,
    input wire id_15,
    input supply0 id_16,
    input tri1 id_17
);
  wire id_21;
  initial
    if (-1) begin : LABEL_0
      begin : LABEL_0
        if (-1) id_10 = -1;
      end
    end
  or primCall (
      id_3,
      id_2,
      id_20,
      id_4,
      id_8,
      id_12,
      id_17,
      id_16,
      id_6,
      id_1,
      id_7,
      id_21,
      id_14,
      id_19,
      id_15
  );
  module_0 modCall_1 (
      id_2,
      id_15,
      id_7,
      id_8,
      id_2
  );
endmodule
