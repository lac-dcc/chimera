// Seed: 657870571
module module_0 #(
    parameter id_1 = 32'd2,
    parameter id_2 = 32'd22,
    parameter id_5 = 32'd58
) (
    inout _id_1,
    output logic _id_2
);
  assign #1 id_1[id_2[id_1+:1]] = id_1[id_1];
  assign id_1 = 1;
  assign id_2[1 : 1] = 1;
  assign id_2[id_1] = 1;
  assign id_1[id_2] = id_1;
  assign id_2[id_1] = 1;
  always @(posedge (1)) begin
    id_1 <= id_2;
  end
  assign id_2[(1)] = id_2;
  assign id_2[1]   = 1;
  reg   id_3;
  reg   id_4;
  logic _id_5;
  logic id_6;
  always @(id_2 or 1 - id_1) begin
    id_4 <= #1 id_3;
    id_3 <= id_4;
  end
  type_10(
      1, id_4, 1 - id_4[1] * 1 + 1
  );
  assign id_5[1 : id_5[1'b0]] = id_5 ^ 1;
  assign id_1 = 1;
endmodule
module module_1 (
    output logic id_1,
    input id_2,
    input id_3,
    input id_4,
    input id_5,
    input logic id_6,
    input id_7,
    output id_8
);
  type_14(
      id_7, id_5, 1
  );
  type_15 id_9 (
      .id_0(id_3),
      .id_1(id_10),
      .id_2(1),
      .id_3(id_1 & id_6),
      .id_4()
  );
  assign id_3 = ~&id_2;
  logic id_11 = 1;
endmodule
