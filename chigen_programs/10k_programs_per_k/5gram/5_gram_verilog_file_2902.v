// Seed: 2289424802
module module_0;
  supply1 id_2;
  assign id_1 = id_2 !=? 1;
  wor  id_3 = 1'b0 || 1;
  wire id_4;
  wor id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17;
  always @(negedge 1) begin
    id_7 = id_1;
  end
endmodule
module module_1 (
    input logic id_0,
    output logic id_1,
    output wor id_2,
    output wire id_3,
    input logic id_4,
    output wand id_5,
    input supply0 id_6,
    input logic id_7
);
  logic id_9 = id_0;
  always_comb @(1'b0 == id_4 or 1) begin
    for (id_9 = id_6; id_9; id_1 = 1 == id_4 ? 1 : id_7) begin
      if ("") begin
        id_1 <= id_4;
      end
    end
  end
  module_0();
  wire id_10;
  initial begin
    wait (id_9);
    assert (id_7);
  end
endmodule
