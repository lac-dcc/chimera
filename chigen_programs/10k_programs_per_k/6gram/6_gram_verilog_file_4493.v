// Seed: 4232464192
module module_0;
  reg id_1;
  always @(*) begin
    id_1 = id_1 != 1;
    id_1 <= id_1;
    id_1 = 1;
    $display(1, id_1, id_1);
    release id_1;
    id_1 <= 1;
  end
endmodule
module module_1;
  wire id_2;
  module_0();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_7, id_8, id_9 = id_7;
  wire id_10;
  wire id_11, id_12;
  logic [7:0] id_13;
  always @(1 or posedge id_13[1 : 1])
    if (1) begin
      assert (id_9);
    end
  module_0();
endmodule
