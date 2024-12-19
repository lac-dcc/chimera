// Seed: 2514150494
module module_0 (
    input wor id_0,
    output wor id_1,
    input wor id_2,
    output supply0 id_3,
    output tri1 id_4,
    input supply1 id_5,
    input wor id_6
);
  logic [7:0]
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
      id_22;
  assign module_1.id_18 = 0;
  wire id_23 = 1'd0;
  initial begin : LABEL_0
    id_14 = id_8;
  end
  id_24 :
  assert property (@(posedge id_13[1]) 1)
  else $display(1, !1);
  assign id_18[1-:{1{1}}] = 1'h0;
  supply0 id_25;
  final $display(1'b0, id_25);
  always @(posedge ~id_5) begin : LABEL_0
    id_14[1] <= 1;
  end
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    output tri1 id_2,
    input tri0 id_3,
    input uwire id_4,
    input uwire id_5,
    output tri0 id_6,
    output wire id_7,
    input wand module_1,
    input supply1 id_9,
    input tri1 id_10,
    input wand id_11,
    output supply0 id_12,
    output supply1 id_13,
    input tri1 id_14,
    output tri1 id_15,
    output tri0 id_16,
    input supply0 id_17,
    input wand id_18,
    input supply0 id_19,
    output supply1 id_20,
    input tri1 id_21,
    input supply1 id_22,
    output wand id_23
);
  assign id_16 = id_0;
  module_0 modCall_1 (
      id_0,
      id_15,
      id_19,
      id_20,
      id_23,
      id_0,
      id_14
  );
  wire id_25;
  wire id_26 = 1'b0;
  wire id_27, id_28, id_29, id_30;
  always @(negedge 1) begin : LABEL_0$display
    ;
  end
  assign id_26 = (1);
endmodule
