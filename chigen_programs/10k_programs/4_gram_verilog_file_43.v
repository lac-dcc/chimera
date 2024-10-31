// Seed: 2529974355
module module_0 (
    output supply1 id_0,
    output wand id_1
);
  assign id_1 = 1;
  module_2();
endmodule
module module_1 (
    output logic id_0,
    output wand id_1,
    input supply1 id_2,
    input logic id_3,
    input wand id_4,
    output supply0 id_5,
    input logic id_6,
    output tri0 id_7
);
  always_latch @(posedge id_6) id_0 <= id_3;
  module_0(
      id_7, id_5
  );
  assign id_0 = id_2 ? id_6 : id_6;
  final $display(id_3);
endmodule
module module_2;
  id_2(
      1'b0, id_3
  );
endmodule
