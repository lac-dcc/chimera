// Seed: 2384314272
module module_0 ();
  always @(posedge id_1) id_1 = 1'd0;
  reg id_2;
  reg id_3;
  assign id_2 = id_1;
  initial @(posedge id_2 or posedge id_3) #1 id_2 <= 1'b0;
  reg  id_4;
  wire id_5;
  assign id_4 = id_1;
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1
);
  wire id_3;
  wand id_4 = 1;
  wire id_5;
  wire id_6;
  wire id_7;
  wire id_8;
  id_9(
      .id_0(id_1), .id_1(1)
  );
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
