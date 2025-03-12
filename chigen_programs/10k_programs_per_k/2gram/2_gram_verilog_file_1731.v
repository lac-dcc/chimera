// Seed: 3381265716
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_19 = 32'd4,
    parameter id_21 = 32'd75,
    parameter id_22 = 32'd79,
    parameter id_22 = 32'd41,
    parameter id_23 = 32'd12,
    parameter id_6  = 32'd38
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  output wire id_18;
  output wire id_17;
  output wire id_16;
  output supply1 id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire _id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  localparam  [  -1  &&  -1  ?  id_6  :  -1  :  -1 'b0 ]  id_19  =  -1  ,  id_20  =  id_6  ,  id_21  =  1 'b0 ,  id_22  =  id_12  ,  id_23  =  1  ;
  assign id_16 = id_4;
  if (^id_19) wire id_24;
  else begin : LABEL_0
    defparam id_22.id_21 = id_23;
  end
  parameter id_25 = id_22;
  wire [-1 : (  1  ==  id_22  )  ^  ~  id_19] id_26;
  assign id_15 = 1;
  wire [(  id_23  ) : -1] id_27;
  assign id_24 = id_22;
  module_0 modCall_1 (
      id_15,
      id_24,
      id_26,
      id_9
  );
endmodule
