// Seed: 4241057859
module module_0 #(
    parameter id_13 = 32'd52,
    parameter id_20 = 32'd31,
    parameter id_8  = 32'd87
) (
    output supply1 id_0,
    output logic id_1,
    output wire id_2,
    input tri1 id_3[1 : 1],
    input supply1 id_4,
    input tri0 id_5,
    input wand id_6,
    output logic id_7,
    input supply0 _id_8[1  -  -1 : id_8],
    input tri0 id_9,
    input wor id_10,
    input tri id_11,
    input uwire id_12,
    input wand _id_13,
    input tri id_14,
    input supply0 id_15,
    output tri1 id_16
    , _id_20,
    input uwire id_17,
    input tri1 id_18
);
  always begin : LABEL_0
    @(*) begin : LABEL_1
      if (1) id_7 = -1;
      else id_1 <= -1;
    end
  end
  always $unsigned(58);
  ;
  assign id_1 = 1;
  wire id_21;
  wire id_22;
  wire id_23, id_24;
  wire id_25, id_26, id_27[id_13 : id_20];
  parameter id_28 = -1 ? 1'h0 : -1;
  logic id_29;
endmodule
module module_1 #(
    parameter id_21 = 32'd89,
    parameter id_22 = 32'd56,
    parameter id_5  = 32'd47,
    parameter id_8  = 32'd95
) (
    output uwire id_0,
    output logic id_1,
    output supply0 id_2,
    output uwire id_3,
    input wor id_4
    , id_15,
    input wire _id_5,
    output supply1 id_6,
    output tri0 id_7,
    input wire _id_8,
    input uwire id_9,
    input uwire id_10,
    input wor id_11,
    input tri0 id_12,
    input wire id_13
);
  always_ff id_1 <= 1;
  wor id_16, id_17, id_18;
  if (1) assign id_7.id_16 = id_18;
  else logic id_19;
  ;
  wand id_20, _id_21;
  assign id_21 = id_18;
  logic [id_8 : (  id_5  )] _id_22, id_23;
  logic [7:0][""][~  id_5 : id_22][id_21] id_24;
  always id_19 <= -1'b0;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_6,
      id_9,
      id_9,
      id_18,
      id_4,
      id_1,
      id_21,
      id_17,
      id_12,
      id_12,
      id_9,
      id_21,
      id_10,
      id_18,
      id_17,
      id_10,
      id_12
  );
  assign modCall_1.id_13 = 0;
  wire id_25;
  wire id_26, id_27, id_28, id_29, id_30;
  logic id_31;
  ;
  always begin : LABEL_0
    `define pp_32 0
  end
  assign id_20 = 1;
endmodule
