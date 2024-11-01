// Seed: 3159705826
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  initial
    if (id_1) begin
      @(posedge id_3) id_4 <= 1;
    end
  id_6(
      1, 1, 1
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0(
      id_3, id_2, id_2, id_1, id_3
  );
  assign id_2 = {1{1 != $display}} - id_3;
  reg id_4, id_5;
  always begin
    #1 id_5 <= 1'b0 / id_5;
    id_1 <= 1'b0;
  end
  wire id_6, id_7, id_8;
endmodule
