// Seed: 1236995698
module module_0 (
    input wor id_0,
    input uwire id_1,
    input wor id_2,
    input tri id_3,
    input tri id_4,
    input supply0 id_5,
    output uwire id_6,
    input wand id_7,
    output uwire id_8,
    input uwire id_9,
    output tri id_10
);
  supply1 id_12 = id_0;
  assign id_12 = id_0;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    output logic id_2,
    input tri0 id_3,
    output tri1 id_4,
    input tri0 id_5,
    output tri id_6,
    input supply0 id_7,
    output supply1 id_8
);
  module_0(
      id_3, id_1, id_1, id_0, id_5, id_3, id_6, id_1, id_6, id_0, id_8
  );
  tri0 id_10 = 1;
  always @(posedge id_3) id_2 <= #1 1;
endmodule
