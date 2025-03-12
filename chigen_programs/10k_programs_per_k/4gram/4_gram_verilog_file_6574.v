// Seed: 649582910
module module_0 (
    input wand id_0,
    output wor id_1,
    input supply0 id_2,
    output supply1 id_3,
    input tri1 id_4,
    output uwire id_5,
    output wand id_6,
    input tri1 id_7,
    input wand id_8,
    input wor id_9,
    input tri id_10,
    input uwire id_11,
    input supply0 module_0,
    output supply0 id_13
);
  always @(posedge id_7 or posedge -1'h0) begin : LABEL_0
    id_15.id_16.id_17;
  end
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    output wor id_2,
    input wor id_3,
    input uwire id_4,
    input uwire id_5,
    input uwire id_6,
    input supply0 id_7
);
  module_0 modCall_1 (
      id_7,
      id_2,
      id_5,
      id_2,
      id_6,
      id_2,
      id_2,
      id_6,
      id_3,
      id_3,
      id_0,
      id_7,
      id_5,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
