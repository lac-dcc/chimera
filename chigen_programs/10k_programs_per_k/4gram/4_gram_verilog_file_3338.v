// Seed: 2222224008
module module_0 #(
    parameter id_9 = 32'd39
) (
    output logic id_0,
    input uwire id_1,
    input supply1 id_2,
    output logic id_3,
    input tri id_4,
    input uwire id_5,
    input wand id_6,
    input wand sample,
    input tri id_8,
    input tri _id_9,
    output wor id_10,
    input wand id_11,
    input tri id_12,
    input supply1 id_13,
    input wor id_14,
    input wire id_15,
    input uwire id_16,
    output tri0 id_17
);
  assign id_0 = 1'd0;
  wire id_19;
  final $clog2(26);
  ;
  assign id_10 = 1;
  wire  id_20;
  logic id_21 [module_0 : id_9];
  wire  id_22;
  always @(posedge -1) begin : LABEL_0
    case (1)
      1: id_3 = -1'b0 == id_22;
      default: begin : LABEL_1
        id_0 <= 1;
      end
    endcase
  end
  parameter id_23 = -1;
endmodule
module module_1 #(
    parameter id_10 = 32'd53,
    parameter id_4  = 32'd60
) (
    output logic id_0,
    output tri id_1,
    output supply1 id_2
    , id_23,
    input tri id_3,
    input wire _id_4,
    output uwire id_5
    , id_24,
    output supply1 id_6,
    input tri0 id_7,
    output uwire id_8,
    input uwire id_9,
    input tri1 _id_10,
    input supply1 id_11,
    input wand id_12,
    input supply0 id_13,
    input tri1 id_14,
    input uwire id_15,
    input tri1 id_16,
    input wor id_17,
    input supply0 id_18,
    output wand id_19,
    output uwire id_20,
    input wand id_21
);
  logic [1 : id_4  -  id_10] id_25;
  ;
  assign id_20 = 1;
  localparam id_26 = -1 - -1 - 1;
  always_ff @(1 or posedge -1) id_0 = 1;
  wire id_27;
  logic [1 : 1] id_28 = -1'b0;
  for (id_29 = -1'b0; id_4; id_27 += 1) begin : LABEL_0
    wire id_30;
  end
  wire id_31;
  assign id_27#(
      .id_4 (id_26),
      .id_28(id_26)
  ) = id_11;
  module_0 modCall_1 (
      id_0,
      id_18,
      id_13,
      id_0,
      id_15,
      id_16,
      id_15,
      id_18,
      id_7,
      id_4,
      id_5,
      id_14,
      id_16,
      id_15,
      id_15,
      id_9,
      id_11,
      id_1
  );
  assign modCall_1.id_11 = 0;
endmodule
