// Seed: 2988950425
module module_0;
  wire id_1;
  wand id_3;
  wand id_4;
  assign id_4 = 1'b0;
  case (1'b0)
    id_3: begin : LABEL_0
      wire id_5;
    end
    1: assign id_4 = 1;
  endcase
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  assign modCall_1.type_7 = 0;
  id_8(
      .id_0(id_2[1'h0]),
      .id_1(1),
      .id_2(1'b0),
      .id_3(1),
      .id_4(1 + id_1),
      .id_5(1'b0),
      .id_6(id_2),
      .id_7(((1))),
      .id_8(1),
      .id_9(id_2),
      .id_10(id_7),
      .id_11(1),
      .id_12(id_2[1]),
      .id_13(1 - 1),
      .id_14(id_3),
      .id_15(1),
      .id_16(1'b0)
  );
  wire id_9;
  assign id_1 = id_6[1];
  wire id_10;
  id_11 :
  assert property (@(posedge id_10) id_9)
  else $display(1);
  assign id_10 = (id_3);
endmodule
