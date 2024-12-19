// Seed: 746377366
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_9;
  wire id_10;
  assign id_8 = 1;
  wire id_11;
  wire id_12;
  wire id_13;
  wire id_14;
  wire id_15;
  tri0 id_16;
  wire id_17;
  wire id_18;
  wire id_19;
  wire id_20;
  assign id_16 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  tri0 id_9;
  wire id_10;
  always @(posedge 1)
    @(id_10 or posedge 1 == id_6)
      @(1) begin : LABEL_0
        id_10 = id_3;
      end
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_9,
      id_9,
      id_6,
      id_10,
      id_10
  );
  assign id_9 = {id_10 - 1, ~1};
  supply0 id_11 = id_6 ==? 1;
  wire id_12;
endmodule
