// Seed: 1134542275
module module_0 (
    input wand  id_0,
    input wand  id_1,
    input uwire id_2
);
  assign id_4[~1] = 1;
  wire id_5;
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    input supply1 id_2,
    output tri id_3,
    output logic id_4
);
  always_comb id_4 = #1 1;
  supply0 id_6;
  module_0(
      id_2, id_0, id_2
  );
  reg id_7;
  always if (id_0) @(*) @(posedge id_7) id_7 <= id_6 * id_1;
endmodule
module module_2 (
    output supply0 id_0,
    input wand id_1
);
  assign id_0 = 1'b0 ==? id_1(1'b0);
  module_0(
      id_1, id_1, id_1
  );
  wire id_3;
endmodule
