// Seed: 1285302714
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3, id_4;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2
  );
  output supply0 id_1;
  assign id_1 = id_2 == -1;
endmodule
module module_0 #(
    parameter id_7 = 32'd59
) (
    id_1,
    module_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  inout logic [7:0] id_17;
  inout wire id_16;
  module_0 modCall_1 (
      id_8,
      id_16
  );
  inout reg id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire _id_7;
  inout wire id_6;
  inout logic [7:0] id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always  @  (  id_17  ==  id_5  [  -1  ]  or  id_9  ,  id_17  [  -1 'h0 :  1  &  id_7  ]  ,  1  !==  1  -  -1  ,  id_12  or  1  <  id_13  or  id_5  [  id_7  ]  -  -1  or  posedge  1  or  posedge  id_9  or  posedge  id_6  )  begin :LABEL_0
    id_15 = (id_17);
  end
endmodule
