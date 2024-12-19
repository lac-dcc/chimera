// Seed: 1506071749
module module_0 (
    input tri id_0,
    input tri id_1,
    output supply0 id_2,
    input wire id_3,
    output wire id_4,
    input tri1 id_5,
    input supply1 id_6,
    input tri1 id_7,
    output supply1 id_8,
    input uwire id_9,
    output uwire id_10
);
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri0 id_4
);
  wire id_6;
  wire id_7;
  id_8(
      .id_0(""),
      .id_1(id_0),
      .id_2(id_6),
      .id_3(id_2),
      .id_4(1),
      .id_5(1 - id_2 ? 1'd0 : 1),
      .id_6(1),
      .id_7(id_2),
      .id_8(1)
  );
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_4,
      id_3,
      id_2,
      id_0,
      id_3,
      id_0
  );
endmodule
