// Seed: 3616664626
module module_0 (
    input tri id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri1 id_3,
    input wand id_4,
    input uwire id_5,
    input supply1 id_6,
    input tri id_7,
    output tri1 id_8,
    input uwire id_9,
    input uwire id_10,
    input wor id_11,
    output supply1 id_12,
    output tri0 id_13,
    output tri id_14
);
  logic [7:0] id_16;
  wire id_17;
  always @(posedge 1) begin
    id_16[1] = 1;
  end
  wire id_18;
  wire id_19;
endmodule
module module_1 (
    output wand id_0,
    output wor id_1,
    output tri0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input supply1 id_5,
    input supply1 id_6,
    input uwire id_7,
    input uwire id_8,
    input wand id_9,
    output supply0 id_10,
    input tri1 id_11,
    output wor id_12,
    input tri1 id_13,
    input wire id_14,
    input supply0 id_15
);
  always force id_1 = 1;
  and (id_1, id_9, id_4, id_3, id_7, id_11, id_5, id_15, id_13, id_14, id_8, id_6);
  module_0(
      id_6, id_5, id_14, id_5, id_5, id_3, id_11, id_4, id_0, id_15, id_3, id_8, id_12, id_10, id_1
  );
endmodule
