// Seed: 1116910679
module module_0 (
    input  tri0 id_0,
    input  wand id_1,
    input  tri0 id_2,
    input  wand id_3,
    input  tri0 id_4,
    input  wire id_5,
    input  wand id_6,
    output wire id_7,
    output tri1 id_8
);
  wire id_10;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output wand id_1,
    input wire id_2,
    input wire id_3,
    input supply0 id_4,
    output supply1 id_5,
    input tri id_6,
    input tri id_7,
    input wor id_8,
    input uwire id_9,
    output wire id_10,
    output tri1 id_11,
    input tri1 id_12,
    output tri1 id_13
);
  wire id_15;
  wire id_16;
  always @(posedge id_7 or 1) begin : LABEL_0
    assume ((id_0));
  end
  module_0 modCall_1 (
      id_6,
      id_9,
      id_2,
      id_3,
      id_9,
      id_3,
      id_8,
      id_5,
      id_5
  );
endmodule
