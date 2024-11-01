// Seed: 1221765917
module module_0 (
    output tri0 id_0,
    output wor id_1,
    input wor id_2,
    output supply0 id_3,
    output tri id_4,
    output tri0 id_5,
    input supply0 id_6,
    output supply1 id_7,
    input supply0 id_8,
    input wand id_9,
    output wand id_10,
    input tri0 id_11,
    output tri0 id_12,
    output wand id_13,
    output tri1 id_14,
    output tri1 id_15,
    output wor id_16,
    input wand id_17,
    input supply0 id_18,
    output supply0 id_19,
    output wand id_20,
    input uwire id_21
    , id_24,
    output supply0 id_22
);
  tri id_25 = id_6;
endmodule
module module_1 (
    input wor id_0,
    input tri1 id_1,
    input tri id_2,
    input wire id_3,
    output uwire id_4,
    output wand id_5,
    input tri0 id_6,
    input tri0 id_7,
    output supply0 id_8
);
  assign id_8 = id_6 ? id_3 : id_1;
  module_0(
      id_4,
      id_8,
      id_1,
      id_8,
      id_5,
      id_5,
      id_6,
      id_8,
      id_3,
      id_2,
      id_8,
      id_0,
      id_5,
      id_4,
      id_8,
      id_5,
      id_8,
      id_6,
      id_1,
      id_5,
      id_4,
      id_2,
      id_5
  );
  assign id_8 = id_7 > 1;
  final begin
    $display;
  end
endmodule
