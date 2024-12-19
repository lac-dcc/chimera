// Seed: 3407206284
module module_0 #(
    parameter id_4 = 32'd7,
    parameter id_5 = 32'd55
);
  wire id_2;
  always @(posedge 1 or negedge 1) @(posedge 1);
  assign id_1 = id_2;
  wire id_3 = ~1;
  if (id_3) begin : LABEL_0
    defparam id_4.id_5 = 1;
  end else begin : LABEL_0
    assign id_1 = id_2;
  end
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = 1'd0;
  id_11 :
  assert property (@(posedge id_8) 1)
  else begin : LABEL_0
    id_8 <= 1;
    for (id_10 = id_9; id_4; id_3 = 1) id_1 = #id_12 1;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_5 = 0;
endmodule
