// Seed: 2972936354
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge 1) begin
    fork
      id_7;
      $display(1);
    join
  end
  id_8(
      .id_0(id_3), .id_1(id_2), .id_2(id_1)
  );
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    input tri id_2,
    output tri id_3
);
  wire  id_5;
  uwire id_6;
  wire  id_7;
  module_0(
      id_5, id_5, id_7, id_5, id_7, id_7
  );
  reg id_8;
  always @(1 or 1'h0) begin
    id_8 <= 1;
  end
  id_9(
      .id_0(id_5), .id_1(id_1), .id_2(), .id_3(id_2), .id_4(), .id_5(id_8), .id_6(id_3), .id_7(id_3)
  );
  assign id_6 = id_0;
  wire id_10;
  assign id_8 = 1;
endmodule
