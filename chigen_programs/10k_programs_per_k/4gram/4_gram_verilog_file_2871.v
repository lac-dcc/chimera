// Seed: 2316569444
module module_0 (
    input wor id_0,
    input tri id_1,
    input supply1 id_2,
    input tri id_3,
    output tri1 id_4,
    input tri1 id_5,
    input wor id_6,
    input supply1 id_7,
    input wor id_8
);
  uwire id_10;
  assign module_1.id_4 = 0;
  assign id_10 = 1;
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1,
    input supply1 id_2,
    output uwire id_3,
    inout tri0 id_4,
    output tri id_5,
    input tri1 id_6,
    input supply1 id_7
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_3,
      id_4,
      id_1,
      id_6,
      id_6
  );
  assign id_5 = 1;
  reg id_9;
  always @(1 or posedge id_6) id_9 <= 1;
endmodule
