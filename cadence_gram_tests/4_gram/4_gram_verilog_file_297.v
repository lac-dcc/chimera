// Seed: 1344038816
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
    id_21
);
  input wire id_21;
  inout wire id_20;
  output wire id_19;
  inout wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_22;
  wire id_23;
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
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  function void id_15;
    input id_16;
    input id_17;
    begin : LABEL_0
      id_16 <= id_6;
    end
  endfunction
  id_18(
      .id_0(id_3), .id_1(-1)
  );
  wire id_19;
  module_0 modCall_1 (
      id_19,
      id_11,
      id_11,
      id_11,
      id_10,
      id_3,
      id_12,
      id_19,
      id_13,
      id_19,
      id_19,
      id_10,
      id_7,
      id_11,
      id_10,
      id_12,
      id_1,
      id_12,
      id_14,
      id_7,
      id_3
  );
  id_20 :
  cover property (1 |-> -1);
  wire id_21, id_22, id_23;
  wire id_24;
  initial begin
    id_15(id_6, id_4);
  end
endmodule
