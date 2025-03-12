// Seed: 1009452909
module module_0 #(
    parameter id_1  = 32'd57,
    parameter id_11 = 32'd81,
    parameter id_5  = 32'd93
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  output wire _id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire _id_1;
  logic [id_5  +  id_1 : 1] id_8, id_9;
  assign module_1._id_1 = 0;
  wire id_10;
  always @(posedge 1) begin : LABEL_0
    $signed(22);
    ;
  end
  wire [1  ==  {  1 'b0 {  1  }  } : -1 'b0] _id_11, id_12, id_13;
  assign id_9[id_11] = 1;
endmodule
module module_1 #(
    parameter id_1  = 32'd96,
    parameter id_18 = 32'd23,
    parameter id_2  = 32'd18,
    parameter id_26 = 32'd45,
    parameter id_3  = 32'd46,
    parameter id_4  = 32'd51,
    parameter id_7  = 32'd21
) (
    output uwire id_0,
    input tri0 _id_1,
    input supply1 _id_2,
    input wand _id_3,
    inout tri _id_4
);
  logic id_6;
  parameter id_7 = 1'd0;
  logic [7:0][1 'b0 : ""] id_8;
  reg [!  id_3 : 1 'b0] id_9;
  assign id_8[1] = (1);
  wire  [  id_2  :  id_7  ]  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  _id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ;
  wire _id_26;
  wire [id_18  #  (
      .  id_7(  1  ),
      .  id_4(  id_7  )
) : id_1] id_27;
  wire id_28;
  wire id_29;
  always @(1'b0 or posedge "") id_9 <= id_1;
  tri0 id_30 = 1;
  wire id_31;
  wire [id_3 : id_26] id_32;
  module_0 modCall_1 (
      id_7,
      id_11,
      id_32,
      id_32,
      id_7,
      id_20,
      id_23
  );
  always @(posedge 1 ^ id_1) begin : LABEL_0
    if (id_7 !== 1'b0) assume (-1 == 1);
  end
endmodule
