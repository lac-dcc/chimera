// Seed: 4232511908
module module_0;
  always @(negedge id_1)
    if (id_1) begin
      id_1 = new(1, 1, 1);
    end else id_1 <= id_1;
  integer id_3 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always
    if (id_3) id_1 <= 1;
    else begin
      $display("" + id_4, id_6, id_4);
      id_2 <= 1;
    end
  module_0();
endmodule
