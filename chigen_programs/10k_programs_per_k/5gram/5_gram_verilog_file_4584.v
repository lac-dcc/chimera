// Seed: 2157674561
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
    id_20
);
  output wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_21;
  assign module_1.id_6 = 0;
  assign id_14 = 1;
endmodule
module module_1 (
    output logic id_0,
    input supply0 id_1,
    input wand id_2,
    output tri1 id_3,
    input wor id_4,
    output supply0 id_5,
    output logic id_6,
    input wand id_7,
    output wor id_8,
    input tri0 id_9,
    input uwire id_10,
    input logic id_11
);
  always @(posedge 1) id_5 = 1'b0 == id_11;
  always_latch @(posedge id_2 or 1) begin : LABEL_0
    deassign id_3.id_11;
    id_0 <= id_1 == $display || id_9;
  end
  wor id_13;
  always_latch @(posedge id_10) begin : LABEL_0
    disable id_14;
  end
  module_0 modCall_1 (
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13
  );
  always @(posedge 1 == 1) begin : LABEL_0
    if (1) begin : LABEL_0
      fork
        begin : LABEL_0
          id_6 <= id_11;
          id_13 = 1;
          assume (id_2 == 1'b0);
        end
      join
    end else if (1) begin : LABEL_0
      if (id_4 == id_7) disable id_15;
    end
  end
  assign id_8 = 1;
endmodule
