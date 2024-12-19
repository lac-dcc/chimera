// Seed: 1229226500
module module_0 (
    input wire id_0,
    input wor id_1,
    output tri0 id_2,
    output wand id_3,
    output tri0 id_4 id_14,
    output wand id_5,
    input tri0 id_6,
    output uwire id_7,
    input supply1 id_8,
    output tri1 id_9,
    output uwire id_10,
    input tri id_11,
    input tri0 id_12
);
  wire id_15;
endmodule
module module_1 (
    input supply1 id_0,
    output wire id_1,
    output logic id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply0 id_5,
    input wor id_6
);
  always_latch @(negedge ~1);
  wire id_8;
  initial begin : LABEL_0
    id_1 = 1 - 1;
    @(negedge id_6) begin : LABEL_0
      id_2 <= #1 1;
    end
  end
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_1,
      id_1,
      id_1,
      id_5,
      id_1,
      id_3,
      id_1,
      id_1,
      id_5,
      id_5
  );
  assign modCall_1.type_5 = 0;
  assign id_2 = 1;
endmodule
