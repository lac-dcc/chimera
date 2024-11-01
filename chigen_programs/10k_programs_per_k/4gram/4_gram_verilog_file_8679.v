// Seed: 3193119224
module module_0 (
    input tri id_0,
    input supply1 id_1,
    output wire id_2,
    output tri1 id_3,
    input wire id_4,
    input wor id_5,
    output supply0 id_6,
    output supply0 id_7,
    input uwire id_8,
    input wire id_9,
    input tri0 id_10,
    input tri0 id_11,
    output supply1 id_12,
    output wand id_13,
    output wor id_14,
    input wire id_15,
    output wor id_16,
    input tri id_17,
    output supply0 id_18,
    output wor id_19,
    output tri1 id_20,
    input tri1 id_21
);
  assign id_14 = 1;
endmodule
module module_1 (
    input  wor  id_0,
    input  tri1 id_1,
    output wand id_2
);
  supply0 id_4 = id_1;
  generate
    if (1) begin : id_5
      wor id_6;
      for (id_7 = id_6; id_5 + 1; id_6 = id_4 & id_0) begin : id_8
        wire id_9;
      end
      assign id_5 = 1;
      wire id_10;
      assign id_6 = id_4;
    end else assign id_2 = id_4;
  endgenerate
  module_0(
      id_4,
      id_0,
      id_4,
      id_2,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_0,
      id_1,
      id_1,
      id_4,
      id_4,
      id_4,
      id_0,
      id_4,
      id_0,
      id_2,
      id_4,
      id_4,
      id_4
  );
endmodule
