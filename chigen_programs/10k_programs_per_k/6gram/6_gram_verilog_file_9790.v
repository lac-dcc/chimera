// Seed: 1290204938
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout tri1 id_6;
  inout logic [7:0] id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  task automatic id_7;
    begin : LABEL_0
      $clog2(3);
      ;
    end
  endtask
  logic id_8;
  assign id_6 = -1;
  wire id_9;
  logic ["" : -1 'b0] id_10;
  assign id_8 = id_2 ^ id_6;
  integer id_11, id_12, id_13 = 1;
  wire id_14;
  assign id_8 = id_4;
  assign id_5[1<-1] = -1;
  logic id_15;
endmodule
module module_0 #(
    parameter id_10 = 32'd89
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11
);
  output wire id_11;
  input wire _id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_11,
      id_8,
      id_5,
      id_5,
      id_2,
      id_5
  );
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  reg id_12;
  ;
  assign id_12 = id_2[id_10];
  always
  fork : SymbolIdentifier
    id_13(id_8 < id_5);
    begin : LABEL_0
      id_12 = id_10;
      logic id_14, id_15;
      id_14 <= -1;
      id_13 = module_1;
      id_15 <= id_2;
    end
    #1 $unsigned(76);
    ;
  join : SymbolIdentifier
endmodule
