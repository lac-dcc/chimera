// Seed: 4201006176
module module_0 #(
    parameter id_0 = 32'd32
) (
    output supply1 _id_0,
    input supply1 id_1,
    input wor id_2,
    input uwire id_3,
    input supply0 id_4
);
  logic [id_0 : -1 'b0] id_6;
  ;
  id_7 :
  assert property (@(posedge 1) id_6)
  else $signed(5);
  ;
  parameter id_8 = 1;
  id_9 :
  assert property (@(negedge 1) id_8)
  else $unsigned(3);
  ;
endmodule
module module_1 #(
    parameter id_12 = 32'd98,
    parameter id_18 = 32'd84
) (
    output wand id_0,
    input tri0 id_1,
    input tri1 id_2,
    input wire id_3,
    input supply0 id_4,
    input tri0 id_5,
    input supply0 id_6,
    output logic id_7,
    input supply1 id_8,
    input tri0 id_9,
    output logic id_10,
    output wand id_11,
    input wire _id_12
);
  wire [-1 : -1] id_14;
  wire id_15;
  parameter id_16 = 1'b0;
  logic [7:0] id_17;
  ;
  parameter id_18 = id_16;
  always_latch @(1) begin : LABEL_0
    id_10 = -1;
    id_7  = id_1;
  end
  wire id_19;
  assign id_17[id_18] = -1;
  module_0 modCall_1 (
      id_18,
      id_2,
      id_6,
      id_2,
      id_2
  );
  assign modCall_1.id_4 = 0;
  logic id_20;
  logic id_21;
  always @* begin : LABEL_1
    id_19 += (id_19);
  end
  assign id_20[id_12] = 1;
  assign id_10 = -1;
endmodule
