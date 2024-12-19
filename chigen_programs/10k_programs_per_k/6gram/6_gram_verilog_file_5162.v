// Seed: 386371202
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input wire id_2,
    input uwire id_3,
    input wand id_4,
    input supply1 id_5
);
  tri0 id_7 = 1;
  assign module_1.id_2 = 0;
  wire id_8, id_9;
endmodule
module module_1 (
    output tri id_0,
    input wand id_1,
    output supply1 id_2,
    input wor id_3,
    output tri id_4,
    input tri0 id_5,
    output logic id_6,
    output wor id_7,
    output tri id_8,
    input wand id_9,
    output logic id_10,
    input wand id_11,
    output uwire id_12,
    output tri id_13,
    output uwire id_14
);
  assign id_14 = 1'b0;
  always @(negedge 1) begin : LABEL_0
    if (id_9 && 1 == 1) begin : LABEL_0
      if (1) begin : LABEL_0
        if (id_3 && id_3) $display(1);
      end
      id_10 <= 1'b0;
    end else id_6 <= 1;
  end
  module_0 modCall_1 (
      id_5,
      id_11,
      id_11,
      id_11,
      id_9,
      id_11
  );
endmodule
