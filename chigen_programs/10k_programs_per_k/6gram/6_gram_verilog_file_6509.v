// Seed: 3777943947
module module_0 ();
  uwire id_1;
  wire  id_2;
  initial begin
    wait (id_1);
    wait (id_1 + 1'b0);
  end
endmodule
module module_1;
  always @(1) begin
    id_1 <= id_1;
  end
  module_0();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = id_2;
  module_0();
  always @(1 or posedge 1'b0) begin
    #id_5;
    id_5 = {1, 1};
    $display(id_4);
    if (id_2 + 1'b0) begin
      for (id_1 = 1; id_2 == 1; id_5 = ~|id_5) id_1 = #1  (1 & 1);
    end else id_1 <= id_4;
  end
endmodule
