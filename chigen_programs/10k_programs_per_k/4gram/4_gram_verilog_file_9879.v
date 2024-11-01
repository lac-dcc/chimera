// Seed: 1511680701
module module_0 #(
    parameter id_8 = 32'd55,
    parameter id_9 = 32'd94
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
  defparam id_8.id_9 = 1;
  tri id_10 = 1, id_11, id_12, id_13;
  wire id_14;
endmodule
module module_1 (
    output tri0 id_0,
    output wor  id_1,
    input  tri0 id_2
    , id_5,
    input  tri0 id_3
);
  wand id_6;
  assign id_6 = 1;
  module_0(
      id_6, id_6, id_6, id_6, id_6, id_6
  );
  assign id_1 = {1{id_2}} | 1;
  always_comb @(posedge 1) begin
    if (1) id_1 += ~1;
  end
  id_7 :
  assert property (@(negedge id_7) id_3)
  else $display(id_5, 1, ~id_7, id_3);
  wire id_8;
endmodule
