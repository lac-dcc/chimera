// Seed: 3822444919
module module_0 (
    output supply1 id_0,
    input wand id_1,
    input tri1 id_2,
    input wor id_3,
    input tri id_4,
    input tri id_5,
    input supply1 id_6
);
  wire id_8;
  logic [7:0] id_9;
  wire id_10;
  id_11(
      .id_0(1), .id_1(id_2 == id_6), .id_2(id_2), .id_3(id_9[1&1])
  );
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1
);
  assign id_3 = id_0;
  wire id_4;
  always @(id_0 or posedge 1);
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_1,
      id_0,
      id_3,
      id_1
  );
  assign modCall_1.id_6 = 0;
  wire id_7;
endmodule
