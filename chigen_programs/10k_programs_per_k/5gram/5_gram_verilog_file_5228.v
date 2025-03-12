// Seed: 28639110
module module_0 (
    output supply1 id_0,
    output supply0 id_1,
    input uwire id_2,
    input tri0 id_3,
    input tri0 id_4,
    output wire id_5,
    output wire id_6,
    input wand id_7,
    input wire id_8,
    output tri id_9,
    input wire id_10,
    output wand id_11,
    input supply1 id_12,
    input supply0 id_13,
    input tri0 id_14
);
  wire id_16;
  always @(posedge id_10 or negedge id_4 >= id_13) begin : LABEL_0
    if (1) disable id_17;
  end
  assign module_1.id_3 = 0;
  logic id_18;
endmodule
module module_1 (
    output wor id_0,
    input tri0 id_1,
    input wire id_2,
    output supply0 id_3,
    input supply0 id_4
);
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_4,
      id_4,
      id_3,
      id_0,
      id_4,
      id_1,
      id_0,
      id_2,
      id_0,
      id_4,
      id_2,
      id_1
  );
endmodule
