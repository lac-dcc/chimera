// Seed: 4023267170
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
  input wire id_23;
  input wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  id_24 :
  assert property (@(posedge -1'd0) -1'b0) $display((id_9));
  wire id_25, id_26;
  tri  id_27 = -1 - 1;
  wire id_28;
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1
);
  assign id_1 = id_0 & (id_0);
  logic id_3, id_4, id_5;
  logic id_6;
  generate
    begin : LABEL_0
      assign id_1 = id_4;
      begin : LABEL_0
        logic id_7;
        assign id_3 = 1;
        wand id_8, id_9;
        assign id_5 = -1;
        begin : LABEL_0
          assign id_6 = id_8 ? id_0 : id_7;
        end
      end
    end
  endgenerate
  module_0 modCall_1 (
      id_8,
      id_9,
      id_8,
      id_9,
      id_9,
      id_9,
      id_8,
      id_9,
      id_8,
      id_8,
      id_9,
      id_9,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_9,
      id_9,
      id_8,
      id_8,
      id_8,
      id_8
  );
  initial id_1.id_5 <= -1;
  always id_6 <= id_0;
endmodule
