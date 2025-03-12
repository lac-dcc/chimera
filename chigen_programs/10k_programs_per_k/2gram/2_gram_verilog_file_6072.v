// Seed: 4033981408
module module_0 #(
    parameter id_13 = 32'd2
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  parameter id_4 = 1;
  wand id_5;
  ;
  wire  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  _id_13  ,  id_14  ,  id_15  ,  \id_16  [  1  :  id_13  ]  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ;
  wire id_24, id_25;
  logic id_26;
  ;
  assign id_5 = -1;
endmodule
module module_1 (
    id_1
);
  input wire id_1;
  wire id_2 = id_1;
  always_ff begin : LABEL_0
    wait (1 ^ (id_1));
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1
  );
endmodule
