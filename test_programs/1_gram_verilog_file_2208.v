// Seed: 1981839290
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  localparam id_4 = -1'd0;
  assign id_3 = -1;
  always id_3 = id_2;
endmodule
macromodule module_1;
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
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
    id_18,
    id_19,
    id_20,
    id_21#(.id_22(1)),
    id_23
);
  input wire id_22;
  input wire id_21;
  input wire id_20;
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_5 = $realtime;
  function integer id_24;
    input id_25;
    if (-1) id_9 <= id_17;
  endfunction
  module_0 modCall_1 (
      id_21,
      id_10,
      id_3
  );
endmodule
