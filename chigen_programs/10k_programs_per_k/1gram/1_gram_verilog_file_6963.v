// Seed: 1476942531
module module_0 (
    output uwire id_0,
    output wor id_1,
    input supply1 id_2,
    input wor id_3,
    input wor id_4,
    input supply0 id_5,
    output tri id_6,
    input tri0 id_7
);
  wire id_9;
  wire id_10;
  logic [7:0] id_11, id_12;
  assign module_1.type_27 = 0;
  wire id_13, id_14, id_15;
  tri1 id_16 = 1 / id_3, id_17;
  assign id_11[(1'd0)] = 1;
endmodule
module module_1 (
    output tri1 id_0,
    input tri0 id_1,
    output tri id_2,
    input logic id_3,
    output wor id_4,
    input tri1 id_5,
    input tri0 id_6,
    input uwire id_7,
    output wor id_8,
    input wor id_9,
    output supply1 id_10,
    output tri0 id_11,
    input uwire id_12,
    output wire id_13,
    input tri1 id_14,
    output wire id_15,
    input wire id_16,
    output tri1 id_17,
    input wand id_18,
    output supply1 id_19
);
  wire id_21;
  module_0 modCall_1 (
      id_0,
      id_15,
      id_7,
      id_5,
      id_9,
      id_18,
      id_4,
      id_18
  );
  assign id_10 = id_14;
  final
    @((1 * id_12) or posedge id_3) begin : LABEL_0
      id_0 = 1;
    end
  int id_22;
endmodule
