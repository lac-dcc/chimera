// Seed: 4203198835
module module_0;
  always @(posedge ~id_1) begin : LABEL_0
    wait (id_1);
  end
  assign module_1.id_8 = 0;
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
    id_19
);
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  xor primCall (
      id_10, id_11, id_12, id_13, id_16, id_17, id_18, id_19, id_5, id_6, id_7, id_8, id_9
  );
  module_0 modCall_1 ();
  assign id_19 = id_8 ? 1'b0 : 1 == 1;
  assign id_17 = (1);
endmodule
