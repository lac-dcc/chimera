// Seed: 3807720641
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input supply0 id_2,
    output tri1 id_3,
    input uwire id_4,
    output supply1 id_5,
    output tri0 id_6,
    output supply0 id_7
);
  initial $display(id_4 + 1, 1);
endmodule
module module_1 (
    input uwire id_0,
    output wire id_1,
    input uwire id_2,
    input wire id_3,
    output supply1 id_4
);
  always @(posedge 1) begin
    id_1 = id_3;
  end
  module_0(
      id_3, id_3, id_2, id_4, id_3, id_1, id_1, id_4
  );
endmodule
