// Seed: 2402679440
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8, id_9;
  wire id_10;
  assign id_1 = 1;
  wire id_11;
endmodule
module module_1 (
    id_1,
    module_1,
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
  output wire id_21;
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge id_5 or id_10)
    #1 begin : LABEL_0
      forever begin : LABEL_0
        id_14 = id_17;
        if (1) begin : LABEL_0
          fork
            id_1 = ~id_19[(1)];
            disable id_22;
          join
        end
        if (id_10) id_6 <= id_3;
      end
    end
  assign id_8 = 1;
  module_0 modCall_1 (
      id_22,
      id_16,
      id_2,
      id_8,
      id_2,
      id_8,
      id_15
  );
endmodule
