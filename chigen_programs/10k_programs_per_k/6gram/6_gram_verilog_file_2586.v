// Seed: 368626829
module module_0;
  uwire id_1;
  assign id_1 = 1'b0 ? 1 : 1'b0 ^ 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wand id_5 = 1;
  module_0();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(id_1 or posedge id_3) begin
    disable id_6;
    id_6 <= 1;
    id_4 = id_3;
    fork
      begin : id_7
        $display();
      end
    join_any
    #1 id_6 = id_5;
    #1 id_4 = 1'h0 - id_3;
    id_6 = #id_8 1;
  end
  module_0();
endmodule
