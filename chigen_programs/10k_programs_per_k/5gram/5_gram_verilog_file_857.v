// Seed: 4002314067
module module_0 ();
  always_ff @(posedge id_1 or posedge 1'b0) begin
    id_1 <= id_1;
  end
  assign id_1 = 1;
  final begin
    id_1 <= 1'd0;
    if (1) id_1 <= 1'b0;
  end
  assign id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  module_0(); id_3(
      .id_0(1 == id_2), .id_1(1'h0 == 1)
  );
  wire id_4;
endmodule
module module_2;
  wire id_1;
  wire id_2;
  module_0();
  wire id_3;
endmodule
