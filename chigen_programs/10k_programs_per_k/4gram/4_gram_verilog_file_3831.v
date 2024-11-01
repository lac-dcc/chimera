// Seed: 3230660614
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_7;
  supply1 id_8;
  wor id_9;
  wire id_10;
  id_11(
      .id_0(id_6), .id_1(id_9), .id_2(id_7), .id_3(1), .id_4(id_10), .id_5(~id_6), .id_6(1)
  );
  always @(posedge 0) id_9 = 1;
  wire id_12;
  assign id_8 = 1 ? id_3 : 1;
  integer id_13, id_14;
  wire id_15;
endmodule
module module_1 (
    output logic id_0
);
  wire id_2;
  reg  id_3;
  module_0(
      id_2, id_2, id_2, id_2, id_2, id_2
  );
  always @(*) begin
    id_3 <= (!id_3);
    id_0 <= id_3 - 1;
  end
  id_4(
      1'd0, 1'b0
  );
endmodule
