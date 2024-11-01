// Seed: 3937181846
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    input  tri1  id_0,
    output wire  id_1,
    input  uwire id_2,
    output wand  id_3
);
  wire id_5, id_6;
  module_0(
      id_5, id_6
  );
endmodule
module module_2;
  reg id_1;
  reg id_2;
  initial begin
    for (id_1 = 1 - id_2; 1; id_1 = id_1) begin
      #1 $display;
      id_3();
      $display(id_2);
      $display(id_3 ? id_2 : id_1, id_1, 1 ? 1 : id_3 ? 1 : id_1 ? 1'b0 : {'d0});
      #1 begin
        if (id_1) id_1 <= 1'h0;
      end
    end
  end
  assign id_1 = id_2;
endmodule
module module_3 (
    input  logic id_0,
    output logic id_1
);
  module_2();
  always @(posedge id_0 or negedge 1) id_1 <= id_0;
endmodule
