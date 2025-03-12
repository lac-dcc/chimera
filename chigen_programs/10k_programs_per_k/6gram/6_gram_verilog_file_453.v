// Seed: 2293243975
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output wor id_2,
    output wand id_3
);
  assign id_3 = ~id_1;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    input tri1 id_2,
    input uwire id_3,
    output uwire id_4,
    input wire id_5,
    input wand id_6,
    input supply1 id_7,
    input uwire id_8,
    input uwire id_9,
    output logic id_10
);
  always @(posedge id_7 or -1) begin : LABEL_0
    id_10 <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_7,
      id_4,
      id_4
  );
endmodule
