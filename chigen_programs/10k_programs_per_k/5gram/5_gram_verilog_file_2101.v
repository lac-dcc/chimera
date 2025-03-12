// Seed: 217007607
module module_0 (
    input wand id_0
    , id_2
);
  always @(1) id_2 = id_0;
  assign module_1.id_9 = 0;
endmodule
module module_1 (
    output logic id_0,
    input tri0 id_1,
    input tri id_2,
    output logic id_3,
    input tri0 id_4,
    input tri id_5,
    input tri0 id_6,
    input supply0 id_7,
    output tri0 id_8,
    input tri0 id_9,
    input tri id_10,
    input uwire id_11
);
  wire id_13;
  module_0 modCall_1 (id_11);
  always @(posedge id_9) begin : LABEL_0
    if (1) id_3 <= id_7;
    else id_0 = -1;
  end
  nand primCall (id_0, id_7, id_2, id_6, id_5, id_9, id_1, id_4, id_13, id_10);
endmodule
