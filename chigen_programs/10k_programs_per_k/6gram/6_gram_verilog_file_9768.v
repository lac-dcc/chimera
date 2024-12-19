// Seed: 3241655093
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    input wand id_2,
    output wor id_3,
    output tri id_4,
    input tri0 id_5,
    input tri id_6,
    output wire id_7,
    input wor id_8,
    input supply1 id_9,
    input wand id_10,
    input wire id_11,
    input uwire id_12,
    input tri0 id_13,
    input tri0 id_14
);
  wire id_16;
  wand id_17;
  wire id_18;
  assign id_1  = 1 ? 1'b0 : 1;
  assign id_17 = id_11;
  initial $display(id_6 & 1);
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    output logic id_2,
    output wor id_3,
    input wor id_4,
    input supply0 id_5,
    input wand id_6,
    input tri id_7,
    input tri0 id_8,
    input supply0 id_9,
    output supply1 id_10,
    output supply0 id_11
);
  assign id_10 = (id_9);
  module_0 modCall_1 (
      id_5,
      id_10,
      id_8,
      id_11,
      id_11,
      id_5,
      id_5,
      id_3,
      id_1,
      id_0,
      id_0,
      id_1,
      id_5,
      id_7,
      id_0
  );
  assign modCall_1.type_2 = 0;
  always @(posedge 1 < 1) begin : LABEL_0
    if (1) begin : LABEL_0
      id_10 = id_5;
    end else #1 id_2 <= 1 == id_1;
  end
endmodule
