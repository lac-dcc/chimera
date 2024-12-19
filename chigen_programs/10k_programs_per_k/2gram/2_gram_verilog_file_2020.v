// Seed: 599520073
module module_0 ();
  assign id_1 = id_1++;
  task id_2(reg id_4, output reg id_5, output id_6, output id_7, input id_8);
    begin : LABEL_0
      id_4 <= #1 1;
      id_4 = id_4;
      id_3 = id_8;
      id_2 <= id_7 ^ id_7;
      $display(1'b0, 1, 1'b0, 1);
      id_7 <= id_4;
    end
  endtask
  wire id_9;
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
  input wire id_21;
  output wire id_20;
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_22;
  assign id_17 = 1;
  wand id_23 = id_14;
  if (id_1) begin : LABEL_0
    assign id_12 = {1{id_21}};
  end
  wire id_24 = 1;
  generate
    assign id_13 = 1;
    wire id_25;
    wor  id_26;
    wire id_27;
  endgenerate
  supply0 id_28 = 1;
  module_0 modCall_1 ();
  id_29 :
  assert property (@(posedge 1 != id_26 or posedge id_1) id_5#(.id_14(id_14++)))
  else;
  id_30(
      .id_0(id_16), .id_1(1 - id_13), .id_2((1)), .id_3((id_28) - 1), .id_4(1)
  );
  assign id_15[1] = "" - id_14;
  assign id_2 = 1;
  always $display(1);
endmodule
