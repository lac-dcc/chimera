// Seed: 2931450862
module module_0 #(
    parameter id_42 = 32'd36,
    parameter id_43 = 32'd52
) (
    output supply0 id_0,
    input tri0 id_1,
    input wand id_2,
    input wand id_3,
    input tri0 id_4,
    input tri1 id_5,
    output tri0 id_6,
    input wand id_7,
    input tri id_8,
    output wire id_9,
    input uwire id_10,
    input wor id_11,
    input uwire module_0,
    output tri0 id_13,
    output tri1 id_14,
    input wor id_15,
    input tri id_16,
    output wire id_17,
    input uwire id_18,
    input wand id_19,
    input tri0 id_20,
    output tri0 id_21
    , id_37,
    input tri0 id_22,
    output wor id_23,
    output wand id_24,
    input tri0 id_25,
    input wire id_26,
    input wor id_27,
    input wor id_28,
    output supply0 id_29,
    input wor id_30,
    input wor id_31,
    input supply0 id_32
    , id_38,
    input tri1 id_33,
    input supply1 id_34,
    output tri id_35
);
  logic [7:0] id_39, id_40;
  assign id_39[1] = id_25 & 1;
  wor id_41 = 1'd0;
  assign id_9 = 1;
  always @(negedge 1);
  assign id_14 = 1;
  generate
    always @(posedge id_28) begin : LABEL_0
      id_17 = id_1 == id_28;
      if (1)
        assume (1);
        else id_13 = id_32;
    end
    case (id_1)
      1: begin : LABEL_0
        defparam id_42.id_43 = 1;
        assign id_13 = id_27;
      end
      default:
      begin : LABEL_0
        supply1 id_44 = 1;
      end
    endcase
  endgenerate
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  tri0  id_1,
    input  wand  id_2
);
  wire id_4;
  wire id_5;
  supply0 id_6 = id_1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_2,
      id_1,
      id_2,
      id_2,
      id_6,
      id_6,
      id_2,
      id_6,
      id_6,
      id_1,
      id_1,
      id_0,
      id_0,
      id_2,
      id_6,
      id_6,
      id_2,
      id_1,
      id_2,
      id_0,
      id_6,
      id_6,
      id_6,
      id_2,
      id_1,
      id_1,
      id_1,
      id_0,
      id_6,
      id_6,
      id_1,
      id_1,
      id_2,
      id_0
  );
  timeprecision 1ps;
endmodule
