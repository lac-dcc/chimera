// Seed: 1321635769
module module_0 (
    input uwire id_0,
    output tri id_1,
    input uwire id_2,
    output tri id_3,
    input wire id_4,
    output uwire id_5,
    input tri0 id_6,
    output supply1 id_7,
    output supply1 id_8,
    output wand id_9,
    input wand id_10,
    output tri id_11,
    input wor id_12,
    input wand id_13,
    input tri id_14,
    input supply1 id_15,
    input wor id_16,
    input tri id_17,
    input wire id_18,
    input wire id_19,
    output wor id_20,
    input tri0 id_21,
    output tri id_22,
    input tri id_23,
    output wor id_24,
    input uwire id_25,
    output supply0 id_26
);
  assign id_9 = id_16;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    input supply0 id_2,
    input wor id_3,
    output wire id_4,
    input wand id_5,
    output tri id_6
);
  reg id_8;
  always @(id_8) begin : LABEL_0
    if (1) begin : LABEL_1
      assert (id_1);
    end
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_0,
      id_3,
      id_4,
      id_5,
      id_6,
      id_6,
      id_0,
      id_3,
      id_0,
      id_5,
      id_3,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4,
      id_1,
      id_0,
      id_2,
      id_4
  );
  assign modCall_1.id_25 = 0;
  initial begin : LABEL_2
    #1 id_8 = id_5 ? id_1 : id_2;
    deassign id_6;
  end
endmodule
