// Seed: 3976900786
module module_0 (
    input wor id_0,
    input supply1 id_1,
    input tri0 id_2,
    input wire id_3,
    input wand id_4,
    input wand id_5,
    output tri id_6,
    input wand id_7,
    input tri0 id_8,
    input uwire id_9,
    output wire id_10,
    output wand id_11
);
  assign id_6 = id_8;
  assign module_1.id_2 = 0;
  wire id_13;
  assign id_10 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input uwire id_1,
    input supply0 id_2,
    output logic id_3,
    input wand id_4,
    output wire id_5,
    input supply0 id_6
);
  initial
    @(id_2 or negedge id_0) begin : LABEL_0
      id_3 <= 1;
    end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_6,
      id_2,
      id_6,
      id_0,
      id_5,
      id_1,
      id_2,
      id_4,
      id_5,
      id_5
  );
endmodule
