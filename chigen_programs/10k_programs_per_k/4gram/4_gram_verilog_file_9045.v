// Seed: 2699244693
module module_0 (
    output wand id_0,
    input wor id_1,
    output tri1 id_2,
    input wand id_3,
    input tri0 id_4,
    input supply0 id_5,
    output tri0 id_6,
    input uwire id_7,
    output logic id_8,
    output tri1 id_9,
    output wand id_10,
    output tri id_11,
    input wor id_12
    , id_18,
    input tri0 id_13,
    input tri0 id_14,
    input wand id_15,
    input wand id_16
);
  always
  fork : SymbolIdentifier
    id_8 <= 1;
    id_19();
  join : SymbolIdentifier
  genvar id_20;
  assign id_19 = id_12 == 1;
endmodule
module module_1 (
    output logic id_0,
    input tri1 id_1,
    input uwire id_2,
    output logic id_3,
    output supply1 id_4,
    output logic id_5,
    output tri0 id_6,
    output supply0 id_7,
    input supply1 id_8,
    output tri1 id_9,
    input supply0 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input supply0 id_13,
    input uwire id_14,
    input tri id_15,
    output wor id_16
);
  always @(-1 or posedge id_10)
    if (1) id_0 <= id_15;
    else id_3 = {1 == 1{-1}};
  module_0 modCall_1 (
      id_6,
      id_11,
      id_6,
      id_12,
      id_1,
      id_14,
      id_16,
      id_12,
      id_3,
      id_7,
      id_9,
      id_9,
      id_10,
      id_12,
      id_1,
      id_12,
      id_2
  );
  assign modCall_1.id_15 = 0;
  always
    if (-1)
      if (1) id_5 <= 1;
      else begin : LABEL_0
        release id_5;
      end
  logic id_18;
endmodule
