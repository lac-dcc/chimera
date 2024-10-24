// Seed: 873201058
module module_0 (
    input id_0
    , id_14,
    input id_1
    , id_15,
    input logic id_2,
    output id_3,
    input id_4,
    output reg id_5,
    input id_6,
    output id_7,
    input id_8,
    input id_9,
    input logic id_10,
    input id_11,
    output id_12,
    output id_13
);
  assign id_3 = 1;
  type_23 id_16 (
      .id_0(id_13),
      .id_1(1),
      .id_2(1),
      .id_3(id_12),
      .id_4(id_11),
      .id_5(id_14)
  );
  type_24 id_17;
  logic   id_18;
  type_0 id_19 (
      .id_0(id_12[1] & 1),
      .id_1(),
      .id_2(id_14[1]),
      .id_3("")
  );
  always @(posedge id_16 or posedge id_17) begin
    if (1) id_5 <= id_9;
    else begin
      id_7 <= 1;
    end
  end
endmodule
