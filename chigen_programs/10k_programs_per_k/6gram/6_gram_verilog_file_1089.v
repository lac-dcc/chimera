// Seed: 1133111726
module module_0;
  specify
    (id_1 => id_2) = 1;
  endspecify
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  wire id_3;
  module_0();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(posedge 1) begin
    if (1)
      for (id_2 = id_3; 1; id_1 = 1) begin
        id_1 <= id_1;
      end
    else id_1 <= 1'b0;
  end
  module_0();
endmodule
