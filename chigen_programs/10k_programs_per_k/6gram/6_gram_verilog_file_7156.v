// Seed: 3312022349
module module_0 (
    input  wand id_0,
    output tri0 id_1,
    input  tri1 id_2,
    input  tri0 id_3,
    input  wand id_4,
    output tri0 id_5
);
  assign id_5 = (1'h0);
  assign id_5 = id_2;
endmodule
module module_1 (
    output wand  id_0,
    input  tri0  id_1,
    output tri1  id_2,
    output logic id_3,
    input  tri0  id_4,
    output tri0  id_5
);
  assign id_5 = 1;
  always begin : LABEL_0
    if (1) id_3 = (id_4 > 1 && -1'b0);
    else assume (id_1 | !id_4);
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_5 = 0;
  always @(posedge -1 or posedge id_1) begin : LABEL_1
    id_3 <= id_4;
  end
endmodule
