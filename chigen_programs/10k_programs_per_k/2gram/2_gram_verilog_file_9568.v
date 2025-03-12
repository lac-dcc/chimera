// Seed: 2922585554
module module_0 (
    output logic id_0
);
  assign id_0 = 1'b0;
  always id_0 <= #1 -1;
  logic id_2 = -1'b0;
endmodule
module module_1 #(
    parameter id_6 = 32'd90,
    parameter id_8 = 32'd54
) (
    output logic id_0,
    output uwire id_1,
    input tri1 id_2,
    output tri id_3,
    input wor id_4,
    input supply1 id_5,
    input tri1 _id_6,
    input tri1 id_7,
    input uwire _id_8,
    input tri0 id_9,
    input tri id_10,
    input tri id_11,
    input supply0 id_12
);
  logic [-1 : id_8] id_14;
  module_0 modCall_1 (id_0);
  assign modCall_1.id_2 = 0;
  initial @(negedge id_10 or posedge 1 && 1) id_0 = -1 - id_5;
  assign id_3 = id_11 + -1;
  logic [id_6 : 1 'h0] id_15 = id_9, id_16;
endmodule
