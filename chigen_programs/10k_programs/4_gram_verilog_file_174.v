// Seed: 2041845187
module module_0 (
    input uwire id_0,
    input wand id_1,
    output tri0 id_2,
    input wor id_3,
    output supply1 id_4,
    input wire id_5,
    input wor id_6,
    input supply0 id_7,
    input tri1 id_8,
    output supply0 id_9,
    input tri0 id_10,
    output wire id_11,
    output wire id_12,
    output wire id_13,
    input wire id_14,
    output tri0 id_15,
    output wor id_16,
    input tri0 id_17,
    input supply0 id_18
);
  assign id_9 = id_7;
  supply1 id_20;
  assign id_20 = id_8 - 1;
endmodule
module module_1 (
    input supply1 id_0,
    output logic id_1,
    input wor id_2,
    input uwire id_3,
    input tri0 id_4,
    output wire id_5,
    output tri1 id_6,
    input wire id_7,
    input wor id_8,
    input tri0 id_9,
    input tri1 id_10,
    input tri id_11,
    input wor id_12,
    input tri1 id_13
);
  always @(id_8 or negedge id_2)
    if (id_12 & id_4 | 1 & id_3) id_1 <= id_4 + id_2;
    else begin
      id_1 <= id_1++;
    end
  module_0(
      id_8,
      id_10,
      id_6,
      id_9,
      id_5,
      id_9,
      id_13,
      id_13,
      id_4,
      id_6,
      id_10,
      id_6,
      id_5,
      id_6,
      id_11,
      id_6,
      id_6,
      id_3,
      id_13
  );
endmodule
