// Seed: 1974390935
module module_0 (
    input supply1 id_0,
    input wor id_1,
    input supply1 id_2,
    output tri0 id_3,
    input tri id_4,
    input tri1 id_5,
    input tri1 id_6,
    input tri id_7,
    input uwire id_8,
    output supply1 id_9,
    input tri id_10,
    input wor id_11,
    output tri id_12,
    output uwire id_13
);
  logic id_15;
  assign module_1.id_16 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd50,
    parameter id_4 = 32'd25
) (
    input  tri0 _id_0,
    output wire id_1,
    output wand id_2,
    input  wand id_3,
    input  tri0 _id_4
);
  logic id_6;
  ;
  logic id_7;
  assign id_7 = 1;
  tri0  [  id_0  :  id_4  ]  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ;
  assign id_19 = id_0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_1
  );
  always @(posedge 1'd0 or posedge -1) begin : LABEL_0
    disable id_25;
  end
  wire id_26;
  wire id_27;
  assign id_18 = 1;
  wire id_28 = id_18;
  assign id_23 = 1 != id_0;
  wire [id_0 : -1] id_29, id_30, id_31;
endmodule
