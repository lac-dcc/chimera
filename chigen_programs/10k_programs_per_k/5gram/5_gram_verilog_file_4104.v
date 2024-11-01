// Seed: 1947459410
module module_0 #(
    parameter id_14 = 32'd60,
    parameter id_15 = 32'd82
) (
    input tri1 id_0
    , id_13,
    input supply0 id_1,
    input supply0 id_2,
    input supply0 id_3,
    output wor id_4,
    input wor id_5,
    input tri1 id_6,
    output wand id_7,
    input tri0 id_8,
    output wand id_9,
    input wand id_10,
    input wire id_11
);
  assign id_4 = 1;
  assign id_7 = id_2;
  defparam id_14.id_15 = 1 == 1'h0;
endmodule
module module_1 (
    input supply0 id_0,
    output wand id_1,
    output logic id_2,
    input logic id_3,
    output wor id_4,
    input wand id_5,
    output supply1 id_6,
    output wor id_7
);
  module_0(
      id_5, id_5, id_5, id_0, id_6, id_5, id_5, id_6, id_0, id_6, id_0, id_5
  );
  assign id_1 = ~id_3;
  always @(negedge 1) begin
    id_2 <= id_3;
  end
endmodule
