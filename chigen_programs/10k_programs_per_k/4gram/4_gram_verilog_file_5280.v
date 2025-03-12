// Seed: 2318416733
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    module_0,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  output wire id_16;
  input wire id_15;
  inout supply1 id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_17;
  ;
  assign id_14 = 1;
  assign id_12 = id_8 ? id_10 : id_14;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output logic [7:0] id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_8;
  ;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_2,
      id_2,
      id_2,
      id_6,
      id_6,
      id_8,
      id_6,
      id_1,
      id_8,
      id_6,
      id_8,
      id_3,
      id_3
  );
  logic id_9;
  ;
  assign id_7[-1] = -1;
  generate
    initial begin : LABEL_0
      disable id_10;
    end
  endgenerate
endmodule
