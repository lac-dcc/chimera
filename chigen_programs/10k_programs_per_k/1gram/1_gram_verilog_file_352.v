// Seed: 1340386662
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
    id_12#(.id_13(1))
);
  output wire id_12;
  output uwire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout supply0 id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_14;
  ;
  logic [7:0] id_15;
  assign id_11 = id_13 !== 1;
  assign id_15[-1] = {id_10{1'h0}} && id_7;
  assign id_6 = id_15;
  assign id_5 = 1;
  wire id_16, id_17, id_18, id_19;
  assign id_14 = 1'h0;
endmodule
module module_1 (
    output tri0 id_0
);
  assign id_0 = -1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_14 = 0;
  localparam [-1 : -1] id_3 = 1;
endmodule
