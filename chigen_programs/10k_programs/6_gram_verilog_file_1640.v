// Seed: 2601721132
module module_0 #(
    parameter id_10 = 32'd40,
    parameter id_9  = 32'd20
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(*) begin
    {id_1 == id_4} += 1'h0;
  end
  wire id_8;
  defparam id_9.id_10 = id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always @(posedge 1 or posedge {1, id_3 - 1}) id_2 <= #id_3 1;
  wire id_5;
  id_6(
      id_2, 1, 1
  ); timeprecision 1ps; module_0(
      id_5, id_5, id_1, id_5, id_5, id_3, id_5
  );
  assign id_1 = 1;
  notif0 (id_4, id_6, id_3);
endmodule
