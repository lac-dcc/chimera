// Seed: 3929015751
module module_0 (
    output tri1 id_0,
    output wire id_1,
    output tri id_2,
    input uwire id_3,
    input tri0 id_4,
    input tri1 id_5,
    input tri0 id_6,
    input tri0 id_7,
    output tri1 id_8,
    input tri id_9,
    input supply1 id_10,
    input tri id_11,
    input uwire id_12,
    output uwire id_13,
    output wor id_14,
    output uwire id_15,
    input wor id_16,
    output tri id_17,
    input supply1 id_18,
    input tri0 id_19
);
  always @(posedge id_19) begin : LABEL_0
    begin : LABEL_1
      if (1) cover (-1);
    end
  end
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input wor id_2
    , id_15,
    inout uwire id_3,
    input tri id_4,
    input supply0 id_5,
    output tri id_6,
    output supply1 id_7,
    input wor id_8,
    output uwire id_9,
    input uwire id_10,
    output tri id_11,
    output wand id_12,
    input wire id_13
);
  assign id_7 = -1'h0 ? id_13.id_3 : id_15;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_11,
      id_4,
      id_4,
      id_4,
      id_0,
      id_4,
      id_11,
      id_5,
      id_1,
      id_10,
      id_10,
      id_12,
      id_7,
      id_11,
      id_4,
      id_3,
      id_4,
      id_5
  );
endmodule
