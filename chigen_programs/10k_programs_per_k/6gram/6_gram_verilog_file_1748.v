// Seed: 2318878708
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  task id_11(input id_12, input id_13);
    id_9 = 1;
  endtask
  wire  id_14;
  wire  id_15;
  uwire id_16;
  wire  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ;
  wire id_32;
  wire id_33;
  assign id_16 = 1'b0;
  assign id_17 = id_12;
  uwire id_34 = 1;
  always
  fork : SymbolIdentifier
    logic [7:0] id_35, id_36, id_37, id_38;
    #1;
    #1 id_30 = id_35[1|1 : 1];
  join
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2
  );
  assign id_1 = 1;
  wire id_4;
  always id_3 <= #id_4 1'b0;
  always @(posedge 1) #1;
endmodule
