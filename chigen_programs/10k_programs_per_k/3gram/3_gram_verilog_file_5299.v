// Seed: 3946053301
module module_0 (
    output wor  id_0,
    input  wor  id_1,
    output tri1 id_2,
    input  tri0 id_3
);
  supply1 id_5;
  wire id_6;
  always @(posedge 1 * id_3 - id_5) begin
    id_5 = 1;
  end
  assign id_2 = id_5;
endmodule
module module_1 (
    output wor   id_0,
    input  tri1  id_1,
    input  wand  id_2,
    input  tri0  id_3,
    input  logic id_4
);
  id_6 :
  assert property (@(posedge id_2 | 1) id_4 & id_4)
  else id_6 <= id_4;
  module_0(
      id_0, id_2, id_0, id_1
  );
endmodule
