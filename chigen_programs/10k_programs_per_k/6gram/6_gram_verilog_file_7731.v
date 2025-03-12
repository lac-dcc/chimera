// Seed: 2087163739
module module_0 (
    input wire id_0,
    input supply0 id_1,
    output wor id_2,
    input supply0 id_3,
    input supply1 id_4,
    input supply0 id_5,
    output supply1 id_6
);
  parameter id_8 = 1;
  localparam id_9 = id_8;
  wire [1 : 1] id_10;
  assign id_2 = id_8;
  logic [7:0] id_11, id_12;
  logic id_13 = !id_10;
  assign id_13 = 1 ? 1 : -1'b0 ? id_12 & id_5#(.id_9(id_8[-1])) : 1;
  logic id_14;
  assign id_11[-1'b0] = -1;
endmodule
module module_1 (
    input wand id_0,
    input wand id_1,
    output wire id_2,
    output uwire id_3,
    output tri1 id_4,
    output supply0 id_5,
    input supply1 id_6,
    input tri id_7,
    input uwire id_8,
    input supply1 id_9,
    output supply1 id_10,
    input uwire id_11,
    input wand id_12,
    input tri1 id_13,
    input tri1 id_14,
    output supply0 id_15,
    input wire id_16,
    input supply1 id_17,
    output supply0 id_18,
    input wor id_19
    , id_25,
    input tri1 id_20,
    output logic id_21,
    input supply0 id_22,
    input wand id_23
);
  wire [1 'd0 : -1 'b0] id_26;
  module_0 modCall_1 (
      id_22,
      id_6,
      id_5,
      id_9,
      id_8,
      id_14,
      id_2
  );
  assign modCall_1.id_1 = 0;
  wire id_27;
  initial begin : LABEL_0
    id_21 <= -1;
    assume #1  (-1'b0) $clog2(83);
    ;
  end
endmodule
