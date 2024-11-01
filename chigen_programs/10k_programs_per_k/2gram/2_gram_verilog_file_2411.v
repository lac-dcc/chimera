// Seed: 2371091323
module module_0 (
    input  tri0  id_0,
    output logic id_1
);
  always id_1 <= 1;
  assign id_1 = 1;
  wire id_3, id_4;
endmodule
module module_1 (
    output logic id_0,
    input  wand  id_1,
    input  tri   id_2,
    input  tri1  id_3,
    input  wor   id_4
);
  always_latch begin
    if (id_4 + id_3) id_0 <= 1'b0;
    else #1 #1 @(*) disable id_6;
  end
  wire id_7;
  id_8(
      .id_0(), .id_1(id_3), .id_2(id_7), .id_3(1), .id_4(1), .id_5(1)
  );
  wire id_9;
  module_0(
      id_2, id_0
  );
endmodule
