// Seed: 3332223598
module module_0 #(
    parameter id_0 = 32'd42,
    parameter id_3 = 32'd29
) (
    input tri1 _id_0,
    output tri0 id_1,
    input tri0 id_2,
    input tri _id_3,
    input tri0 id_4,
    input supply1 id_5,
    input supply0 id_6,
    output supply1 id_7,
    input tri0 id_8,
    input wire id_9,
    input wire id_10[id_3 : 1]
);
  assign id_7 = id_4;
  logic id_12[1  +  id_0 : ""];
endmodule
module module_1 #(
    parameter id_1 = 32'd67,
    parameter id_6 = 32'd35
) (
    output supply1 id_0,
    input wire _id_1,
    input wire id_2
);
  assign id_0 = -1;
  localparam id_4 = 1, id_5 = id_5, id_6 = id_5, id_7 = id_5 + id_4, id_8 = id_6;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_2,
      id_5,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_0 = 0;
  logic id_9 = id_1;
  final id_9 <= 1;
  wire [id_1 : id_6] id_10;
endmodule
