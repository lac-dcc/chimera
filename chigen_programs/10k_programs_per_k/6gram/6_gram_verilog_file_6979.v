// Seed: 3938245373
module module_0 (
    input uwire id_0,
    output supply0 id_1,
    output tri id_2,
    output tri id_3,
    output supply1 id_4
);
  generate
    if (id_0)
      if (1) begin : LABEL_0
        assign id_4 = 1 - 1;
        wire id_6;
      end else begin : LABEL_0
        assign id_3 = 1;
      end
    else begin : LABEL_0
      for (id_7 = id_7; 1 + id_7; id_2 = id_7) begin : LABEL_0
        id_8(
            .id_0(id_1), .id_1(id_3), .id_2(id_0)
        );
      end
      assign id_2 = id_7;
    end
  endgenerate
endmodule
module module_1 (
    output supply1 id_0,
    output wand id_1,
    input wire id_2,
    input tri id_3,
    input tri1 id_4,
    input wor id_5,
    input tri id_6,
    input supply1 id_7,
    input wand id_8,
    input wand id_9,
    output tri id_10
);
  wire id_12;
  module_0 modCall_1 (
      id_5,
      id_10,
      id_10,
      id_1,
      id_1
  );
endmodule
