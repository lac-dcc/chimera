// Seed: 1525085450
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input uwire id_2,
    input wand id_3,
    output tri1 id_4,
    input wor id_5,
    input uwire id_6,
    input supply1 id_7,
    input wand id_8
);
  wor id_10 = id_8;
  always_ff @(1 or posedge 1) begin
    fork
      id_11;
    join_none
  end
  wire id_12, id_13, id_14;
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    output wire id_2
);
  supply1 id_4 = id_0, id_5;
  module_0(
      id_4, id_4, id_5, id_4, id_4, id_1, id_0, id_5, id_4
  );
  assign id_5 = id_2++;
endmodule
