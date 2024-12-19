// Seed: 2837892924
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input supply0 id_2,
    input wire id_3
);
  assign id_5 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    input wire id_2,
    input wand id_3,
    input wor id_4,
    output logic id_5
);
  always begin : LABEL_0
    id_7(1, 1);
    #1;
    wait (id_3 < id_2);
    id_5 = #id_8 1;
    {1} += 1;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0
  );
  assign modCall_1.id_5 = 0;
endmodule
