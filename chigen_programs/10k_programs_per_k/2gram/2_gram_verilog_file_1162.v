// Seed: 3247545378
module module_0 (
    input wand id_0,
    output wand id_1,
    input supply0 id_2,
    output tri0 id_3,
    input tri0 id_4,
    input wand id_5,
    input tri1 id_6,
    output wor id_7
);
  assign id_3 = id_2 < id_6 ? -1 : id_2;
  localparam id_9 = !1;
  wire id_10;
endmodule
module module_1 (
    output wand  id_0,
    input  tri0  id_1,
    input  wire  id_2,
    output logic id_3,
    input  tri1  id_4
);
  assign id_3 = 1'b0;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_0,
      id_4,
      id_1,
      id_2,
      id_0
  );
  assign modCall_1.id_6 = 0;
  always id_3 <= id_0++;
endmodule
