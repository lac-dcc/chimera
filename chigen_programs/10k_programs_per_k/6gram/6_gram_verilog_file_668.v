// Seed: 2938848201
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(id_3 or ~id_3) begin
    fork
      #1;
      $display;
    join : id_9
  end
  integer id_10 (
      .id_0(1),
      .id_1(id_4),
      .id_2(id_4),
      .id_3(1 - 1 + id_3),
      .id_4(1),
      .id_5(id_4),
      .id_6(id_6)
  );
endmodule
module module_1 #(
    parameter id_8 = 32'd53,
    parameter id_9 = 32'd33
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
  defparam id_8.id_9 = $display(
      1
  ); module_0(
      id_1, id_3, id_2, id_1, id_5, id_5, id_7, id_7
  );
endmodule
