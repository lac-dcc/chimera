// Seed: 2158892808
module module_0 (
    input tri id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri id_3,
    output supply0 id_4,
    input uwire id_5,
    output tri id_6
    , id_11,
    output tri1 id_7,
    input wor id_8
    , id_12,
    output tri id_9
);
  timeunit 1ps;
  wire id_13;
endmodule
module module_1 (
    output logic id_0,
    input uwire id_1
    , id_25,
    input wire id_2,
    input wor id_3,
    input supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    input uwire id_7,
    input wor id_8,
    output tri id_9
    , id_26,
    input wor id_10,
    input uwire id_11,
    input uwire id_12,
    output uwire id_13,
    input wand id_14,
    input supply0 id_15,
    input tri id_16,
    input supply1 id_17,
    input supply0 id_18,
    input supply1 id_19,
    input tri id_20,
    input wor id_21,
    input logic id_22,
    output tri1 id_23
);
  always @* release id_25;
  wire id_27, id_28;
  module_0 modCall_1 (
      id_8,
      id_20,
      id_16,
      id_1,
      id_9,
      id_21,
      id_13,
      id_23,
      id_5,
      id_9
  );
  assign modCall_1.id_3 = 0;
  wire id_29;
  always @(posedge 1) begin : LABEL_0
    id_0 <= id_22;
  end
endmodule
