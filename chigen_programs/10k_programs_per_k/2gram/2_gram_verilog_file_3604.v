// Seed: 1615870667
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    output wand id_2,
    input tri1 id_3,
    input tri0 id_4,
    output tri1 id_5,
    input wor id_6
    , id_20,
    input tri0 id_7,
    input wor id_8,
    input tri0 id_9,
    input wire id_10,
    input supply0 id_11,
    input tri id_12,
    input tri1 id_13,
    input uwire id_14,
    input wire id_15,
    input wand id_16,
    output tri0 id_17,
    output wire id_18
);
  wire id_21;
  always begin
    @(id_13 or posedge id_7 ^ 1) begin
      assert (1);
    end
  end
  wire id_22;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    input wor id_2,
    input wor id_3,
    input uwire id_4,
    input supply1 id_5,
    input tri1 id_6,
    output wor id_7,
    output wor id_8,
    input supply1 id_9,
    input tri0 id_10,
    input wor id_11,
    input tri0 id_12,
    output wire id_13
);
  xnor (id_13, id_4, id_12, id_3, id_5, id_11, id_0, id_9, id_1, id_2, id_6, id_10);
  module_0(
      id_3,
      id_8,
      id_13,
      id_9,
      id_5,
      id_8,
      id_6,
      id_5,
      id_4,
      id_2,
      id_10,
      id_3,
      id_4,
      id_3,
      id_11,
      id_4,
      id_6,
      id_13,
      id_13
  );
  wire id_15;
endmodule
