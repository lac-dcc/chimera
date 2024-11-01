// Seed: 2313353200
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input tri id_2,
    output supply0 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input tri1 id_6,
    input supply0 id_7,
    output supply1 id_8,
    input uwire id_9,
    input tri1 id_10,
    input supply1 id_11,
    output tri1 id_12,
    input wor id_13,
    output tri id_14,
    input tri1 id_15,
    input supply0 id_16,
    output wand id_17,
    output wor id_18,
    input wor id_19,
    input supply0 id_20,
    output wor id_21
);
  wor  id_23;
  wire id_24;
  wire id_25;
  always @(posedge id_23 or {id_13{1}} == id_15 & id_23) begin
    id_3 = 1'b0;
  end
endmodule
module module_1 (
    output tri0 id_0,
    input  tri0 id_1,
    output wire id_2,
    input  tri0 id_3,
    output tri  id_4
);
  wire id_6;
  module_0(
      id_3,
      id_1,
      id_3,
      id_4,
      id_1,
      id_3,
      id_3,
      id_3,
      id_2,
      id_1,
      id_3,
      id_1,
      id_2,
      id_3,
      id_4,
      id_1,
      id_1,
      id_4,
      id_2,
      id_3,
      id_3,
      id_4
  );
endmodule
