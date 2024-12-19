// Seed: 1479736761
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
  input wire id_19;
  input wire id_18;
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_13[1] = 1;
  assign id_3 = (id_5);
  tri0 id_20;
  assign id_13 = id_4;
  assign id_15 = id_1;
  wire id_21;
  assign id_11 = 1'h0;
  wire id_22, id_23;
  wire id_24;
  assign id_8 = id_7#(.id_17(id_20)) [1'b0 : 1+1'b0];
  task id_25(input id_26, input id_27);
    begin : LABEL_0
      id_20 = ~id_26;
    end
  endtask
  wire id_28;
  wire id_29 = id_19;
  wire id_30;
  id_31(
      .id_0(1), .id_1(1), .id_2(id_8), .id_3(1'b0 + {id_27 + 1'b0{1}})
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  assign id_3[1'b0-1'b0] = (1);
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_3,
      id_4,
      id_4,
      id_3,
      id_5,
      id_4,
      id_5,
      id_5,
      id_5,
      id_3,
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_1
  );
  assign id_3[1] = id_2;
  wire id_6;
endmodule
