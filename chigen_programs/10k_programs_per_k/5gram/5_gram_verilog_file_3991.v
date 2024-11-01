// Seed: 2854677078
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    input tri1 id_2,
    input wand id_3,
    input tri1 id_4,
    input wor id_5,
    output supply0 id_6
);
  always_latch @(1) begin
    id_6 = 1;
    wait (1);
    $display;
    id_6 = 1 == ~id_1;
  end
  wire id_8;
  id_9(
      .find(), .id_0(), .id_1(1), .id_2(1 & 1)
  );
  wire id_10;
  wire id_11;
  wire id_12;
  wire id_13;
  wire id_14;
  generate
    assign id_0 = 1 !=? 1;
  endgenerate
  wand id_15 = 1;
endmodule
module module_1 (
    inout supply1 id_0,
    input wor id_1,
    input tri1 id_2,
    input wor id_3,
    input wire id_4,
    output uwire id_5,
    output supply0 id_6
);
  assign id_6 = id_0;
  module_0(
      id_0, id_1, id_4, id_2, id_3, id_0, id_5
  );
endmodule
