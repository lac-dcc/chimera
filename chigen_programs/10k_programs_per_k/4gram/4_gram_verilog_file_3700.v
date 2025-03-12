// Seed: 835471626
module module_0 #(
    parameter id_6 = 32'd35
) (
    input  tri  id_0,
    output wire id_1
);
  assign id_1 = id_0;
  bit id_3;
  ;
  for (id_4 = id_0; id_4; id_3 = id_3) begin : LABEL_0
    assign id_4 = {1, -1};
  end
  wire id_5;
  assign module_1.id_15   = 0;
  assign {id_5 - id_3, 1} = 1 ? "" : id_5 ? -1'h0 : -1;
  wire _id_6;
  wire id_7;
  struct packed {
    logic [id_6  *  1  -  -1 : -1] id_8;
    logic [-1 : 1] id_9;
  } id_10;
  ;
  parameter id_11 = $unsigned(18);
  ;
endmodule
module module_1 #(
    parameter id_13 = 32'd65,
    parameter id_22 = 32'd39,
    parameter id_28 = 32'd33,
    parameter id_3  = 32'd48
) (
    output supply0 id_0,
    input uwire id_1,
    input supply1 id_2,
    input wire _id_3,
    input supply0 id_4,
    input tri0 id_5,
    output tri1 id_6,
    input wand id_7,
    output tri id_8,
    input supply0 id_9,
    input tri id_10,
    output tri0 id_11,
    input supply0 id_12,
    input wire _id_13,
    input uwire id_14,
    input uwire id_15,
    output wire id_16,
    input tri1 id_17,
    output tri id_18,
    output supply1 id_19
    , id_30,
    input tri0 id_20,
    output wire id_21,
    input tri0 _id_22,
    input wire id_23,
    output logic id_24,
    input wor id_25,
    output supply1 id_26,
    output logic id_27,
    input tri0 _id_28
);
  parameter id_31 = 1;
  always @* begin : LABEL_0
    if (1) begin : LABEL_1
      id_24 <= -1;
    end else begin : LABEL_2
      id_27 <= -1;
    end
  end
  always force id_18 = id_20;
  id_32 :
  assert property (@(posedge 1) id_5)
  else $unsigned(99);
  ;
  module_0 modCall_1 (
      id_15,
      id_21
  );
  logic [7:0][id_22 : id_13] id_33;
  assign id_24 = "" ? id_2 : 1;
  wire [1 : id_28] id_34;
  assign id_33[id_3] = -1'h0 & id_14 & id_15#(
      .id_32(1'b0),
      .id_33(-1),
      .id_28(-1)
  );
  wire id_35;
  assign #id_36 id_16 = id_12;
endmodule
