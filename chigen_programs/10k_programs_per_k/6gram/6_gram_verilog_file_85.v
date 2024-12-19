// Seed: 1423064736
module module_0 (
    output wor id_0,
    input tri id_1,
    input supply1 id_2,
    input supply0 id_3,
    output logic id_4
);
  assign id_4#(.id_2(1'b0)) = ~id_3;
  tri1 id_6, id_7 = 1;
  always @(1 or 1) id_4 = #1 1'd0;
  id_8(
      1, 1 == 1, id_6
  );
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    input wire id_2,
    input wire id_3,
    input tri1 id_4,
    output tri id_5,
    output logic id_6,
    input logic id_7,
    input wand id_8,
    output supply0 id_9
);
  reg id_11;
  module_0 modCall_1 (
      id_9,
      id_3,
      id_1,
      id_2,
      id_6
  );
  wire id_12;
  always id_11 <= #id_8 1 ? id_11 : 1;
  assign id_6 = id_4 | 1 - 'h0;
  id_13(
      .id_0(), .id_1(1)
  );
  assign id_5 = 1 & id_11 | 1;
  id_14(
      .id_0(id_9), .id_1(id_13), .id_2()
  );
  initial id_6 = #1 id_7;
endmodule
