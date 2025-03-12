// Seed: 1041919257
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    output tri id_3,
    input tri id_4,
    input wor id_5,
    input supply1 id_6,
    output tri id_7,
    output wire id_8,
    output wand id_9,
    output uwire id_10,
    input supply0 id_11,
    input uwire id_12,
    input wire id_13,
    output tri id_14,
    input uwire id_15,
    input wire id_16,
    output logic id_17,
    input wand id_18,
    output wor id_19,
    output tri id_20
);
  logic [7:0] id_22;
  wire id_23;
  id_24 :
  assert property (@(posedge id_23 - -1 * id_13#(1) == id_22[1]) 1 * 1'b0)
  else $clog2(30);
  ;
  initial id_17 = id_12;
  assign id_10 = 1;
endmodule
module module_1 #(
    parameter id_11 = 32'd35,
    parameter id_4  = 32'd8
) (
    input wire id_0,
    output logic id_1,
    output wand id_2,
    output logic id_3,
    input wor _id_4,
    input wand id_5,
    input tri id_6,
    input supply1 id_7,
    input uwire id_8,
    input tri1 id_9,
    input supply1 id_10,
    input wand _id_11,
    input wor id_12
    , id_17,
    input tri0 id_13,
    input tri0 id_14,
    output wor id_15
);
  wire [-1 : -1] id_18;
  assign id_2 = id_17;
  if (1'd0) begin : LABEL_0
    always @(*) begin : LABEL_1
      if (1) id_1 <= id_12;
      else if (-1) id_3 = id_7 * -1;
    end
  end
  module_0 modCall_1 (
      id_6,
      id_10,
      id_10,
      id_2,
      id_5,
      id_7,
      id_12,
      id_15,
      id_15,
      id_15,
      id_2,
      id_8,
      id_6,
      id_10,
      id_2,
      id_12,
      id_0,
      id_1,
      id_8,
      id_15,
      id_2
  );
  assign modCall_1.id_5 = 0;
  wire id_19;
  assign id_3 = id_8;
  wire id_20;
  logic [id_4 : -  id_11] id_21 = id_18;
endmodule
