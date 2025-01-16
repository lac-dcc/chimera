// Seed: 2334691828
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
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_9 = id_5;
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
    id_12
);
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  function id_13(output id_14);
    id_7 <= id_14;
  endfunction
  uwire id_15 = id_2 == id_8;
  always begin : LABEL_0
    id_14 <= id_13;
  end
  assign #id_16 id_3 = -1'b0;
  wire id_17, id_18, id_19, id_20;
  wire id_21, id_22;
  parameter id_23 = - -1'b0;
  wire id_24;
  module_0 modCall_1 (
      id_20,
      id_19,
      id_20,
      id_20,
      id_17,
      id_17,
      id_19,
      id_24
  );
  id_25 :
  assert property (@(posedge id_11 == id_15) 1) id_3 <= -1'b0;
  wire id_26;
  `define pp_27 0
  wire id_28;
  wire id_29;
endmodule
