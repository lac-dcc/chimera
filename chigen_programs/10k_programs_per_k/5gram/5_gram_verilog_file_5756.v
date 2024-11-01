// Seed: 2136923470
module module_0 (
    output wor id_0,
    input wor id_1,
    output wire id_2,
    input tri id_3,
    input wor id_4,
    input wor id_5,
    input tri1 id_6,
    input supply1 id_7,
    input wor id_8,
    input uwire id_9,
    inout wor id_10,
    output uwire id_11,
    output tri0 id_12,
    input wor id_13,
    output wand id_14,
    input wand id_15,
    output tri1 id_16,
    output wand id_17
);
  id_19 :
  assert property (@(posedge 1) 1)
  else $display;
  for (id_20 = id_6; id_20; id_16 = id_9) assign id_12 = id_15;
  id_21 :
  assert property (@(posedge id_13) id_7 == 1 - id_15)
  else $display(id_6, id_6);
endmodule
module module_1 (
    input wand id_0,
    output tri id_1,
    output tri1 id_2,
    inout supply1 id_3,
    output wand id_4,
    output wire id_5
);
  assign id_4 = 1 == id_0;
  module_0(
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_0,
      id_5,
      id_4
  );
endmodule
