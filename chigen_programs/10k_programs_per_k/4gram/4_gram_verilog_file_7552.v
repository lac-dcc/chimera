// Seed: 1864128622
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    output tri0 id_2,
    input tri1 id_3,
    output wor id_4,
    output wand id_5,
    output tri1 id_6
);
  wire id_8;
  ;
endmodule
module module_1 (
    output supply0 id_0,
    input wire id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0
  );
endmodule
module module_2 #(
    parameter id_2  = 32'd38,
    parameter id_25 = 32'd71
) (
    output logic id_0,
    output logic id_1,
    input tri0 _id_2,
    input tri0 id_3,
    output wor id_4,
    input supply1 id_5,
    input supply1 id_6,
    inout uwire id_7,
    output tri0 id_8,
    input tri0 id_9,
    output logic id_10,
    input supply1 id_11,
    input tri0 id_12,
    output wand id_13,
    input wand id_14,
    input uwire id_15,
    input wand id_16,
    input supply0 id_17,
    input tri1 id_18
);
  bit id_20, id_21, id_22, id_23, id_24, _id_25, id_26, id_27, id_28, id_29, id_30, id_31;
  wire id_32;
  wire id_33;
  assign id_20 = id_16;
  always @(posedge "" or posedge -1'h0) begin : LABEL_0
    id_1 <= 1'b0;
    if (1) begin : LABEL_1
      id_10 = id_2;
      if (1) $signed(11);
      ;
    end else begin : LABEL_2
      if (1) id_21 <= -1;
      else id_0 = -1;
    end
  end
  wire [-1  +  -1  +  id_25 : id_2] id_34;
  assign id_23 = id_21;
  module_0 modCall_1 (
      id_6,
      id_3,
      id_8,
      id_6,
      id_7,
      id_7,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule
