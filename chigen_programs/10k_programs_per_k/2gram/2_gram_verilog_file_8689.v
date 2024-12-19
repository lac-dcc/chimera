// Seed: 3520189328
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
    id_13
);
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_14;
  wire id_15;
  wire id_16;
  id_17 :
  assert property (@(posedge 1 or 1) id_14)
  else;
  wire id_18;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_1,
      id_3,
      id_2,
      id_1,
      id_1,
      id_3,
      id_1,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_17 = 0;
  function id_4;
    output id_5;
    output id_6;
    disable id_7;
  endfunction
  wire id_8;
endmodule
