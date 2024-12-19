// Seed: 1591892174
module module_0;
  wire id_2;
  assign module_2.type_3 = 0;
  always @(negedge 1) begin : LABEL_0
    id_1 <= 1'd0;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge id_2) begin : LABEL_0
    if (1 && id_3) begin : LABEL_0
      #1 id_2 = id_3;
    end else id_1 <= 1;
  end
  module_0 modCall_1 ();
endmodule
module module_2 (
    input tri1 id_0,
    output tri0 id_1,
    input wire id_2,
    input tri0 id_3,
    output wire id_4,
    input wor id_5,
    output wor id_6,
    input tri0 id_7,
    input uwire id_8,
    input supply1 id_9,
    input tri id_10,
    output tri0 id_11,
    input tri id_12,
    input wor id_13,
    input tri0 id_14,
    output tri0 id_15
);
  assign id_1 = id_13;
  module_0 modCall_1 ();
  always force id_6 = ~id_2;
  id_17(
      .id_0(id_1 > 1), .id_1(id_4), .id_2(1'b0 & id_14), .id_3((1))
  );
endmodule
