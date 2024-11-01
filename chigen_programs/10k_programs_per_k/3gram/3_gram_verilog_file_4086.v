// Seed: 321296251
module module_0 (
    output supply1 id_0,
    output tri0 id_1,
    output tri0 id_2
);
  module_2();
endmodule
module module_1 (
    input wor id_0,
    output supply0 id_1,
    input supply0 id_2,
    output wire id_3,
    input tri1 id_4,
    input tri id_5,
    input supply1 id_6,
    input wire id_7
    , id_11,
    input supply0 id_8,
    output wor id_9
);
  wire id_12;
  or (id_9, id_4, id_2, id_5, id_6, id_11, id_0, id_12, id_7);
  module_0(
      id_9, id_3, id_9
  );
endmodule
module module_2;
  always @* id_1 = 1'b0;
  always_latch
  fork
    @(*) id_1 = id_1 + 1;
    if (1'h0 - {1{id_1 * 1}}) begin
      id_1 <= (1);
      #1 cover (1);
    end
  join
endmodule
