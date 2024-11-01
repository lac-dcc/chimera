// Seed: 2053898824
module module_0;
  always @(posedge id_1) begin
    $display(id_1, id_1, 'd0);
    id_1 = 1'b0;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
  assign id_3 = 1 ? 1'd0 : 1;
  assign id_4 = 1 ? id_5 : id_4;
  assign id_4 = id_1;
  wire id_6;
  module_0(); id_7(
      .id_0(id_3), .id_1(id_6), .id_2(), .id_3(1)
  );
endmodule
