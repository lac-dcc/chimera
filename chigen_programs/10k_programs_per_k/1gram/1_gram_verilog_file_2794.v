// Seed: 1201736451
module module_0 #(
    parameter id_7 = 32'd59
) (
    input wor id_0,
    output tri1 id_1,
    input supply1 id_2[-1 : 1],
    input wor id_3,
    output wire id_4,
    output wire id_5
);
  assign id_4 = -1;
  logic _id_7 = -1;
  logic id_8;
  parameter id_9 = -1;
  struct {
    logic id_10;
    logic id_11;
    logic id_12;
    logic [1 'b0 : id_7  ==  ~  -1] id_13;
    logic id_14;
  } id_15;
  logic id_16, id_17 = id_16;
  assign id_16 = id_9;
endmodule
module module_1 (
    input tri1 id_0,
    output tri0 id_1,
    output logic id_2,
    output supply1 id_3,
    input wire id_4,
    input wand id_5
);
  always id_2 = 1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_0,
      id_5,
      id_1,
      id_3
  );
  assign modCall_1.id_7 = 0;
endmodule
