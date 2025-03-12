// Seed: 3838654409
module module_0 (
    output logic id_0,
    input tri1 id_1,
    output tri0 id_2,
    input tri1 id_3,
    output supply0 id_4,
    output logic id_5,
    input wire id_6[1 : 1]
);
  assign id_2 = {-1'b0{id_3 * -1}};
  always_comb id_0 = "";
  tri0  id_8 = -1;
  logic id_9;
  wire  id_10;
  wire  id_11;
  always id_5 = -1;
endmodule
module module_1 (
    input uwire id_0,
    inout wire id_1,
    input tri id_2,
    input supply1 id_3,
    output tri id_4,
    input wire id_5,
    output wire id_6,
    input tri1 id_7,
    output logic id_8,
    input tri1 id_9
);
  assign id_1 = -1'b0;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_1,
      id_9,
      id_6,
      id_8,
      id_7
  );
  assign modCall_1.id_2 = 0;
  for (id_11 = {1'b0, -1'd0} - id_9; -1; id_8 = id_2) assign id_1 = id_11;
endmodule
