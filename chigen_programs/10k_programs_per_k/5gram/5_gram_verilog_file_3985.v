// Seed: 625271210
module module_0 ();
  wire id_1;
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
    id_10
);
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_11, id_12;
  module_0 modCall_1 ();
endmodule
module module_2 (
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
  inout wire id_22;
  inout wire id_21;
  input wire id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_24, id_25;
  wire id_26;
  initial begin : LABEL_0
    begin : LABEL_0
      #(id_9 == id_6) begin : LABEL_0
        wait (1 * 1 & 1'b0);
        id_18 <= 1;
        id_17 = 1;
        id_12 <= 1;
      end
      id_22 <= 1;
      fork
        #1;
      join
    end
  end
  wire id_27;
  assign id_12 = ~id_21;
  wire id_28, id_29;
  module_0 modCall_1 ();
  assign id_9 = 1'b0;
endmodule
