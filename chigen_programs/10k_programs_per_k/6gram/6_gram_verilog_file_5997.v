// Seed: 807285699
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input wor id_2,
    output tri0 id_3,
    output tri0 id_4,
    output tri0 id_5,
    input wire id_6,
    output supply1 id_7,
    input tri id_8,
    output supply1 id_9,
    input tri1 id_10,
    input uwire id_11,
    output wor id_12
);
endmodule
module module_1 #(
    parameter id_5 = 32'd26
) (
    output tri id_0,
    input wire id_1,
    output tri0 id_2,
    output tri1 id_3,
    input wire id_4,
    input tri0 _id_5,
    output tri id_6,
    input uwire id_7,
    input tri1 id_8,
    output supply1 id_9
);
  logic id_11 = -1;
  logic id_12;
  ;
  wire [1 : id_5] id_13;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_8,
      id_6,
      id_6,
      id_3,
      id_4,
      id_9,
      id_1,
      id_0,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_1 = 0;
  logic [7:0] id_14;
  ;
  wire [1 : -1] id_15[1 : -1 'b0];
  assign id_14[-1] = id_11 * id_7;
  wire id_16;
  parameter id_17 = 1;
  assign id_0 = {-1, id_17, 1'h0, -1, -1'b0, id_4};
  wire id_18;
  assign id_18 = -1 ? id_11 : id_13;
endmodule
