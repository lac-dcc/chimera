// Seed: 4062685676
module module_0 (
    output wand id_0,
    input tri id_1,
    input tri id_2,
    input supply0 id_3,
    input wor id_4,
    input tri id_5
);
  wire id_7, id_8, id_9, id_10;
  assign id_0 = !id_2 == id_4;
  integer id_11 (.id_0(1'b0));
endmodule
module module_1 (
    input wire id_0,
    input supply0 id_1,
    input tri0 id_2,
    input wand id_3,
    input supply0 id_4,
    output uwire id_5
);
  wire id_7 = 1;
  module_0(
      id_5, id_1, id_4, id_2, id_3, id_0
  ); id_8 :
  assert property (@(1) 1)
  else;
  always begin
    wait (1'h0);
  end
  id_9(
      .id_0(id_3), .id_1(id_1), .id_2(id_7), .id_3(), .id_4(1), .id_5(1), .id_6(id_7), .id_7(1'd0)
  );
  wire id_10;
  assign id_7 = 1;
  wor  id_11 = "" || id_7;
  wire id_12;
  wire id_13;
endmodule
