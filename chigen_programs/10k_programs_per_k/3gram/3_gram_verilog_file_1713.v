// Seed: 3809740960
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  timeunit 1ps;
  wire id_15;
endmodule
module module_1 (
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
    id_17
);
  input wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_2,
      id_3,
      id_4,
      id_8,
      id_10,
      id_2,
      id_7,
      id_7,
      id_9,
      id_3,
      id_1
  );
  input wire id_6;
  inout reg id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  final begin : LABEL_0
    id_5 <= {1'h0{id_10 | 1}};
    #1 begin : LABEL_1
      $unsigned(28);
      ;
    end
  end
endmodule
