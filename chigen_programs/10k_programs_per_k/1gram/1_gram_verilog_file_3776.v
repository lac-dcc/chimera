// Seed: 2108397534
module module_0 (
    output logic id_0,
    input tri1 id_1,
    input supply1 id_2,
    output tri1 id_3
    , id_14 = -1'b0,
    output tri id_4,
    output wire id_5,
    output wand id_6,
    input supply0 id_7,
    output wand id_8,
    input wor id_9,
    output wire id_10,
    input wire id_11,
    output tri0 id_12
);
  assign id_0 = -1;
  always id_0 = 1;
  assign module_1.id_7 = 0;
  logic id_15[1 : -1];
  id_16(
      (-1'b0)
  );
endmodule
module module_1 (
    input  wire  id_0,
    input  wire  id_1,
    output logic id_2,
    input  tri0  id_3,
    output wor   id_4,
    output logic id_5,
    input  logic id_6,
    input  logic id_7,
    output wire  id_8,
    output logic id_9,
    input  wire  id_10,
    input  tri0  id_11
    , id_13
);
  parameter id_14 = 1;
  always_comb
    case (id_3)
      -1: id_2 <= id_7;
      1: id_5.id_6.id_7 = id_0 * -1'd0;
      1'b0: id_9 = -1'd0;
      id_10: begin : LABEL_0
        @(-1'd0) begin : LABEL_1
          id_5 <= 1;
          id_2 <= -1;
        end
      end
      -1: ;
    endcase
  module_0 modCall_1 (
      id_2,
      id_10,
      id_0,
      id_4,
      id_8,
      id_8,
      id_4,
      id_1,
      id_4,
      id_3,
      id_8,
      id_3,
      id_4
  );
endmodule
