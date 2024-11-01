// Seed: 862104418
macromodule module_0 (
    output uwire id_0,
    output tri0 id_1,
    input wire id_2,
    output tri1 id_3,
    input uwire id_4,
    output tri1 id_5,
    input supply0 id_6 id_17,
    input tri id_7,
    output supply1 id_8,
    input supply1 id_9,
    output wand id_10,
    input uwire id_11,
    output uwire id_12,
    input wire id_13,
    output wand id_14,
    input tri id_15
);
  wire id_18;
  reg  id_19;
  always @(posedge id_15 or posedge 1 == 1) id_19 <= 1;
  wire id_20;
  wire id_21 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    output supply0 id_1
);
  supply1 id_3;
  module_0(
      id_1, id_1, id_0, id_1, id_0, id_1, id_0, id_0, id_1, id_0, id_1, id_0, id_1, id_0, id_1, id_0
  ); id_4 :
  assert property (@(posedge 1) {id_3 ? 1 : 1, 1 - 1})
  else begin
    $display();
  end
endmodule
