// Seed: 732016869
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  inout wire id_23;
  inout wire id_22;
  output wire id_21;
  inout wire id_20;
  input wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_23 = 1;
  wire id_24;
  wire id_25;
  wire id_26;
  assign id_13 = 1;
  wire id_27;
  id_28(
      .id_0(1 - id_16), .id_1(!id_12), .id_2(1), .id_3(id_7), .id_4(id_13)
  );
  wire id_29;
  assign id_16 = id_16 & 1;
  wire id_30;
  wire id_31;
  function id_32(input id_33);
    id_34(id_8);
    id_20 = id_1;
  endfunction
  wire id_35;
  wire id_36;
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
    id_15
);
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge id_9) begin
    id_4 <= id_5 - 1;
  end
  module_0(
      id_1,
      id_2,
      id_13,
      id_14,
      id_2,
      id_2,
      id_7,
      id_5,
      id_11,
      id_13,
      id_14,
      id_7,
      id_7,
      id_13,
      id_2,
      id_7,
      id_1,
      id_13,
      id_9,
      id_7,
      id_11,
      id_2,
      id_11
  );
endmodule
