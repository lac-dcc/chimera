// Seed: 3394880659
module module_0 (
    input wor id_0,
    input supply1 id_1,
    output tri0 id_2
);
  assign module_1.type_0 = 0;
  assign id_2 = 1'd0;
  wire id_4;
endmodule
module module_1 (
    input wor id_0,
    input wand id_1,
    input supply0 id_2,
    output wand id_3,
    input wor id_4,
    input tri id_5,
    input uwire id_6,
    input supply0 id_7,
    input supply1 id_8,
    input tri1 id_9,
    input uwire id_10,
    output logic id_11,
    output wand id_12,
    output tri1 id_13,
    input wor id_14,
    output uwire id_15,
    output supply1 id_16
);
  wire id_18;
  always @(posedge id_14, id_9) begin : LABEL_0
    id_11 <= 1 / id_2;
    #1 #1;
    cover (1'b0 ==? id_7);
  end
  module_0 modCall_1 (
      id_4,
      id_2,
      id_3
  );
endmodule
