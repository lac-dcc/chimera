// Seed: 3098709818
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wand id_4, id_5, id_6;
  assign id_4 = -1'b0;
  wire id_7, id_8;
  assign id_3 = -1;
  wire id_9;
  id_10(
      .id_0(id_8), .id_1(1), .id_2(id_2), .id_3(-1), .id_4(id_7), .id_5(id_9.id_1)
  );
  wire id_11;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  uwire id_4;
  bufif0 primCall (id_1, id_2, id_3);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4
  );
  assign modCall_1.id_3 = 0;
  always_latch id_1 <= ~id_4;
endmodule
