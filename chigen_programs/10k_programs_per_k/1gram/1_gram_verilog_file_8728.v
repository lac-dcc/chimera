// Seed: 2022421534
module module_0 (
    output wire id_0,
    input tri1 id_1,
    input wor id_2,
    input wire id_3,
    input tri0 id_4,
    input wire id_5,
    output tri0 id_6,
    output supply0 id_7,
    output wand id_8,
    input wand id_9
);
  wire id_11;
  if (1 ? 1'b0 : id_9) assign id_7 = 1'b0;
  else begin : LABEL_0
    begin : LABEL_0
      wire id_12;
      wire id_13, id_14, id_15, id_16;
    end
    always begin : LABEL_0
      begin : LABEL_0
        id_8 -= id_2;
      end
    end
    assign id_0 = 1'b0;
  end
endmodule
module module_1 (
    output wand id_0,
    output tri0 id_1,
    input wand id_2,
    output tri0 id_3,
    output tri0 id_4
    , id_10,
    input supply1 id_5,
    input tri0 id_6,
    input wire id_7,
    inout supply0 id_8
);
  pmos id_11 (id_0, id_0, 1);
  xor primCall (id_0, id_7, id_6, id_11, id_10, id_12, id_8, id_5, id_2);
  wire id_12 = ~1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_7,
      id_7,
      id_5,
      id_6,
      id_4,
      id_8,
      id_1,
      id_7
  );
  assign modCall_1.id_4 = 0;
  generate
  endgenerate
  always_comb id_10 <= 1;
endmodule
