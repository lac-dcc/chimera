// Seed: 3860584146
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
  output logic [7:0] id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4[1] = id_2;
  assign module_1.id_15 = 0;
endmodule
module module_1 #(
    parameter id_0  = 32'd84,
    parameter id_29 = 32'd37,
    parameter id_4  = 32'd98
) (
    input tri0 _id_0,
    output tri1 id_1,
    output tri0 id_2,
    input tri id_3,
    input tri _id_4,
    logic id_6
);
  logic [id_0 : -1] id_7;
  ;
  wire id_8;
  wire id_9;
  ;
  logic [7:0] id_10;
  logic [1 : id_4] id_11;
  ;
  logic id_12;
  ;
  tri0  [  1 'b0 +  id_4  :  -1  ]  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  _id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ;
  assign id_6 = 1;
  wire id_34;
  module_0 modCall_1 (
      id_6,
      id_27,
      id_34,
      id_10,
      id_14,
      id_23,
      id_26
  );
  assign id_30 = id_31 - id_8;
  always @(posedge -1)
    if (-1) begin : LABEL_0
      id_10[id_0 : id_29+-1] <= id_11;
      $unsigned(39);
      ;
    end else begin : LABEL_1
      cover (-1);
    end
endmodule
