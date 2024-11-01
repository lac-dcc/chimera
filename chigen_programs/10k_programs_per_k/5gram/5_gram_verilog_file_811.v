// Seed: 2466794966
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_3 ? id_3 : id_2 ? 1'b0 : 1;
  id_4 :
  assert property (@(posedge id_4) 1)
  else $display(id_4, id_2, id_3);
  wire id_5;
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
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
  module_0(
      id_3, id_6, id_6
  ); id_9(
      .id_0(1),
      .id_1(1),
      .id_2(id_6++ == id_4 < 1),
      .id_3(id_4),
      .id_4(1),
      .id_5(id_4 && id_6),
      .id_6(1'b0),
      .id_7(1),
      .id_8(id_1++),
      .id_9(id_2 == id_2)
  ); id_10(
      .id_0(id_7), .id_1(), .id_2(id_7), .id_3(id_2), .id_4(id_3), .min(id_7), .id_5(id_1)
  );
  assign id_7[1] = 1 !=? 1'd0;
endmodule
