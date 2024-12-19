// Seed: 2963231634
module module_0 (
    input wor id_0,
    input supply1 id_1,
    input wand id_2,
    input wire id_3,
    input uwire id_4,
    input tri0 id_5
);
  integer id_7;
  wire id_8;
  integer id_9;
  id_10(
      id_0 ? ~1'h0 : 1'b0
  );
  assign {1, 1, id_1} = 1;
  wire id_11;
  wire id_12, id_13;
endmodule
module module_1 (
    output tri  id_0,
    input  tri0 id_1,
    input  tri  id_2
);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_4 = 0;
  rnmos (
      .id_0(1), .id_1(1'd0), .id_2(1), .id_3(id_0), .id_4(1), .id_5(id_0), .id_6(~id_2), .id_7(id_1)
  );
  always id_0 = 1 - 1;
  wire id_4;
  wire id_5;
endmodule
