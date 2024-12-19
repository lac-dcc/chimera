// Seed: 3698712450
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
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
    id_16
);
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24 = id_12;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3;
  supply1  id_4  ,  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ;
  assign id_6 = 1;
  tri  id_26 = 1'b0 - 1;
  wire id_27;
  or primCall (
      id_1, id_3, id_18, id_27, id_23, id_11, id_5, id_13, id_8, id_19, id_17, id_14, id_24, id_26
  );
  module_0 modCall_1 (
      id_21,
      id_12,
      id_26,
      id_12,
      id_27,
      id_2,
      id_17,
      id_15,
      id_11,
      id_7,
      id_18,
      id_10,
      id_18,
      id_20,
      id_20,
      id_25
  );
  always @(posedge 1'd0) begin : LABEL_0
    id_4 = id_26;
  end
endmodule
