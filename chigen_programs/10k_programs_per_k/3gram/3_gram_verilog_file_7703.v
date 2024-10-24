// Seed: 542405578
module module_0 (
    output reg id_0,
    output id_1,
    input id_2,
    output id_3,
    input id_4
);
  logic id_5;
  type_24(
      1, id_3
  );
  type_25 id_6 (
      .id_0(1),
      .id_1(1'b0),
      .id_2(id_5)
  );
  assign #1 id_5 = 1;
  always @(posedge 'b0 ^ 1) begin
    id_0 <= #id_4 1;
  end
  logic id_7;
  reg   id_8;
  logic id_9;
  reg   id_10;
  type_0 id_11 (
      id_5,
      id_7
  );
  initial
    @(posedge 1 or posedge id_10) begin
      SystemTFIdentifier(id_4, id_4, id_5, id_5);
      id_3 <= 1;
    end
  reg id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19;
  type_31(
      id_9, 1
  );
  always @(posedge 1)
    if (1) id_10 <= 1;
    else id_8 <= #1 1;
  logic id_20;
  type_32 id_21 (
      .id_0(id_18 - 1),
      .id_1((id_4)),
      .id_2(id_4),
      .id_3(1'h0)
  );
  assign id_5 = 1'd0;
  assign id_3 = id_15;
  assign id_5 = id_16 * {id_7, 1'd0};
endmodule
