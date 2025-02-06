// Seed: 561291907
module module_0;
  assign id_1 = -1;
  wire \id_2 ;
  id_3(
      .id_0(\id_2 ), .id_1(\id_2 ), .id_2($realtime)
  ); specify
    (id_4 + => id_5) = ($realtime : id_5  : id_1, $realtime : -1  : -1);
  endspecify
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
    id_12
);
  input wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(id_1 or posedge id_5) begin : LABEL_0
    id_2 <= id_1;
  end
  id_13(
      .id_0(1),
      .id_1(),
      .id_2(id_8),
      .id_3(id_9),
      .id_4(1),
      .id_5(id_2),
      .id_6(id_2),
      .id_7(id_9 == id_5)
  );
  module_0 modCall_1 ();
  assign modCall_1.id_4 = 0;
  id_14(
      .id_0($realtime), .id_1($realtime), .id_2()
  );
endmodule
