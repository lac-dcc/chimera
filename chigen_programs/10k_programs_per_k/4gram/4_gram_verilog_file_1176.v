// Seed: 2666659621
module module_0;
  wire id_2;
  wire id_3;
  assign module_2.type_2 = 0;
endmodule
module module_1 (
    output wand id_0,
    output wire id_1,
    input wor id_2,
    output tri0 id_3,
    input wand id_4,
    output tri0 id_5,
    input uwire id_6,
    output tri id_7,
    input tri0 id_8,
    input supply1 id_9,
    output tri1 id_10,
    input uwire id_11,
    input tri id_12,
    input tri0 id_13,
    input tri id_14,
    input wire id_15
);
  module_0 modCall_1 ();
endmodule
module module_2 (
    input uwire id_0,
    output logic id_1,
    output wire id_2,
    output supply0 id_3,
    input wand id_4,
    output wire id_5,
    input wor id_6
);
  always @(1'b0 or negedge id_4) begin : LABEL_0
    id_1 <= #id_4 1 == 1'd0;
    if (1) assume (id_0);
  end
  id_8(
      .id_0(1'd0),
      .id_1(1 - ""),
      .id_2(id_1),
      .id_3(1),
      .id_4(!id_6),
      .id_5(1),
      .id_6(id_4),
      .id_7(id_0),
      .id_8(1)
  );
  module_0 modCall_1 ();
endmodule
