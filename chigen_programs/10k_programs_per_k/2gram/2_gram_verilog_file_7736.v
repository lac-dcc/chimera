// Seed: 2423134875
module module_0 ();
endmodule
module module_1;
  wire id_1;
  module_0();
  wire id_2;
endmodule
module module_2;
  assign id_1 = 1;
  module_0();
  wire id_2;
  wire id_3;
  wire id_4;
  assign id_4 = id_3;
endmodule
module module_3 (
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
    id_14
);
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wand id_15;
  module_0(); id_16 :
  assert property (@(posedge id_5 or posedge id_13) 1)
  else;
  id_17(
      .id_0(), .id_1(+id_2), .id_2(1), .id_3(id_6), .id_4(1), .id_5(id_2)
  );
  wand id_18;
  assign id_3 = 1;
  assign id_7 = 1;
  for (id_19 = 1; id_15; id_14 = 1) begin
    wire id_20;
    wire id_21;
    always_latch id_14 = id_18;
  end
endmodule
