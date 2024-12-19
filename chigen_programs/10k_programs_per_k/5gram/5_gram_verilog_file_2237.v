// Seed: 3408037173
module module_0 (
    input uwire id_0,
    input wand id_1,
    input tri1 id_2,
    input wire id_3,
    input tri1 id_4,
    input supply1 id_5,
    input tri id_6,
    input wor id_7,
    input tri1 id_8,
    input wand id_9,
    output wor id_10,
    input tri1 id_11
    , id_25,
    input supply1 id_12,
    output supply0 id_13,
    input tri0 id_14,
    input wand id_15,
    input wire id_16,
    output tri1 id_17,
    input wand id_18,
    output wire id_19,
    input tri1 id_20,
    input wire id_21,
    output tri1 id_22,
    output supply0 id_23
);
  wire id_26;
  assign id_10 = 1;
  assign module_1.type_0 = 0;
  wire id_27;
  always @((id_16)) begin : LABEL_0
    id_25 = #1 1;
  end
endmodule
module module_1 (
    input wire  id_0,
    input uwire id_1,
    input tri1  id_2,
    input tri1  id_3
);
  tri1 id_5 = id_0 < 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_3,
      id_3,
      id_1,
      id_0,
      id_5,
      id_3,
      id_5,
      id_5,
      id_1,
      id_3,
      id_5,
      id_3,
      id_5,
      id_3,
      id_5,
      id_0,
      id_5,
      id_5,
      id_3,
      id_5,
      id_5
  );
  assign id_5 = id_2 ? id_3 : 1;
  assign id_5 = 1 == 1;
endmodule
