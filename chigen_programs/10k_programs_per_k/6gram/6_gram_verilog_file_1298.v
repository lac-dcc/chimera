// Seed: 3315625641
module module_0 (
    input  wire  id_0,
    output logic id_1
);
  bit
      id_3,
      id_4,
      id_5,
      id_6,
      id_7,
      id_8,
      id_9,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25;
  always @(posedge id_24 or -1 == id_4) begin : LABEL_0
    id_1  <= -1;
    id_18 <= id_3;
    begin : LABEL_1
      deassign id_8;
      if (-1'h0) begin : LABEL_2
      end
    end
  end
endmodule
module module_1 (
    output logic id_0,
    output wand id_1,
    output wire id_2,
    input supply0 id_3,
    input supply1 id_4,
    input uwire id_5,
    output wand id_6,
    input wor id_7
    , id_9
);
  reg id_10;
  module_0 modCall_1 (
      id_5,
      id_0
  );
  assign modCall_1.id_24 = 0;
  initial begin : LABEL_0
    id_10 = id_7;
    if (1 & 1) id_0 <= ~id_10;
  end
endmodule
