// Seed: 1487273714
module module_0 (
    input wand id_0,
    input tri id_1,
    input wire id_2,
    input wor id_3,
    output supply0 id_4,
    input supply1 id_5,
    output wand id_6,
    output supply1 id_7,
    output uwire id_8,
    input uwire id_9,
    input wor id_10,
    output wor id_11,
    input uwire id_12,
    input uwire id_13,
    output uwire id_14,
    input supply0 id_15,
    input tri id_16,
    input tri id_17,
    input supply0 id_18,
    output supply1 id_19,
    id_21
);
  always_comb begin : LABEL_0
    id_7 = id_10 == id_12;
    id_7 = 1;
  end
  assign module_1.id_18 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output supply1 id_1,
    output wire id_2,
    output uwire id_3,
    id_16,
    input uwire id_4,
    input tri id_5,
    output tri id_6,
    input supply0 id_7,
    input wor id_8,
    input wire id_9,
    input supply1 id_10,
    id_17,
    input wor id_11,
    input tri0 id_12,
    output uwire id_13,
    output supply1 id_14
);
  reg id_18;
  id_19(
      -1 ? $display(1, -1) : id_4
  );
  module_0 modCall_1 (
      id_4,
      id_10,
      id_12,
      id_5,
      id_1,
      id_8,
      id_6,
      id_14,
      id_2,
      id_8,
      id_9,
      id_13,
      id_10,
      id_10,
      id_6,
      id_10,
      id_4,
      id_7,
      id_11,
      id_14
  );
  initial id_18 <= -1'b0 - id_12;
  wire id_20;
endmodule
