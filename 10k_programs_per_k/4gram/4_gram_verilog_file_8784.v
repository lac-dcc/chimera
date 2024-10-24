// Seed: 593460175
module module_0 (
    input id_0,
    input id_1,
    input id_2,
    output logic id_3,
    input logic id_4,
    output id_5
);
  assign id_3 = 1'h0;
  always @(*) begin
    #1 begin
      SystemTFIdentifier;
    end
    id_5 <= id_1;
    if (1)
      if (1) id_5#(.id_0(id_4)) <= id_2;
      else id_5 <= id_2;
  end
  always @(negedge (1'h0)) id_5 = 1;
  logic id_6, id_7;
  logic id_8 = 1'b0;
endmodule
module module_1 (
    output id_0,
    output id_1,
    input logic id_2,
    input logic id_3
);
  logic id_6;
  logic id_8;
  type_16 id_9 (
      .id_0(id_4),
      .id_1(id_4),
      .id_2(1),
      .id_3(1'd0),
      .id_4(id_0),
      .id_5(1),
      .id_6(1'b0),
      .id_7(),
      .id_8(id_6),
      .id_9(id_8)
  );
  logic id_10;
  logic id_11;
  assign id_0 = id_2;
  type_19(
      id_2 || 1 && id_1[1] || id_7, id_4 == 1
  );
endmodule
