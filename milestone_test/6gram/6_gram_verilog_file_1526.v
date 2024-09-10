// Seed: 3192809855
module module_0 #(
    parameter id_1  = 32'd68,
    parameter id_10 = 32'd40,
    parameter id_11 = 32'd22,
    parameter id_13 = 32'd11,
    parameter id_15 = 32'd10,
    parameter id_16 = 32'd5,
    parameter id_21 = 32'd1,
    parameter id_5  = 32'd61,
    parameter id_7  = 32'd30,
    parameter id_9  = 32'd78
) (
    input logic _id_1,
    output id_2,
    output id_3,
    input id_4,
    input logic _id_5,
    input id_6,
    input logic _id_7,
    input id_8,
    output _id_9,
    input logic _id_10,
    input logic _id_11,
    input logic id_12,
    output _id_13
);
  assign id_8 = 1;
  logic id_14;
  assign id_6[1'b0] = ~id_12;
  assign  {  id_14  ,  1  ,  !  id_1  ,  id_4  [  1 'b0 :  id_7  ]  ,  1 'b0 ,  1  ,  1  ,  id_8  ,  1  ,  1  ,  1  ,  id_2  ,  id_12  ,  id_10  ,  id_4  [  1  ]  ,  !  id_11  ,  id_6  [  id_7  ]  !=  {  id_7  [  id_11  -  id_13  ]  ,  id_11  &  1  }  }  =  id_14  ;
  type_44(
      1, id_12, id_3
  );
  type_0 _id_15 (
      .id_0(1),
      .id_1(1),
      .id_2(""),
      .id_3(1),
      .id_4(id_13)
  );
  logic _id_16;
  type_46(
      1, id_1, id_14
  );
  assign id_7 = id_6[1];
  logic id_17, id_18, id_19;
  assign id_11 = id_8;
  type_47(
      1 & id_6 & id_18, id_15, 1, id_17
  );
  assign id_12 = id_11;
  type_48(
      id_3[id_1] + "", 1, 1'b0
  );
  string id_20;
  always @(1) begin
    #1;
  end
  logic _id_21 = (id_1 * 1);
  assign id_8 = id_17[1] ? 1 : id_5[id_1],
      id_19 = 1,
      id_7 = id_5 & 1'h0 & id_17[id_5] & id_21 ? id_3[id_15[id_9[1 : 1]]] + (1) : 1,
      id_10[id_15] = 1'd0;
  assign id_7[id_21] = id_15;
  assign id_13 = id_7;
  logic id_22;
  assign id_15 = id_20 ? "" : id_13 ? id_20 : "";
  type_51(
      1, 1, id_16
  );
  logic id_23 = 1;
  assign id_4[1] = id_9;
  reg id_24;
  type_54(
      "", id_14, 1'b0
  );
  real id_25 (
      .id_0(id_18),
      .id_1(1),
      .id_2(id_20)
  );
  logic id_26, id_27, id_28, id_29, id_30, id_31, id_32, id_33, id_34, id_35;
  logic id_36 = !id_32[id_16 : id_13[id_10]];
  always @(negedge 1'b0) begin
    id_24 <= 1;
  end
  assign id_13 = 1 & id_33 * 1 * 1 - id_14;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output id_4;
  output id_3;
  output id_2;
  input id_1;
  defparam id_5.id_6 = 1 & SystemTFIdentifier(
      id_6, SystemTFIdentifier
  );
  always @(posedge id_6 or posedge id_1) begin
    id_4 <= 1;
  end
  logic id_7;
  initial begin
    id_2 = 1;
    id_5 = 1 == (1);
  end
endmodule
