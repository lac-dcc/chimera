// Seed: 1470176345
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    output supply0 id_2
);
  wor id_4;
  always_ff @(posedge id_0 or posedge id_1) begin : LABEL_0
    return 1;
  end
  if (id_0) reg id_5;
  wire id_6;
  always @(posedge id_0) begin : LABEL_0
    id_5 = #1 1;
  end
  assign id_4 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    output tri id_1,
    input supply0 id_2,
    output supply1 id_3,
    input wand id_4,
    input supply1 id_5,
    input supply0 id_6,
    input wor id_7,
    output wor id_8,
    input tri1 id_9,
    input tri id_10,
    input wand id_11,
    input supply1 id_12,
    output wand id_13,
    output wire id_14
);
  wand id_16 = 1, id_17;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_3
  );
  assign modCall_1.id_5 = 0;
endmodule
