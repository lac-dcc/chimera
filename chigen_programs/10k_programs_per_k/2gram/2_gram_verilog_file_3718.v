// Seed: 3762240646
module module_0 (
    input wor   id_0,
    input tri0  id_1,
    input uwire id_2,
    input tri0  id_3,
    input uwire id_4
    , id_7,
    input tri1  id_5
);
  wire id_8;
  wire id_9;
  task id_10;
    id_10 = #1 1;
  endtask
  always_ff begin
    id_7 <= 1;
  end
  always_latch id_7 = id_10;
endmodule
module module_1 (
    output tri1 id_0,
    output supply1 id_1,
    output uwire id_2,
    input tri id_3,
    input supply0 id_4,
    output tri0 id_5,
    output supply1 id_6,
    input tri1 id_7,
    input tri1 id_8,
    output tri1 id_9,
    input supply1 id_10,
    output tri1 id_11,
    input wor id_12,
    input tri id_13,
    output tri1 id_14,
    output supply0 id_15,
    input wand id_16,
    input uwire id_17
);
  wire id_19;
  xnor (id_6, id_8, id_10, id_7, id_12, id_4, id_16, id_17, id_13, id_19);
  module_0(
      id_4, id_10, id_12, id_17, id_3, id_3
  );
  wire id_20;
endmodule
