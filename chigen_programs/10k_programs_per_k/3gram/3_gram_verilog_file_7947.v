// Seed: 312110188
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input tri1 id_2,
    input tri0 id_3,
    input tri1 id_4,
    input tri0 id_5
    , id_17,
    input tri0 id_6,
    input uwire id_7,
    input supply0 id_8,
    output uwire id_9,
    output tri0 id_10,
    output tri0 id_11,
    output wor id_12,
    input supply0 id_13,
    input supply0 id_14,
    output tri id_15
);
  always @(posedge id_7) begin : LABEL_0
    id_17 <= id_0;
  end
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    output wand id_0,
    output supply1 id_1,
    input supply1 id_2,
    output tri1 id_3,
    input tri0 id_4,
    input tri id_5,
    input wire id_6,
    input tri id_7,
    input tri1 id_8,
    input supply0 id_9,
    input tri id_10
);
  wire id_12;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5,
      id_7,
      id_6,
      id_0,
      id_0,
      id_1,
      id_1,
      id_7,
      id_10,
      id_0
  );
  wire id_13;
  assign id_0 = id_7;
  wire id_14;
  wire id_15;
endmodule
