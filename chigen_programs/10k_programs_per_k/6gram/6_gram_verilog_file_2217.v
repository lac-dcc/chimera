// Seed: 1537391552
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  assign module_1.type_42 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input wor id_2,
    output supply1 id_3,
    input uwire id_4,
    input wire id_5,
    output supply0 id_6,
    output wire id_7,
    input supply1 id_8,
    output supply1 id_9,
    input supply0 id_10,
    input supply0 id_11,
    output uwire id_12,
    output tri id_13,
    output tri1 id_14,
    input tri id_15,
    output supply0 id_16
);
  wire id_18;
  wire  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ;
  nor primCall (
      id_9,
      id_25,
      id_26,
      id_27,
      id_8,
      id_35,
      id_19,
      id_21,
      id_2,
      id_11,
      id_4,
      id_31,
      id_32,
      id_10,
      id_34,
      id_28,
      id_1,
      id_15,
      id_24,
      id_29,
      id_23
  );
  module_0 modCall_1 (
      id_34,
      id_28,
      id_20
  );
  always @(negedge 1'h0) begin : LABEL_0
    deassign id_27;
  end
endmodule
