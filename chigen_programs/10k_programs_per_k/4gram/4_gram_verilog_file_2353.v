// Seed: 1834082617
module module_0;
  wire id_2;
  always @(negedge 1) id_1 = id_2;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input logic id_0,
    input logic id_1,
    output supply0 id_2,
    input logic id_3
    , id_7,
    input supply1 id_4,
    input wand id_5
);
  always_latch @(*)
    if (1) begin : LABEL_0
      id_2 = 1;
      id_7 <= id_3;
      id_8(id_4, 1, !id_7);
      id_7 = id_1;
      #1;
      if (id_0 == id_7) begin : LABEL_0
        id_7 = id_0;
      end
    end
  module_0 modCall_1 ();
endmodule
