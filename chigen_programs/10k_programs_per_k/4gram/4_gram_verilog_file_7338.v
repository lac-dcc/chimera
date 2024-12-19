// Seed: 1926994313
module module_0 (
    input tri id_0,
    input supply0 id_1,
    input tri1 id_2
);
  always @(posedge id_1) begin : LABEL_0
    if (~id_0) assign {id_2, id_0, 1'b0} = 1;
    else begin : LABEL_0
      id_4 = 1;
    end
  end
  wire module_0;
  wire  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    output logic id_2,
    input supply0 id_3,
    input supply1 id_4,
    input logic id_5,
    input logic id_6,
    output wire id_7,
    input logic id_8,
    input supply1 id_9,
    input wor id_10,
    input tri0 id_11,
    output uwire id_12
    , id_20,
    output wand id_13,
    output tri1 id_14,
    output supply0 id_15,
    output supply1 id_16,
    input wire id_17,
    output uwire id_18
);
  wire  id_21;
  uwire id_22;
  assign id_2  = id_1 ? id_8 : id_6;
  assign id_22 = id_11 ? id_9 : id_20;
  module_0 modCall_1 (
      id_20,
      id_10,
      id_20
  );
  assign id_2 = id_5;
  always @(negedge id_11)
    #1
      if (1) begin : LABEL_0$display
        ;
      end else begin : LABEL_0
        force id_18 = id_6;
      end
endmodule
