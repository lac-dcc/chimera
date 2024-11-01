// Seed: 1094803250
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  always @(posedge 1)
    if ((1)) begin
      if (1) $display(1, id_2);
    end else id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = ~('b0 == 1);
  module_0(
      id_1, id_2
  );
endmodule
module module_2 (
    input  tri1  id_0,
    input  logic id_1,
    output logic id_2
);
  wire id_4;
  module_0(
      id_4, id_4
  );
  always @(posedge id_0 or posedge id_0) begin
    id_2 <= id_1;
  end
endmodule
