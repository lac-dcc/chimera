// Seed: 1495637603
module module_0 ();
  wire id_2;
  assign id_2 = id_2;
  generate
    supply0 id_3 = 1;
  endgenerate
  assign module_2.type_7 = 0;
endmodule
module module_1 (
    output wor id_0,
    output wand id_1
    , id_7,
    output wire id_2,
    input wor id_3,
    input tri id_4,
    input supply0 id_5
);
  always @(id_4 == 1'd0 or negedge id_5) begin : LABEL_0
    cover (id_3);
  end
  wire id_8;
  module_0 modCall_1 ();
  wire id_9, id_10;
endmodule
module module_2 (
    input wire id_0,
    input wire id_1
    , id_12,
    output logic id_2,
    input wire id_3,
    output supply1 id_4,
    input tri1 id_5,
    input wand id_6,
    input wire id_7,
    output uwire id_8,
    input tri0 id_9,
    input uwire id_10
);
  wire id_13;
  initial id_2 <= 1;
  module_0 modCall_1 ();
  assign id_2 = id_7 & id_0;
  reg id_14, id_15;
  xor primCall (id_2, id_3, id_5, id_6, id_7, id_9);
  id_16(
      .id_0(id_6),
      .id_1(1'b0),
      .id_2(1'd0),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(id_9),
      .id_7(id_13),
      .id_8(id_6),
      .id_9(~id_3)
  );
  initial begin : LABEL_0
    id_15 <= 1;
    if (id_14) id_14 <= 1'h0;
  end
endmodule
