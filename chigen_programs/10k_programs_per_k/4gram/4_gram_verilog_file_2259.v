// Seed: 1062120834
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input supply0 id_2,
    input wand id_3
);
  generate
    assign id_5 = 1;
  endgenerate
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    input wand id_2,
    output logic id_3,
    input wor id_4,
    output wire id_5,
    input wand id_6
    , id_15,
    inout supply1 id_7,
    output logic id_8,
    output supply0 id_9,
    input supply1 id_10,
    input tri id_11,
    output wor id_12,
    input logic id_13
);
  always_ff begin : LABEL_0
    if (id_11) begin : LABEL_0
      if ((1)) id_3 <= ~id_15;
    end else begin : LABEL_0
      id_9 = 1 - id_6 == id_2;
      if (1) id_8 <= id_13;
    end
  end
  module_0 modCall_1 (
      id_0,
      id_11,
      id_4,
      id_4
  );
  assign modCall_1.id_1 = 0;
  wire id_16;
endmodule
