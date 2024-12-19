// Seed: 1483965199
module module_0 (
    input wor id_0,
    output tri1 id_1,
    input supply0 id_2,
    input wand id_3,
    output supply0 id_4,
    output uwire id_5,
    input wire id_6,
    input tri0 id_7
);
  wire id_9;
  assign module_1.id_1 = 0;
  wire id_10;
  wire id_11;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    input tri id_2,
    input tri id_3,
    output tri1 id_4,
    input uwire id_5,
    input tri id_6,
    input tri id_7,
    input tri0 id_8,
    input uwire id_9,
    input supply1 id_10
    , id_17,
    output wor id_11,
    input supply1 id_12,
    output logic id_13,
    input supply1 id_14,
    input tri id_15
);
  assign id_11 = 1;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_3,
      id_5,
      id_4,
      id_4,
      id_8,
      id_12
  );
  always_latch @(posedge id_0 - 1'h0 or posedge id_15) begin : LABEL_0
    if (id_2) begin : LABEL_0
      id_13 <= 1;
    end
  end
endmodule
