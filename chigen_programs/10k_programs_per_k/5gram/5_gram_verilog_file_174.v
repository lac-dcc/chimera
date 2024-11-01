// Seed: 2923060931
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    output uwire id_2,
    input tri0 id_3,
    input wor id_4,
    output supply1 id_5,
    input wand id_6,
    output tri0 id_7,
    input wire id_8,
    input wire id_9,
    output wire id_10,
    input wire id_11,
    input tri0 id_12,
    input wor id_13,
    input tri0 id_14,
    input supply1 id_15
);
  id_17 :
  assert property (@(posedge id_17) 1 - id_13)
  else $display();
  assign id_17 = id_11;
  assign id_10 = id_17;
  wire id_18 = 1'h0 < id_4;
  assign id_7 = id_8;
  wor id_19 = "" ~^ id_8;
  task id_20;
    id_10 = id_19;
  endtask
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    output wand id_3
);
  wire id_5;
  module_0(
      id_0, id_2, id_3, id_0, id_0, id_3, id_0, id_3, id_1, id_2, id_3, id_1, id_0, id_0, id_0, id_0
  );
endmodule
