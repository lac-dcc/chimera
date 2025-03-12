// Seed: 143512671
module module_0 (
    input tri id_0,
    output tri id_1,
    input tri0 id_2,
    input supply0 id_3,
    output wor id_4,
    input tri0 id_5,
    input supply1 id_6,
    output supply0 id_7
);
  wire [-1 : 1 'b0] id_9;
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    input uwire id_2,
    input tri1 id_3,
    input uwire id_4,
    input wor id_5,
    output logic id_6,
    output wire id_7,
    input uwire id_8,
    output logic id_9,
    output uwire id_10,
    output wand id_11,
    input supply1 id_12
);
  always @(id_4 or posedge 1) begin : LABEL_0
    id_9 = -1;
    id_6 <= -1;
  end
  module_0 modCall_1 (
      id_0,
      id_11,
      id_8,
      id_5,
      id_11,
      id_12,
      id_4,
      id_10
  );
endmodule
