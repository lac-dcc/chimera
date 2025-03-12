// Seed: 1513731810
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  always @(posedge 1 or posedge 1)
    @(1 or posedge 1) begin : LABEL_0
      id_2[-1] <= -1;
    end
  wire id_8;
  ;
  logic [-1 : -1 'h0] id_9, id_10;
endmodule
module module_1 #(
    parameter id_1  = 32'd72,
    parameter id_16 = 32'd47
) (
    _id_1,
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
    _id_16,
    id_17,
    id_18
);
  inout logic [7:0] id_18;
  inout wire id_17;
  input wire _id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  output wand id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  and primCall (id_8, id_17, id_5, id_12, id_2, id_9, id_14, id_18, id_7, id_6, id_3);
  inout wire id_7;
  inout logic [7:0] id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire _id_1;
  assign id_6[id_1] = -1;
  assign  id_11  =  {  -1  ,  1  ,  id_18  [  id_16  ]  ,  id_3  ,  -1  ,  (  id_1  )  &&  -1 'b0 ,  (  id_12  )  -  id_16  ,  -1 'b0 ,  ~  id_18  ,  1  }  ?  id_8  :  1 'b0 -  1 'h0 ;
  module_0 modCall_1 (
      id_9,
      id_6,
      id_17,
      id_5,
      id_11,
      id_3,
      id_8
  );
endmodule
