// Seed: 2920415844
module module_0 #(
    parameter id_2 = 32'd26
) (
    id_1,
    _id_2,
    id_3,
    id_4
);
  inout logic [7:0] id_4;
  input wire id_3;
  output wire _id_2;
  input wire id_1;
  assign module_1.id_2 = 0;
  wire id_5;
  ;
endmodule
module module_1 #(
    parameter id_9 = 32'd21
) (
    input supply0 id_0,
    input tri0 id_1,
    input tri0 id_2
    , _id_9,
    input tri1 id_3,
    output supply1 id_4,
    input tri0 id_5,
    input supply1 id_6,
    input tri0 id_7
);
  logic id_10;
  logic id_11;
  logic [7:0] id_12;
  logic id_13;
  assign id_12[(id_9)] = id_2;
  assign id_9 = id_5;
  module_0 modCall_1 (
      id_11,
      id_9,
      id_13,
      id_12
  );
  assign (strong1, highz0) id_10 = 1;
endmodule
