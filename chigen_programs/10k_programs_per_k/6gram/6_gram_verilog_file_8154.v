// Seed: 116096695
module module_0;
  always @(negedge 1) #1;
endmodule
module module_1 (
    input  tri1  id_0,
    output wor   id_1,
    input  logic id_2,
    input  tri0  id_3,
    output uwire id_4
);
  reg id_6;
  module_0();
  always @(1 or 1'b0) begin
    id_6 <= id_2;
    id_6 <= 1'b0 == id_6;
  end
  always @(posedge 1 or id_6) begin
    if (id_6) disable id_7;
  end
  wire id_8;
  id_9(
      .id_0(id_0), .id_1(1'b0), .id_2((id_0)), .id_3(1 - id_4), .id_4(1), .id_5(1'b0), .id_6(id_6)
  );
endmodule
