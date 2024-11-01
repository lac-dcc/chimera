// Seed: 846162456
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(1 or posedge id_6 + 1 or negedge 1'b0) begin
    id_4 = id_6;
  end
endmodule
module module_1;
  always @(id_1 or posedge 1'd0)
    casez (id_1 != id_1 + 1)
      1'b0 & "" == id_1: id_1 = id_1;
      default: $display;
    endcase
  module_0(
      id_1, id_1, id_1, id_1, id_1, id_1
  );
endmodule
