// Seed: 2286377649
module module_0 (
    input logic id_0,
    output supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    output logic id_4,
    output wand id_5,
    input tri id_6,
    output wor id_7,
    input tri1 id_8
);
  assign id_4 = id_0;
  always @(posedge 1) begin : LABEL_0
    id_4 <= 1;
    id_7 = 1;
  end
  assign id_5 = 1;
endmodule
module module_1 (
    output uwire id_0,
    input logic id_1,
    output wand id_2,
    input tri1 id_3,
    input wire id_4,
    input supply0 id_5,
    inout tri0 id_6,
    output logic id_7,
    output wor id_8,
    output logic id_9
);
  always @(posedge id_1 ==? id_6)
    if (id_4) id_9 <= 1'b0;
    else id_7 = id_1;
  initial begin : LABEL_0
    id_9 = id_6 && id_6;
    id_7 <= 1;
    id_8 = id_4;
  end
  module_0 modCall_1 (
      id_1,
      id_6,
      id_5,
      id_5,
      id_9,
      id_6,
      id_3,
      id_2,
      id_6
  );
  assign modCall_1.id_3 = 0;
  wire id_11;
endmodule
