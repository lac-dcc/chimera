// Seed: 29417172
module module_0 (
    output supply1 id_0,
    output tri0 id_1,
    output wor id_2,
    input tri1 id_3,
    input uwire id_4,
    input tri id_5,
    output tri0 id_6
);
  initial begin
    assume (id_4);
  end
endmodule
module module_1 (
    output uwire id_0,
    input wor id_1,
    input supply1 id_2,
    input wand id_3
);
  wire id_5;
  wor  id_6;
  always @(posedge id_5)
    if (1 && id_6 == 1) begin
      assume #1  (1)
      else $display(id_2);
      $display(!id_6, 1'd0, id_3, 1, 1'b0, 1 - id_3);
    end
  module_0(
      id_0, id_0, id_0, id_1, id_2, id_3, id_0
  );
endmodule
