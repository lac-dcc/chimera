// Seed: 327444699
module module_0 (
    input tri0 id_0,
    input tri id_1,
    output tri1 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output supply0 id_5,
    input supply1 id_6,
    input wor id_7,
    input tri0 id_8,
    input uwire id_9,
    output tri1 id_10,
    output tri0 id_11,
    output wire id_12,
    output wire id_13,
    output wand id_14,
    input tri0 id_15,
    input supply0 id_16,
    input tri1 id_17,
    output tri1 id_18,
    output supply1 id_19
);
  wand id_21 = 1;
endmodule
module module_1 (
    output wire id_0,
    output wor  id_1,
    output wor  id_2,
    input  wand id_3
);
  assign {1'b0, 1} = id_3;
  supply1 id_5;
  module_0(
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_1,
      id_0,
      id_0,
      id_0,
      id_3,
      id_3,
      id_3,
      id_0,
      id_0
  );
  always_ff @(*)
    forever begin
      $display(id_5, id_5 - 1 <-> id_3);
    end
endmodule
