// Seed: 1233035909
module module_0 (
    input wor id_0,
    input wand id_1,
    output uwire id_2,
    output supply1 id_3,
    output tri0 id_4,
    input supply0 id_5
);
  wire id_7;
  tri  id_8 = 1'b0;
endmodule
module module_1 (
    output tri0 id_0,
    input supply0 id_1,
    output logic id_2,
    output tri0 id_3,
    input wire id_4
);
  always_comb #1 begin : LABEL_0
    id_2 <= id_4 ~^ 1 & 1;
  end
  wire id_6;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_0,
      id_3,
      id_0,
      id_1
  );
  assign modCall_1.type_3 = 0;
  assign id_0 = id_1;
  wire id_7;
  wire id_8;
  wire id_9;
  id_10(
      .id_0(""), .id_1(1 - 1), .id_2(1)
  );
endmodule
