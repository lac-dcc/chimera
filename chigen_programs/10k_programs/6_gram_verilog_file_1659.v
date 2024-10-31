// Seed: 1854142243
module module_0 #(
    parameter id_4 = 32'd86,
    parameter id_5 = 32'd25
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  defparam id_4.id_5 = 1'h0;
endmodule
module module_1 (
    output wire id_0,
    inout  tri1 id_1
);
  supply1 id_3, id_4, id_5, id_6;
  id_7(
      id_6, 1 != id_4, 1
  ); module_0(
      id_4, id_6, id_6
  );
endmodule
module module_2 (
    output logic   id_0,
    input  logic   id_1,
    output logic   id_2,
    input  logic   id_3,
    output logic   id_4,
    output supply0 id_5,
    output supply1 id_6,
    input  logic   id_7
);
  always @(id_3 or negedge id_3) begin
    id_4 <= id_3;
    $display;
  end
  always @(posedge id_7)
    case ($display(
        1
    ))
      1: id_0 <= 1 == 1'b0;
      1: id_2 = #1 1'h0 - id_1;
      id_1: begin
        id_2 = id_7;
      end
    endcase
endmodule
module module_3 (
    input supply1 id_0,
    output logic id_1,
    input logic id_2,
    input supply1 id_3,
    input supply1 id_4,
    output tri1 id_5
);
  assign id_1 = 1'b0;
  initial id_1 <= id_2;
  module_2(
      id_1, id_2, id_1, id_2, id_1, id_5, id_5, id_2
  );
endmodule
