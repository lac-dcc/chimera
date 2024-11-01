// Seed: 289321714
module module_0 (
    input tri0 id_0,
    input wand id_1,
    output wire id_2,
    input tri0 id_3,
    output uwire id_4,
    output tri1 id_5,
    output tri1 id_6,
    input tri0 id_7,
    output supply1 id_8,
    input wand id_9,
    output supply1 id_10,
    input wor id_11,
    output tri id_12,
    input tri id_13,
    output supply1 id_14,
    output supply1 id_15,
    input tri0 id_16,
    input wand id_17
);
  id_19(
      .id_0(1), .id_1(id_5), .id_2(1), .id_3(1), .id_4(1), .id_5(1'b0 - id_7), .id_6(1), .id_7(id_5)
  );
  wire id_20;
  id_21(
      .id_0(id_22),
      .id_1(1),
      .id_2(1),
      .id_3(id_12),
      .id_4(id_22),
      .id_5(id_5 ? id_1 : 1),
      .id_6(1),
      .id_7(id_15),
      .id_8(1)
  );
endmodule
module module_1 (
    output wor id_0,
    input uwire id_1,
    output wor id_2,
    input supply1 id_3,
    input logic id_4,
    output logic id_5,
    input tri1 id_6
);
  assign id_2 = 1;
  module_0(
      id_3,
      id_1,
      id_0,
      id_3,
      id_2,
      id_0,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_1,
      id_2,
      id_6,
      id_2,
      id_2,
      id_1,
      id_3
  );
  always #1 begin
    id_5 <= id_4;
  end
  wire id_8;
endmodule
