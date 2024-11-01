// Seed: 3559330786
module module_0 (
    output tri id_0,
    output supply1 id_1,
    input tri0 id_2,
    output uwire id_3,
    output tri0 id_4
);
  always @(posedge 1 or posedge id_2) begin
    disable id_6;
  end
endmodule
module module_1 (
    input logic id_0,
    input uwire id_1,
    output supply0 id_2,
    input wire id_3,
    input wand id_4,
    output logic id_5
);
  logic id_7 = 1;
  always
    case (id_4)
      1: id_2 = 1;
      1'd0: id_7 = 1;
      1: begin
        if (id_4) $display(1);
      end
      default: id_5 = #1 id_0;
    endcase
  module_0(
      id_2, id_2, id_4, id_2, id_2
  );
  assign id_7 = id_0;
endmodule
