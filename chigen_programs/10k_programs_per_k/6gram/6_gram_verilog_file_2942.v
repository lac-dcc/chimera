// Seed: 727397626
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input wand id_2,
    output supply1 id_3
);
  assign id_3 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output wand id_0,
    input wire id_1,
    input wor id_2,
    output wand id_3,
    input tri id_4,
    input wand id_5,
    output wand id_6,
    output logic id_7,
    input supply1 id_8,
    input tri0 id_9,
    output tri0 id_10,
    input uwire id_11,
    output logic id_12,
    input wire id_13,
    output wand id_14
);
  always @(negedge id_13 or posedge -1) begin : LABEL_0
    id_7  <= 1 != ((-1));
    id_12 <= id_13;
  end
  module_0 modCall_1 (
      id_8,
      id_11,
      id_4,
      id_6
  );
endmodule
