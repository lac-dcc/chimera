// Seed: 2721305629
module module_0 (
    output wire id_0,
    output wor  id_1,
    input  tri  id_2,
    output tri  id_3,
    input  tri1 id_4,
    output tri1 id_5,
    input  wand id_6,
    input  tri  id_7
);
endmodule
module module_0 #(
    parameter id_19 = 32'd40,
    parameter id_20 = 32'd29,
    parameter id_26 = 32'd31
) (
    input wire id_0,
    output logic id_1,
    input supply0 id_2,
    output tri0 id_3,
    input tri1 id_4,
    output tri0 id_5,
    output logic id_6,
    input wor id_7,
    input supply0 id_8,
    output logic id_9,
    output logic id_10,
    input tri1 id_11,
    input wand id_12,
    output supply1 id_13,
    output tri1 id_14,
    input wor id_15,
    input supply1 id_16,
    output supply0 id_17,
    input tri0 id_18,
    input supply1 _id_19,
    input tri0 _id_20,
    input tri id_21,
    input tri1 id_22,
    input tri0 id_23,
    input uwire module_1
);
  tri1 _id_26 = -1;
  bit [id_26 : -1 'h0] id_27 = id_21;
  logic id_28 = -1 | id_19 == -1, id_29;
  wire id_30, id_31 = ~id_0;
  module_0 modCall_1 (
      id_3,
      id_14,
      id_4,
      id_14,
      id_12,
      id_17,
      id_16,
      id_2
  );
  assign modCall_1.id_0 = 0;
  wire [id_20 : id_19  -  -1 'b0] id_32 = 1'h0;
  always @(*) begin : LABEL_0
    id_6 = #id_33 id_8;
    id_27 <= id_2;
    id_1  <= id_16;
    case ((id_7))
      -1: begin : LABEL_1
        assert (-1'h0);
      end
      -1'd0: id_32 -= id_15;
      -1'b0: id_10 <= id_11;
      id_18: id_33 += id_12;
      id_2:  id_9 <= #1 id_8;
    endcase
  end
endmodule
