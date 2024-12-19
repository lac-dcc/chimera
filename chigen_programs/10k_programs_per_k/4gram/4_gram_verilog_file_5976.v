// Seed: 3913028874
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
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
    id_18
);
  output wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_19;
  supply0 id_20;
  always @(posedge 1) begin : LABEL_0
    id_2 <= 1;
  end
  initial begin : LABEL_0
    id_16 <= id_13;
  end
  wire id_21;
  wire id_22;
  supply1 id_23;
  wire id_24;
  module_0 modCall_1 (
      id_20,
      id_19,
      id_20
  );
  id_25 :
  assert property (@(posedge "") id_4)
  else $display(id_9, 1'h0 / id_23 - id_20, 1'b0, id_23);
endmodule
