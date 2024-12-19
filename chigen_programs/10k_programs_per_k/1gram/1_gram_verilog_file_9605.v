// Seed: 2814680158
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
    id_19
);
  inout wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_9 = 1;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = id_2;
  wire id_6;
  wire id_7, id_8;
  assign id_3 = 1;
  wire id_9, id_10 = id_2 < 1;
  always begin : LABEL_0
    @(id_9)
    #id_11 begin : LABEL_0$display
      ;
      id_10 = 1 - id_7 & id_7;
      id_4 <= id_1;
    end
  end
  final id_3 <= id_2;
  wire id_12;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_8,
      id_6,
      id_5,
      id_5,
      id_7,
      id_12,
      id_8,
      id_9,
      id_10,
      id_10,
      id_7,
      id_11,
      id_8,
      id_5,
      id_8,
      id_8
  );
  wire id_13;
  assign id_9 = 1'h0;
  id_14 :
  assert property (@(id_4) id_14) $display(1);
  reg id_15 = 1 ? 1 : id_4, id_16;
  wire id_17, id_18;
endmodule
