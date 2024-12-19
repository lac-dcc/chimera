// Seed: 4028060439
module module_0 (
    input supply0 id_0,
    input uwire   id_1,
    input supply1 id_2
);
  wand id_4 = id_2;
  final $display(id_4 == id_1, id_0);
  wire id_5;
  wire id_7;
endmodule
module module_1 (
    input tri   id_0,
    input tri1  id_1,
    input uwire id_2,
    input wor   id_3
);
  always @(negedge 1'b0 & 1 or posedge id_1) id_5 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.id_2 = 0;
  id_6(
      .id_0(id_5), .id_1(id_0), .id_2(1), .id_3(id_2 == 1), .id_4(id_7), .id_5(id_5)
  );
  supply0 id_8;
  id_9(
      .id_0(1),
      .id_1(id_1),
      .id_2((id_8)),
      .id_3(id_2++),
      .id_4(1'b0 - 1'b0),
      .id_5(id_8 & 1 & {1, id_0++} & 1),
      .id_6(1)
  );
  wire id_10;
endmodule
