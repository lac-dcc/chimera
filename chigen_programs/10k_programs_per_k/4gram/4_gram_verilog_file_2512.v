// Seed: 1868383552
module module_0 (
    output uwire id_0,
    input uwire id_1,
    output wor id_2,
    output tri id_3,
    output supply1 id_4,
    input tri id_5,
    output tri1 id_6
);
  wire id_8;
endmodule
module module_1 (
    input  uwire id_0
    , id_4,
    input  wire  id_1,
    output wand  id_2
);
  wire id_5;
  module_0(
      id_2, id_0, id_2, id_2, id_2, id_1, id_2
  ); id_6 :
  assert property (@(posedge 1'b0) id_4)
  else $display(1'h0);
  assign id_4 = 1'd0 ? 1 : ({id_4, 1});
  always @(negedge 1) begin
    if (id_1) id_4 = 1;
  end
endmodule
