// Seed: 1388011026
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
    id_16
);
  output wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_17, id_18, id_19;
  always begin : LABEL_0$display
    ;
  end
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21
);
  output wire id_21;
  output wire id_20;
  output wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_22;
  reg id_23 = id_22, id_24;
  initial id_7 = 1;
  module_0 modCall_1 (
      id_7,
      id_4,
      id_20,
      id_18,
      id_17,
      id_9,
      id_12,
      id_14,
      id_13,
      id_9,
      id_18,
      id_9,
      id_4,
      id_2,
      id_9,
      id_19
  );
  wire id_25;
  tri id_26, id_27;
  reg id_28, id_29, id_30, id_31, id_32;
  id_33 :
  assert property (@(posedge id_18) 1'b0)
    @(posedge 1'b0)
      @(posedge 1'b0) begin : LABEL_0
        id_31 <= id_23;
        begin : LABEL_0
          if (id_23) $display(id_28, 1'b0);
        end
      end
  else if (id_23 || id_4 || id_4) $display(id_10, 1 + id_31, id_3, id_32, 1, id_7 + (id_18), 1, 1);
  assign id_16 = 1;
endmodule
