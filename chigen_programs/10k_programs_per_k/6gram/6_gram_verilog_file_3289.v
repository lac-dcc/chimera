// Seed: 240367213
module module_0 (
    input wand id_0,
    input wand id_1,
    input tri id_2,
    inout supply1 id_3,
    input tri id_4,
    input supply0 id_5,
    input wand id_6,
    output uwire id_7,
    output tri id_8
);
  assign id_3 = 1 & (1'd0);
  assign id_3 = id_3;
  wire id_10;
  wire id_11;
  wire id_12;
  id_13(
      .id_0(1), .id_1(1), .id_2(), .id_3(id_12), .id_4(1 - 1), .id_5(~id_0 == id_0)
  );
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output supply1 id_0
    , id_8,
    input supply1 id_1,
    input wor id_2,
    output wor id_3,
    output wand id_4,
    inout tri0 id_5,
    input tri id_6
);
  wor  id_9;
  wire id_10;
  nor primCall (id_0, id_10, id_9, id_1, id_8, id_5, id_6, id_11);
  wire id_11;
  assign id_4 = id_5 && id_9;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_9,
      id_6,
      id_1,
      id_5,
      id_5,
      id_0
  );
endmodule
