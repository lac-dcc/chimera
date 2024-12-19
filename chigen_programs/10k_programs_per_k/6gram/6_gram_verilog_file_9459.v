// Seed: 1356123562
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
  always @(posedge 1) begin : LABEL_0
    if (1) begin : LABEL_0
      id_2 = 1;
      fork
        begin : LABEL_0
          #1 $display;
          fork
            id_5;
            #1 id_5 = 1 != id_4;
          join
        end
      join
      if (id_1) begin : LABEL_0
        id_6;
      end
    end
  end
  id_7(
      .id_0(id_1),
      .id_1(1),
      .id_2(id_4 & id_4),
      .id_3(id_8[1'h0]),
      .id_4(1),
      .id_5(1),
      .id_6(id_4),
      .id_7(1),
      .id_8(id_1),
      .id_9(1),
      .id_10(id_4),
      .id_11(1'b0),
      .id_12(1),
      .id_13(id_3),
      .id_14(1 - id_2),
      .id_15(id_1),
      .id_16(id_3)
  );
endmodule
module module_0 (
    input  tri  id_0,
    output tri1 id_1,
    output wand id_2
    , id_4
);
  always @(posedge 1) for (id_1 = 1; module_1; id_1 = 1'b0) $display(id_0, id_0, 1, 1 == id_0);
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_6 = 0;
endmodule
