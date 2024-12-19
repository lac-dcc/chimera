// Seed: 3829435659
module module_0;
  assign module_3.id_27 = 0;
endmodule
module module_1 (
    output logic id_0
);
  always #1 begin : LABEL_0
    id_0 <= id_2[1];
    id_0 <= id_2[1'b0];
  end
  module_0 modCall_1 ();
  wire id_3;
endmodule
module module_2 (
    input  tri1 id_0,
    input  tri0 id_1,
    output wire id_2
);
  wire id_4, id_5, id_6, id_7, id_8, id_9;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
macromodule module_3 #(
    parameter id_23 = 32'd33,
    parameter id_24 = 32'd13
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5#(
        .id_6(1),
        .id_7(id_8),
        .id_9(1)
    ),
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  defparam id_23.id_24 = id_19[1]; id_25 :
  assert property (@(negedge id_11) id_8)
  else;
  wor id_26 = 1'b0;
  id_27 :
  assert property (@(1 ? id_21 : 1 or posedge id_14) 1 && id_9)
  else;
  always begin : LABEL_0
    id_4 <= id_4;
  end
  module_0 modCall_1 ();
  wire id_28;
  wor  id_29 = 1;
endmodule
