// Seed: 1530739505
module module_0 (
    output reg id_0,
    input logic id_1,
    input id_2,
    input logic id_3
);
  function id_4;
    input integer id_5;
    begin
      id_0 <= (1);
    end
  endfunction
  assign id_0 = id_2;
  type_11 id_6 (
      .id_0(id_0),
      .id_1(id_0),
      .id_2(id_4),
      .id_3(1),
      .id_4(1'b0),
      .id_5(1),
      .id_6(id_5),
      .id_7(id_0),
      .id_8(id_4),
      .id_9(1)
  );
  always @(posedge 1'h0) begin
    SystemTFIdentifier();
  end
  type_12(
      1, id_2
  );
  assign id_0 = id_5;
  always @(*) begin
    id_0 <= id_2;
  end
  logic id_7;
endmodule
