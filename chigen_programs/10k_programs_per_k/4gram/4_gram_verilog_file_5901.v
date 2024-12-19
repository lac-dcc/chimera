// Seed: 2796395906
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
  output wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  id_18(
      .id_0(id_10), .id_1(id_13)
  );
  wire id_19;
endmodule
module module_1 (
    input tri1 id_0,
    output wand id_1,
    output tri0 id_2,
    input wand id_3,
    input wand id_4,
    output supply0 id_5,
    input tri1 id_6,
    input tri0 id_7,
    output wor id_8,
    input wand id_9,
    input supply0 id_10,
    input wor id_11
    , id_17,
    input logic id_12,
    input wor id_13,
    output logic id_14,
    output wor id_15
);
  id_18(
      .id_0(), .id_1(id_4), .id_2(id_17)
  );
  always
    while (1) begin : LABEL_0
      if ((id_4)) id_14 <= id_12;
      else
        #(1 - id_4) begin : LABEL_0
          id_17 = id_17;
        end
    end
  wire id_19;
  wor  id_20 = id_3;
  wire id_21;
  wire id_22;
  module_0 modCall_1 (
      id_22,
      id_17,
      id_22,
      id_19,
      id_21,
      id_21,
      id_22,
      id_17,
      id_19,
      id_22,
      id_17,
      id_21,
      id_22,
      id_22,
      id_17,
      id_22,
      id_22
  );
  assign modCall_1.id_13 = 0;
  id_23 :
  assert property (@(posedge 1) 1)
  else $display(id_12);
  wire id_24, id_25, id_26;
  wire id_27;
endmodule
