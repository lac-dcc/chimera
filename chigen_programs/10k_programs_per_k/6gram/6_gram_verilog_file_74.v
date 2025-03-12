// Seed: 3869210726
module module_0 (
    output tri1 id_0,
    output tri0 id_1,
    input supply1 id_2,
    output tri id_3
);
  assign id_0 = -1;
endmodule
module module_1 (
    input wand id_0,
    input tri id_1,
    output logic id_2,
    input tri0 id_3,
    input uwire id_4,
    input supply1 id_5,
    output tri1 id_6,
    output tri id_7,
    output wire id_8
);
  always force id_8 = -1'h0;
  assign module_1 = 1 ? ~id_3 : id_1;
  assign id_7 = id_1;
  module_0 modCall_1 (
      id_7,
      id_8,
      id_1,
      id_8
  );
  assign modCall_1.id_2 = 0;
  always @* id_2 <= id_3;
endmodule
