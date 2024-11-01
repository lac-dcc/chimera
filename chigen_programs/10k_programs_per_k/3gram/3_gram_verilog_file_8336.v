// Seed: 2364791555
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri id_5,
    input tri1 id_6,
    input wor id_7,
    input tri1 id_8
);
  supply1 id_10 = id_6;
  logic [7:0] id_11;
  always @(posedge 1) begin
    id_10 = 1'b0;
  end
  assign id_11[1] = 1;
endmodule
module module_1 (
    output supply0 id_0,
    output wor id_1,
    input wire id_2,
    input supply0 id_3,
    inout wor id_4,
    input logic id_5
);
  reg id_7;
  supply1 id_8;
  id_9 :
  assert property (@(negedge id_8) id_3)
  else id_7 <= id_5;
  assign id_8 = 1;
  always_comb @(posedge id_9 or posedge 1) if (id_5) id_1 = 1;
  module_0(
      id_3, id_9, id_4, id_9, id_3, id_3, id_8, id_9, id_3
  );
endmodule
