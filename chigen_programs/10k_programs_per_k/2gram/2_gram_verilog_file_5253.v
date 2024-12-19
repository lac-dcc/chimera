// Seed: 137752304
module module_0 (
    output tri id_0
);
  if (id_2[1]) begin : LABEL_0
    for (id_3 = (1); id_3++; id_2 = id_2) begin : LABEL_0
      id_4(
          .id_0(~id_3),
          .id_1(1'b0),
          .id_2(1 + id_0),
          .id_3(1),
          .id_4(1),
          .id_5(""),
          .id_6(1'h0),
          .id_7(1'h0),
          .id_8(1),
          .id_9(id_3),
          .id_10(id_0),
          .id_11(id_2),
          .id_12(1),
          .id_13(1 - 1)
      );
    end
  end else begin : LABEL_0
    id_5(
        .id_0(1)
    );
  end
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input wand id_0,
    input wire id_1,
    input uwire id_2,
    input tri id_3,
    output tri0 id_4,
    input supply0 id_5,
    input tri id_6,
    input uwire id_7
);
  assign id_4 = 1;
  module_0 modCall_1 (id_4);
endmodule
