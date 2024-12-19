// Seed: 237576112
module module_0 (
    output uwire id_0,
    output tri0 id_1,
    output wor id_2,
    inout tri id_3,
    input wor id_4,
    output wor id_5,
    output uwire id_6,
    input wire id_7,
    input tri1 id_8,
    input supply1 id_9,
    input uwire id_10
);
  assign id_0 = id_3;
  assign module_1.id_12 = 0;
  wire id_12;
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1,
    output tri id_2,
    inout uwire id_3,
    output tri0 id_4,
    input wand id_5,
    output tri0 id_6,
    input tri id_7,
    input supply1 id_8,
    output supply0 id_9,
    output wor id_10,
    input wire id_11
    , id_25,
    input supply0 id_12,
    output wor id_13,
    input tri0 id_14,
    input tri1 id_15,
    input wand id_16,
    output wire id_17,
    input wor id_18,
    output tri0 id_19,
    output supply1 id_20,
    input tri1 id_21,
    input uwire id_22,
    input tri id_23
);
  wire id_26;
  wire id_27;
  always @(posedge id_16) id_17 = 1;
  final begin : LABEL_0
    id_9 = 1;
    #1;
    while (1 == id_1) $display(id_5, 1, id_3, id_25[1]);
  end
  module_0 modCall_1 (
      id_20,
      id_4,
      id_10,
      id_3,
      id_12,
      id_19,
      id_3,
      id_14,
      id_15,
      id_7,
      id_5
  );
endmodule
