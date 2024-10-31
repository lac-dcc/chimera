// Seed: 3616170508
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  reg id_9;
  always @(*) begin
    id_6 <= {1, id_3};
    id_9 = id_8;
  end
  wire id_10;
  module_0(
      id_10, id_10
  );
  always @(posedge 1'h0) begin
    id_6 <= 1;
    if (id_8) id_9 <= 1;
  end
  id_11(
      .id_0(), .id_1(id_2 < 1'h0), .id_2(1), .id_3(1), .id_4(id_6 & 1)
  );
endmodule
