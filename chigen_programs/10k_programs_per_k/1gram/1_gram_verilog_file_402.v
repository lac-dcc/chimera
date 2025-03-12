// Seed: 3929980006
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    input wor id_2,
    input tri id_3,
    output uwire id_4,
    input wire id_5
);
  assign id_4 = id_2;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    output logic id_2,
    input supply0 id_3,
    input tri1 id_4,
    input tri id_5,
    output supply0 id_6,
    input tri id_7
);
  always @(posedge 1) id_2 = #1 -1'b0;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_0,
      id_6,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
