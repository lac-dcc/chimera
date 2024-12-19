// Seed: 1953073600
module module_0 (
    input tri0 id_0,
    output wire id_1,
    input tri1 id_2,
    input supply1 id_3,
    input tri id_4
);
  assign id_1 = 1;
  assign id_1 = id_4;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  wand id_0,
    output tri  id_1
);
  always @(negedge id_0 >= 1)
    if (id_0) begin : LABEL_0
      assume #1  (1)
      else $display(1 == ~&id_0, 1'h0, 1 < id_1++, 1, 1'b0, 1, (1'h0 & 1 & "") == id_0 && 1);
    end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_0
  );
  wire id_3;
endmodule
