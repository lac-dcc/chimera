// Seed: 3181475672
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input tri1 id_2,
    input tri id_3,
    input uwire id_4,
    input tri0 id_5,
    output tri1 id_6,
    input wor id_7,
    output wor id_8,
    input wire id_9,
    input tri0 id_10,
    output tri id_11
);
  wand id_13, id_14, id_15;
  assign module_1.id_5 = 0;
  id_16(
      .id_0(1),
      .id_1(id_11),
      .id_2(id_14 == id_5),
      .id_3(-id_6 | 1'd0),
      .id_4(1'd0),
      .id_5(1),
      .id_6(1'b0),
      .id_7(~id_7)
  );
endmodule
module module_1 (
    output logic id_0,
    input supply0 id_1,
    input logic id_2,
    input wand id_3,
    output tri0 id_4,
    output wand id_5
);
  always @(posedge 1) begin : LABEL_0
    id_0 <= id_2;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_1,
      id_1,
      id_3,
      id_4,
      id_3,
      id_5,
      id_1,
      id_3,
      id_5
  );
endmodule
