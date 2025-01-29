// Seed: 2535641359
module module_0;
  id_1(
      .id_0(id_2), .id_1(id_2), .id_2(1), .id_3(-1 - id_3)
  );
  assign id_2 = id_1;
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    output supply0 id_2,
    input supply0 id_3,
    input uwire id_4,
    id_11,
    input tri id_5,
    output logic id_6,
    input wor id_7,
    input tri0 id_8,
    input supply1 id_9
);
  always_ff begin : LABEL_0
    @(id_11 or id_9) #1;
    id_6 <= 1;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
endmodule
