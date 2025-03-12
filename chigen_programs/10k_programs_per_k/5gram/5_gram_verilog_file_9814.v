// Seed: 2098542853
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    input wand id_2,
    output supply1 id_3
);
  assign id_1 = 1;
endmodule
module module_1 (
    output tri1 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input supply0 id_3,
    input supply1 id_4,
    output logic id_5
);
  always @(posedge 1 or posedge -1'b0) id_5 <= id_3;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_0
  );
  assign modCall_1.id_1 = 0;
  tri id_7, id_8, id_9, id_10, id_11;
  assign id_9 = 1'b0;
  specify
    if (-1) (posedge id_12 => (id_13 +: 1)) = (1  : id_3  : 1 - id_9, 1);
  endspecify
endmodule
