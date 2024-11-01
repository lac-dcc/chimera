// Seed: 3949440765
module module_0 (
    output tri1 id_0,
    input tri1 id_1,
    input tri1 id_2,
    input wor id_3,
    output supply0 id_4,
    output supply0 id_5,
    input tri0 id_6,
    input wor id_7,
    output supply1 id_8
);
  assign id_4 = 1;
  wor  id_10 = 1;
  wire id_11;
  assign (supply1, strong0) id_11 = id_2;
  assign id_8 = id_7 ? 1 : id_11 ? 1 : (1);
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    input logic id_2,
    output tri1 id_3,
    output logic id_4
);
  always @(id_0 - 1 or negedge id_0) id_4 <= id_2;
  module_0(
      id_3, id_0, id_0, id_0, id_3, id_3, id_0, id_0, id_3
  );
endmodule
