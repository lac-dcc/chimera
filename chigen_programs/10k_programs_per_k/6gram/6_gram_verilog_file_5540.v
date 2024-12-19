// Seed: 2903777463
module module_0 (
    input tri id_0,
    input wor id_1,
    output supply1 id_2,
    input supply0 id_3,
    output supply1 id_4,
    input wand id_5,
    input supply1 id_6,
    input tri1 id_7,
    input tri id_8,
    output wand id_9
);
  assign id_2 = 1 ? 1 & 1 : id_8;
  supply1 id_11 = 1;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output tri1 id_2,
    output logic id_3,
    input uwire id_4,
    output supply1 id_5,
    output wire id_6,
    input supply0 id_7,
    input supply0 id_8,
    output wire id_9,
    input tri1 id_10,
    output uwire id_11,
    input wire id_12,
    output uwire id_13,
    output wand id_14
);
  id_16(
      .id_0(id_2),
      .id_1(id_5),
      .id_2(!$display(id_3)),
      .id_3(id_12),
      .id_4(id_9),
      .id_5(1),
      .id_6(1 == 1 - id_4),
      .id_7(1),
      .id_8(id_8),
      .id_9(id_6 - 1),
      .id_10(1),
      .id_11(1),
      .id_12(1),
      .id_13(id_11),
      .id_14(1),
      .id_15(id_0),
      .id_16(id_8)
  );
  module_0 modCall_1 (
      id_0,
      id_10,
      id_14,
      id_10,
      id_5,
      id_1,
      id_8,
      id_4,
      id_0,
      id_14
  );
  assign modCall_1.id_1 = 0;
  initial begin : LABEL_0
    if (id_12) begin : LABEL_0
      if (1 | 1) begin : LABEL_0
        if (1) #(1);
        else begin : LABEL_0
          deassign id_14;
        end
      end
      id_3 <= $display(1 < 1) - 1;
    end
    fork
      #1;
    join
  end
endmodule
