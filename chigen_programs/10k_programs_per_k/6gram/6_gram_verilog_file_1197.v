// Seed: 4137013204
module module_0 (
    input wor id_0,
    input supply1 id_1,
    output tri1 id_2
);
  uwire id_4;
  assign id_2 = id_1;
  wire id_5;
  initial id_4 = id_0;
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1,
    output wire  id_2,
    input  uwire id_3,
    input  uwire id_4,
    output tri   id_5,
    output wire  id_6
);
  wand id_8 = (id_4);
  id_9(
      .id_0(1), .id_1(1), .id_2(id_4), .id_3(id_3), .id_4(id_0 ==? 1'b0)
  );
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
  assign id_5 = id_8 ? 1 : 1 ? 1 : id_1;
endmodule
