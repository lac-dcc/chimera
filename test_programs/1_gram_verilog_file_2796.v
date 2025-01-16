// Seed: 3179501278
module module_0 (
    input supply0 id_0,
    output logic id_1,
    input supply0 id_2,
    input uwire id_3,
    input tri id_4
);
  always id_1 <= 1'h0 && -1;
  wand id_6 = id_4;
  assign id_1 = {-1{1}};
  wire id_7;
endmodule
program module_1 (
    input tri   id_0,
    input wire  id_1,
    input wand  id_2,
    inout logic id_3,
    input wire  id_4,
    input wire  id_5
);
  initial if (id_2) id_3 <= 1;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_2,
      id_1,
      id_0
  );
  assign modCall_1.id_6 = 0;
endmodule
