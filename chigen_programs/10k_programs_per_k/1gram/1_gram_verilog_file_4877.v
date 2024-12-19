// Seed: 2952315603
module module_0 (
    input uwire id_0,
    input wor id_1,
    input wor id_2,
    input uwire id_3,
    output uwire id_4,
    input supply0 id_5,
    input tri id_6,
    output tri id_7,
    output uwire id_8,
    output uwire id_9,
    input tri id_10,
    input wand id_11
);
  assign id_7 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    output supply0 id_2,
    input wor id_3,
    input wand id_4,
    input supply1 id_5,
    input supply1 id_6,
    output logic id_7
);
  always id_7 = #id_9 1;
  wire id_10;
  always $display(id_5);
  tri id_11, id_12;
  id_13(
      .id_0(id_12.id_7 == 1), .id_1(id_10), .id_2((id_12)), .id_3(1)
  );
  module_0 modCall_1 (
      id_0,
      id_4,
      id_1,
      id_4,
      id_2,
      id_3,
      id_6,
      id_2,
      id_2,
      id_2,
      id_1,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
