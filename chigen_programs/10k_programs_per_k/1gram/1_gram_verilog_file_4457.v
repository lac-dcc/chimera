// Seed: 4143831813
module module_0 #(
    parameter id_5 = 32'd39
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_4, _id_5;
  struct packed {
    logic id_6;
    logic id_7 = 1;
    logic id_8;
    logic id_9[1 : 1 'b0];
    logic id_10;
    struct packed {logic id_11;} id_12;
    logic id_13;
  }
      id_14, id_15;
  logic id_16 = 1'b0;
  wire [1 'b0 : id_5] id_17, id_18;
  localparam id_19 = 1;
  logic id_20 = id_17, id_21, id_22;
  wire id_23;
  assign id_22 = id_14.id_6;
endmodule
module module_1 (
    output supply0 id_0,
    output supply1 id_1,
    input wand id_2,
    input supply1 id_3,
    input tri id_4,
    input wor void id_5,
    input tri1 id_6
);
  wire id_8, id_9, id_10;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8
  );
  assign modCall_1.id_16 = 0;
endmodule
