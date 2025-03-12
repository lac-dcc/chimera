// Seed: 3143507765
module module_0 (
    output wor id_0,
    input tri1 id_1,
    output wire id_2,
    input tri id_3,
    output wand id_4,
    input wire id_5,
    input supply1 id_6,
    input supply1 id_7,
    input wor id_8
);
  always_latch @(posedge id_3) begin : LABEL_0
    if (1) begin : LABEL_1
      if (1 + 1) $clog2(99);
      ;
    end
  end
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    output supply0 id_2,
    input supply1 id_3,
    input tri1 id_4,
    input wor id_5,
    input tri1 id_6
);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_2,
      id_0,
      id_2,
      id_0,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
  assign id_2 = -1;
  wire id_8;
  parameter id_9 = 1;
endmodule
