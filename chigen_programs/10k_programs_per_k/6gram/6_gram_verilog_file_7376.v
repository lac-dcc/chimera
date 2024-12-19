// Seed: 1211364976
module module_0 (
    input tri0 id_0,
    input wor id_1,
    output tri1 id_2,
    input supply0 id_3
);
  wire id_5;
  id_6(
      .id_0(1), .id_1(1'b0), .id_2(1), .id_3(1), .id_4(1 + 1), .id_5(id_3)
  );
endmodule
module module_1 (
    input  tri0  id_0,
    input  logic id_1,
    input  wire  id_2,
    output wire  id_3
);
  wire id_5 = 1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_0
  );
  assign modCall_1.id_0 = 0;
  reg  id_6;
  wire id_7;
  wire id_8;
  always @(*) if (1 || 1'h0) id_6 <= id_1;
endmodule
