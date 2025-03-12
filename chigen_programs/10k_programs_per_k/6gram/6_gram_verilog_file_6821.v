// Seed: 3749200040
module module_0 (
    input tri0 id_0,
    input tri id_1,
    input supply0 id_2,
    output wand id_3,
    input uwire id_4,
    input tri1 id_5,
    output wire id_6,
    input tri1 id_7,
    output tri1 id_8,
    output tri1 id_9,
    input wire id_10,
    output uwire id_11,
    input wor id_12
);
  localparam id_14 = 1;
  wire id_15;
  assign id_9 = -1'b0 ? id_10 == -1 + 1 : id_0;
endmodule
module module_1 (
    output logic id_0,
    output tri1 id_1,
    output wor id_2,
    input tri id_3,
    inout wand id_4,
    output supply1 id_5
);
  wire id_7;
  always id_0 = @(!id_3) id_7 + id_3;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_2,
      id_3,
      id_3,
      id_1,
      id_4,
      id_2,
      id_5,
      id_3,
      id_2,
      id_4
  );
  assign modCall_1.id_12 = 0;
endmodule
