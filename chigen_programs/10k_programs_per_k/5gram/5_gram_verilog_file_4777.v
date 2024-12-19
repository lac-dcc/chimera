// Seed: 2641367422
module module_0 (
    output wor id_0,
    output wire id_1,
    input wand id_2,
    input tri0 id_3,
    output tri0 id_4,
    input wand id_5,
    input supply0 id_6,
    input supply0 id_7,
    input wand id_8,
    output uwire id_9,
    input uwire id_10
);
  reg id_12;
  always @(posedge 1 or posedge id_8) begin : LABEL_0
    id_12 = #id_13 1;
  end
endmodule
module module_1 (
    input supply1 id_0,
    output supply0 id_1,
    output supply1 id_2,
    input tri id_3,
    output tri1 id_4,
    input supply1 id_5,
    output wand id_6,
    input tri id_7,
    output wire id_8,
    output supply1 id_9,
    output wire id_10,
    input wand id_11,
    output tri id_12,
    input supply1 id_13
);
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_11,
      id_13,
      id_9,
      id_0,
      id_7,
      id_5,
      id_11,
      id_12,
      id_13
  );
  assign modCall_1.id_0 = 0;
endmodule
