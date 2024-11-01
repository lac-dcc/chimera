// Seed: 3991750811
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    output supply1 id_2
);
  supply1 id_4;
  always_latch @(negedge id_0 or posedge 1) id_4 = id_1 == 1;
endmodule
module module_1 (
    input  tri0  id_0,
    input  wand  id_1,
    output wand  id_2,
    output logic id_3,
    input  tri   id_4
);
  module_0(
      id_0, id_0, id_2
  );
  always @(posedge id_4 or posedge 1) begin
    assume #1  (id_4) $display(1'h0);
    else;
  end
  always @(posedge id_0) id_3 <= 1'b0;
  assign id_2 = 1 - {1, 1 | 1 - !id_1, 1'b0};
endmodule
