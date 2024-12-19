// Seed: 2046822569
module module_0 (
    output wor id_0,
    output supply0 id_1,
    output tri id_2,
    output supply1 id_3,
    output wor id_4,
    input supply1 id_5,
    output tri id_6,
    input wire id_7,
    input supply0 id_8,
    input wor id_9,
    output tri0 id_10,
    output tri1 id_11,
    input tri0 id_12,
    input wire id_13,
    output supply0 id_14,
    input tri1 id_15,
    input wand id_16,
    input uwire id_17,
    input tri0 id_18,
    input wand id_19,
    output tri0 id_20,
    output wand id_21,
    input wire id_22
);
  always @(posedge "") begin : LABEL_0
    if (1) begin : LABEL_0
      id_3 = 1;
    end
  end
  assign module_1.type_9 = 0;
  assign id_1 = id_15 == 1;
  wire id_24;
endmodule
module module_1 (
    output wand id_0,
    output uwire id_1,
    input supply1 id_2,
    output tri0 id_3,
    output tri0 id_4,
    input supply0 id_5
);
  assign id_3 = id_5;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_1,
      id_0,
      id_2,
      id_4,
      id_5,
      id_2,
      id_5,
      id_4,
      id_1,
      id_2,
      id_2,
      id_3,
      id_2,
      id_5,
      id_2,
      id_2,
      id_2,
      id_3,
      id_4,
      id_5
  );
endmodule
