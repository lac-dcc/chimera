// Seed: 2557308305
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input supply0 id_2,
    input wor id_3,
    input tri0 id_4,
    input wand id_5
);
  wire id_7;
  ;
  assign module_1._id_8 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd61,
    parameter id_11 = 32'd33,
    parameter id_12 = 32'd85,
    parameter id_14 = 32'd89,
    parameter id_8  = 32'd73
) (
    input wor id_0,
    input supply0 id_1,
    input tri0 id_2,
    output uwire id_3,
    input wor id_4,
    input uwire id_5,
    input wire id_6,
    output uwire id_7,
    output tri _id_8,
    input supply1 id_9,
    output tri _id_10,
    input tri0 _id_11,
    input tri _id_12,
    input supply0 id_13,
    output wor _id_14
);
  logic id_16[{  id_11  , "" ,  id_8  ,  id_10  ,  1  ,  id_14  ,  id_12  }  &&  -1 : &  id_12],
      id_17;
  id_18 :
  assert property (@(posedge 1) 1'h0)
  else if (-1) begin : LABEL_0
    id_16 <= -1'b0;
  end
  assign id_18 = id_16;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_1,
      id_4,
      id_1,
      id_9
  );
endmodule
