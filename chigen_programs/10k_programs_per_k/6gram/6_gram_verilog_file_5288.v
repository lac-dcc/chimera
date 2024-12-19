// Seed: 169353985
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  reg
      id_5,
      id_6,
      id_7,
      id_8,
      id_9,
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
      id_22,
      id_23;
  always @(id_18) begin : LABEL_0
    if (1)
      if (id_21 && 1'b0) $display;
      else id_10 <= id_13;
    else id_18 = 1;
  end
  reg  id_24;
  wire id_25;
  wire id_26;
  assign id_24 = id_11;
endmodule
module module_1 (
    output supply1 id_0,
    output wire id_1
);
  wire  id_3  ,  id_4  ,  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ;
  module_0 modCall_1 (
      id_21,
      id_9,
      id_3,
      id_19
  );
  assign modCall_1.id_15 = 0;
  assign id_0 = 1;
endmodule
