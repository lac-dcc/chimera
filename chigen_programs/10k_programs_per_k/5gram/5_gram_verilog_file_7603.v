// Seed: 3069005263
module module_0 (
    output tri id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wire id_3,
    output supply1 id_4,
    input supply0 id_5,
    output supply1 id_6,
    output supply1 id_7
);
  assign id_7 = id_2;
endmodule
module module_1 (
    output tri id_0,
    input tri0 id_1,
    output tri0 id_2,
    output wor id_3,
    output wor id_4,
    output supply0 id_5,
    input supply0 id_6,
    input supply1 id_7
);
  always_latch @(posedge id_7) id_2 = id_1;
  supply0 id_9;
  supply0 id_10;
  wand id_11;
  always
    if (id_6) begin : LABEL_0
      id_2 = id_10;
    end else id_9 = id_6;
  supply0 id_12, id_13;
  assign id_5 = id_12;
  always @(id_12 or posedge {id_13{""}} && 1 - id_11) id_0 = id_9;
  assign id_11 = 1 | 1;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_7,
      id_6,
      id_13,
      id_12,
      id_9,
      id_12
  );
  wire id_14, id_15;
endmodule
