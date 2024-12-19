// Seed: 1484290796
module module_0 (
    input uwire id_0,
    output wand id_1,
    output tri1 id_2,
    input supply1 id_3,
    input wand id_4,
    input wor id_5,
    output supply0 id_6,
    input wand id_7,
    input tri1 id_8,
    input wor id_9,
    input uwire id_10,
    output supply1 id_11,
    input tri id_12,
    output wor id_13,
    input tri0 id_14
    , id_20, id_21,
    input supply1 id_15
    , id_22,
    output wor id_16,
    input tri id_17,
    output uwire id_18
);
  always
    repeat (id_17) begin : LABEL_0
      fork
        @(posedge id_12) id_18 = 1;
        repeat (id_5) begin : LABEL_0
          id_22[1'b0] <= 1 == id_7;
        end
      join
    end
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    input tri1 id_2,
    input wire id_3,
    output supply0 id_4,
    output tri0 id_5
);
  supply1 id_7;
  wor id_8 = 1;
  tri0 id_9 = id_0;
  module_0 modCall_1 (
      id_3,
      id_9,
      id_4,
      id_9,
      id_3,
      id_3,
      id_5,
      id_1,
      id_3,
      id_2,
      id_9,
      id_5,
      id_0,
      id_4,
      id_3,
      id_0,
      id_9,
      id_9,
      id_9
  );
  wire id_10;
  tri1 id_11;
  wire id_12;
  wand id_13 = (id_11 & id_7);
  wire id_14;
  wire id_15;
  wire id_16;
endmodule
