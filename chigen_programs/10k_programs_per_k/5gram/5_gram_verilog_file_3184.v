// Seed: 392682552
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  id_5(
      .id_0(1), .id_1(id_3)
  );
  assign id_4 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2 <= 1;
  wire id_3;
  module_0(
      id_3, id_2, id_2, id_1
  );
  always @(posedge id_3 or 1) begin
    id_4(id_3, ~id_4);
  end
endmodule
