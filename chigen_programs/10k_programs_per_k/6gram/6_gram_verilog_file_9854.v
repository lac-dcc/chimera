// Seed: 1931414213
module module_0 (
    input  wor   id_0,
    input  wor   id_1,
    input  wor   id_2,
    input  uwire id_3,
    output wor   id_4,
    input  uwire id_5,
    output tri0  id_6
);
  supply1 id_8;
  assign id_8 = "" << {~id_8, 1'd0, id_3, id_2};
  wire id_9;
  wire id_10;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    output supply1 id_2,
    output tri1 id_3,
    output wire id_4,
    output wire id_5,
    output supply1 id_6,
    output logic id_7,
    output tri1 id_8,
    input supply0 id_9,
    input wand id_10,
    output wor id_11,
    input wire id_12,
    input wire id_13,
    input logic id_14,
    output tri0 id_15,
    input supply1 id_16,
    input tri id_17,
    input tri id_18,
    output supply0 id_19,
    input uwire id_20,
    input uwire id_21,
    input uwire id_22,
    input wor id_23,
    input wor id_24,
    output uwire id_25
);
  wire id_27;
  module_0 modCall_1 (
      id_20,
      id_16,
      id_10,
      id_22,
      id_2,
      id_17,
      id_11
  );
  assign modCall_1.id_2 = 0;
  always #1
    casez (1)
      1: id_7 = 1'b0;
      default: begin : LABEL_0
        id_7 <= id_14;
      end
    endcase
endmodule
