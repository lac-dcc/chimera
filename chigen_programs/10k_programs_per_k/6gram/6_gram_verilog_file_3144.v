// Seed: 1820611382
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    input supply0 id_2,
    output tri1 id_3,
    output tri1 id_4,
    input tri1 id_5,
    output supply1 id_6,
    output supply0 id_7
);
endmodule
module module_1 #(
    parameter id_0 = 32'd42
) (
    input supply1 _id_0,
    output supply1 id_1,
    input tri id_2,
    input tri1 id_3,
    input tri id_4
);
  bit id_6;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_6 = 0;
  parameter id_7 = !1;
  struct packed {
    id_8 id_9;
    logic [1 'b0 : id_0  |  -1 'b0] id_10;
  } id_11;
  ;
  always @(~id_7 or posedge id_7) id_6 = id_0 & 1;
  assign id_11 = id_11.id_9;
endmodule
