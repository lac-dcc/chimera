// Seed: 2345137085
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_6;
  reg  id_7;
  wire id_8;
  function id_9;
    input id_10, id_11;
    input id_12;
    begin : LABEL_0
      id_7 <= id_2[1];
    end
  endfunction
  wire id_13;
  assign id_3 = 1;
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
    id_14
);
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_12 = $display;
  wire id_15;
  always @(posedge 1'b0 & id_11 or id_4) id_12 = id_11;
  wire id_16, id_17;
  wire id_18;
  xor primCall (
      id_6,
      id_4,
      id_19,
      id_10,
      id_11,
      id_3,
      id_12,
      id_1,
      id_8,
      id_2,
      id_5,
      id_15,
      id_16,
      id_17,
      id_9,
      id_20,
      id_18
  );
  wire id_19;
  assign id_3 = 1'b0;
  id_20(
      .id_0(1), .id_1(id_10), .id_2(id_9), .id_3(1)
  );
  module_0 modCall_1 (
      id_16,
      id_2,
      id_6,
      id_14,
      id_6
  );
  wire id_21, id_22;
  assign id_3 = 1'b0;
endmodule
