// Seed: 1038788397
module module_0 (
    output tri id_0,
    input tri1 id_1,
    input wand id_2,
    input supply0 id_3,
    input wand id_4,
    input wor id_5,
    input uwire id_6,
    output uwire id_7,
    output tri1 id_8,
    input wand id_9,
    output uwire id_10,
    input wire id_11,
    input wand id_12,
    output tri0 id_13,
    input wand id_14,
    input tri1 id_15,
    input tri1 id_16,
    input tri0 id_17,
    input tri0 id_18
);
endmodule
module module_1 (
    input  wor  id_0,
    input  tri  id_1,
    output tri1 id_2
);
  id_4(
      .id_0(id_2)
  );
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_0,
      id_2,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.type_7 = 0;
  task id_5;
    input id_6;
    id_4 = !id_0;
    ;
  endtask
endmodule
