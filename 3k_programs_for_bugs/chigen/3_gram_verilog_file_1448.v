// Seed: 2725390869
module module_0 (
    output tri1 id_0,
    output supply1 id_1,
    input uwire id_2,
    input tri0 id_3,
    input uwire id_4,
    input tri id_5,
    input wor id_6,
    output wor id_7,
    input wor id_8,
    output wor id_9,
    input wor id_10,
    input wand id_11,
    input supply1 id_12,
    input wor id_13,
    output supply1 id_14,
    input tri0 id_15,
    input wor id_16
);
  wire id_18;
endmodule
module module_1 (
    input supply1 id_0,
    output supply0 id_1,
    input wire id_2,
    output uwire id_3,
    input supply1 id_4,
    input uwire id_5,
    input tri id_6,
    output supply0 id_7,
    input wor id_8,
    output wire id_9,
    input supply1 id_10,
    input wor id_11,
    output tri0 id_12,
    input uwire id_13,
    output wand id_14,
    input tri1 id_15,
    input supply0 id_16
);
  module_0(
      id_3,
      id_14,
      id_13,
      id_5,
      id_15,
      id_5,
      id_8,
      id_12,
      id_16,
      id_7,
      id_16,
      id_2,
      id_10,
      id_0,
      id_1,
      id_2,
      id_2
  );
  wire id_18;
  always @(id_0 ? id_16 : 1 > id_2 or id_11) id_14 = id_2;
  wire id_19;
  wire id_20;
  initial begin
    if (id_4) begin
      $display(1, id_5 ? id_11 : 1 * id_15 - 1);
    end
  end
endmodule
