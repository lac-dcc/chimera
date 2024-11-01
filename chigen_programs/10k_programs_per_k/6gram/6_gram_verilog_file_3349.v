// Seed: 572668754
module module_0 (
    input wor id_0,
    output supply0 id_1
    , id_9,
    input wire id_2,
    output tri1 id_3,
    output logic id_4,
    output tri module_0,
    input supply1 id_6,
    input supply0 id_7
);
  always @(negedge 1) id_4 <= 1;
  assign id_5 = id_0;
  initial
  fork
  join_none : id_10
endmodule
module module_1 (
    output supply1 id_0,
    input wor id_1,
    output logic id_2,
    input tri id_3,
    output uwire id_4
    , id_8,
    output wor id_5,
    input tri1 id_6
    , id_9
);
  always @(1) if (id_9) id_2 <= id_8;
  module_0(
      id_3, id_5, id_1, id_0, id_2, id_5, id_6, id_1
  );
  wand id_10 = (id_3);
  id_11(
      .id_0(id_0 - 1), .id_1(1), .id_2(1'b0), .id_3(1), .id_4(1), .id_5(1'b0), .id_6(id_6)
  );
  xnor (id_0, id_9, id_3, id_8);
  initial $display(id_8, 1'b0);
endmodule
