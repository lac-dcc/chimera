// Seed: 3829071348
module module_0 (
    input tri1 id_0,
    output tri id_1,
    output uwire id_2,
    input wire id_3,
    input wand id_4,
    output tri id_5,
    input uwire id_6,
    input supply0 id_7,
    output wand id_8,
    input tri0 id_9,
    input supply1 id_10,
    output supply0 id_11,
    input tri id_12,
    input uwire id_13,
    output supply0 id_14,
    input supply1 id_15,
    output tri id_16,
    input supply0 id_17,
    input supply1 id_18,
    input wor id_19,
    output tri0 id_20,
    input wand id_21,
    output wire id_22,
    input tri id_23,
    input wire id_24
);
endmodule
module module_1 #(
    parameter id_11 = 32'd72,
    parameter id_19 = 32'd26
) (
    input tri id_0,
    input tri id_1,
    input wire id_2,
    output wor id_3,
    output tri0 id_4,
    input wor id_5,
    output logic id_6,
    input supply1 id_7,
    output tri0 id_8,
    output uwire id_9,
    input wire id_10,
    input tri _id_11
);
  final id_6 <= -1;
  logic id_13;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_5,
      id_1,
      id_4,
      id_5,
      id_7,
      id_3,
      id_0,
      id_0,
      id_8,
      id_5,
      id_7,
      id_3,
      id_0,
      id_3,
      id_5,
      id_2,
      id_10,
      id_9,
      id_0,
      id_4,
      id_10,
      id_7
  );
  assign modCall_1.id_11 = 0;
  wire  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  _id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ;
  parameter id_31 = 1'b0 - 1;
  assign id_13 = 1;
  logic [id_19 : -  1  -  ~  id_11] id_32;
  wire id_33;
  assign id_24 = id_27 == -1;
  uwire id_34 = -1;
  always
    case (1)
      id_26:
      #(id_29 - -1'b0) begin : LABEL_0
        assign id_34 = 1;
      end
    endcase
  assign id_28 = 1;
  localparam id_35 = -1;
endmodule
