// Seed: 2795423839
module module_0 #(
    parameter id_15 = 32'd21,
    parameter id_16 = 32'd37
);
  reg id_2;
  generate
    reg id_3;
  endgenerate
  reg id_4 = id_3, id_5;
  reg id_6;
  assign id_5 = id_3;
  uwire id_7 = 1'd0;
  id_8 :
  assert property (@(posedge 1 ? 1 : id_2) id_6)
  else id_2 = id_4 + 1;
  wire id_9;
  wire id_10;
  wire id_11 = 1;
  wire id_12;
  wire id_13;
  always @(posedge {id_8{1}}) begin : LABEL_0
    id_3 <= id_4;
  end
  reg id_14;
  if (1) begin : LABEL_0
    defparam id_15.id_16 = 1;
  end
  id_17(
      id_4, 1, 1, id_8, id_14, 1'b0
  );
  wire id_18, id_19, id_20, id_21, id_22, id_23, id_24, id_25;
  assign id_14 = 1'b0;
  wire id_26, id_27, id_28;
endmodule
program module_1 (
    input supply1 id_0,
    output wand id_1,
    input tri1 id_2,
    input uwire id_3,
    output supply1 id_4,
    input wire id_5,
    output supply0 id_6
);
  always @(id_2 or posedge !id_3) id_6 = 1;
  module_0 modCall_1 ();
  wire id_8;
endprogram
