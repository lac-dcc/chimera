// Seed: 2041205413
macromodule module_0;
  id_1(
      .id_0(1)
  );
endmodule
module module_1 ();
  wire id_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
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
    id_16,
    id_17,
    id_18
);
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  function reg id_19;
    input id_20;
    output id_21, id_22;
    begin : LABEL_0
      id_5 <= id_19;
      id_6  = 1;
      id_14 = id_6;
      $display(id_20);
      id_6 <= id_14;
      id_2 <= 1'b0;
    end
  endfunction
  wire id_23;
  assign #(1, 1) id_22 = 1;
  module_0 modCall_1 ();
  supply1  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  =  1  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  =  1  ,  id_38  ;
endmodule
