// Seed: 332136490
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
    id_17
);
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  initial id_3 <= 1 == id_8;
  initial id_15 = 1;
  supply1 id_18 = 1, id_19 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  uwire id_1,
    input  logic id_2
);
  assign id_0 = id_2 + 1;
  supply0 id_4;
  always begin : LABEL_0
    id_0 <= id_2;
  end
  reg id_5, id_6;
  always
    if (1) id_0 = 1;
    else begin : LABEL_0
      id_4 = 1'b0;
      @(posedge 1) id_0 <= id_6;
    end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_6,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_12 = 0;
endmodule
