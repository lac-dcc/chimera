// Seed: 2361621492
module module_0 #(
    parameter id_13 = 32'd74,
    parameter id_15 = 32'd86,
    parameter id_19 = 32'd94,
    parameter id_23 = 32'd47
) (
    input  supply0 id_0,
    output logic   id_1
);
  id_3 :
  assert property (@(posedge -1) -1)
  else begin : LABEL_0
    #1 begin : LABEL_1
      id_3 = id_3;
      id_1 <= id_3;
      id_1 <= id_3;
    end
  end
  wire id_4;
  assign module_1.id_2 = 0;
  assign id_3 = id_3;
  wire  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  _id_13  ,  id_14  ,  _id_15  ,  id_16  ,  id_17  ,  id_18  ,  _id_19  ,  id_20  ,  id_21  ,  id_22  ,  _id_23  ,  id_24  [  id_19  :  1  ]  ,  id_25  ;
  wire id_26;
  localparam id_27 = 1 ? 1 : -1;
  logic id_28;
  wire id_29[id_15 : 1];
  wire id_30;
  struct packed {
    logic [-1 : 1] id_31;
    logic [1  &&  id_13 : id_23] id_32;
  } id_33;
  ;
endmodule
macromodule module_1 (
    output wire id_0,
    input supply1 id_1,
    input wand id_2,
    output tri id_3,
    output logic id_4,
    output tri0 id_5,
    output tri0 id_6,
    output supply1 id_7
);
  wire id_9, id_10, id_11, id_12;
  initial begin : LABEL_0
    id_4 <= id_12;
  end
  module_0 modCall_1 (
      id_2,
      id_4
  );
endmodule
