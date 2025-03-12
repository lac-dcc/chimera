// Seed: 2457978782
module module_0 (
    output tri0 id_0,
    input supply0 id_1
);
  wire id_3[-1 : -1];
endmodule
module module_1 #(
    parameter id_4 = 32'd3,
    parameter id_7 = 32'd0
) (
    output logic id_0,
    input uwire id_1,
    input uwire id_2,
    output wand id_3,
    input wire _id_4,
    input supply1 id_5,
    input supply1 id_6,
    inout supply1 _id_7,
    input wand id_8,
    output logic id_9,
    output logic id_10
);
  logic [7:0][-1 : (  -1 'b0 ?  {  1 'b0 } : id_4  )] id_12[id_7 : -1  -  -1  &  -1], id_13;
  always id_0 = 1;
  localparam id_14 = 1;
  logic id_15;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_6
  );
  logic id_16;
  id_17 :
  assert property (@(posedge (id_1#(
      .id_13(id_14),
      .id_16(id_14),
      .id_7 (-1),
      .id_1 (id_14),
      .id_16(id_14),
      .id_16(1),
      .id_16(id_14)
  ))) ~id_15)
  else begin : LABEL_0
    id_10 <= id_13[1];
  end
  always_latch begin : LABEL_1
    id_9 <= (1);
  end
  logic id_18, id_19;
endmodule
