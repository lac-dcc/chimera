// Seed: 3732817417
module module_0;
  reg id_1;
  pulldown (
      .id_0(|id_2),
      .id_1(1),
      .id_2(1),
      .id_3(-1),
      .id_4(-1),
      .id_5(id_2 == id_3[1'b0]),
      .id_6(id_2),
      .id_7(1),
      .id_8(id_2 != -1'b0)
  );
  initial begin : LABEL_0
    id_1 <= id_2;
  end
  wire id_4;
  wire id_5, id_6;
  supply0 id_7, id_8, id_9;
  supply1 id_10 = $realtime;
  assign id_7 = -1;
  wire id_11;
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
    id_11
);
  output wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_12;
  module_0 modCall_1 ();
  assign modCall_1.id_7 = 0;
  initial id_3 <= id_7;
endmodule
