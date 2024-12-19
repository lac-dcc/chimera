// Seed: 2768041547
module module_0 (
    inout wire id_0,
    output wire id_1,
    input tri1 id_2,
    input supply1 id_3
);
  wire id_5;
  integer id_6;
  id_8(
      1
  );
  assign id_0 = id_6;
  supply1 id_9;
  wire id_10;
  tri id_11;
  wire id_12;
  wire id_13;
  assign id_9 = id_11;
  id_14(
      .id_0(id_2), .id_1(1)
  );
  wire id_15;
  wire id_16;
  assign id_1 = ~id_9 && 1;
endmodule
module module_1 (
    output wire id_0,
    output tri1 id_1,
    output supply0 id_2
    , id_6,
    input supply0 id_3,
    input supply0 id_4
);
  assign id_0 = id_6;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_3,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
