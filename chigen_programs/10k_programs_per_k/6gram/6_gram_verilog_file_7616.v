// Seed: 121123
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input tri1 id_2,
    input supply0 id_3,
    input wor id_4,
    output tri0 id_5
);
  logic [7:0] id_7;
  id_8(
      .id_0()
  );
  assign id_7[1] = 1'b0;
endmodule
module module_1 (
    output tri0  id_0,
    input  tri1  id_1,
    input  uwire id_2,
    output wire  id_3,
    input  uwire id_4,
    output logic id_5
);
  always @(id_1) id_5 <= #1 1;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_2,
      id_1,
      id_2,
      id_3
  );
  assign modCall_1.type_2 = 0;
endmodule
