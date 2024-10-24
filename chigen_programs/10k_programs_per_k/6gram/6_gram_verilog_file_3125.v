// Seed: 3567781546
module module_0 (
    input id_0,
    output id_1,
    input id_2,
    input id_3,
    input id_4,
    output logic id_5,
    input logic id_6,
    output logic id_7,
    output id_8,
    input logic id_9,
    output id_10
);
  reg   id_11;
  logic id_12;
  always @(posedge id_2) begin
    if (id_0) id_11 <= id_4;
  end
  always @(posedge 1 - id_4) if (id_9) id_10 = "";
  logic id_13;
  logic id_14 = 1;
  assign id_1 = 1'b0;
  wire id_15;
  assign id_11 = id_3;
  assign id_15[1] = 1;
  logic id_16;
  assign id_8 = !id_6;
  logic id_17;
  assign id_1 = id_13;
  logic id_18;
  assign id_7 = id_14 & 1'b0;
  generate
    begin : id_19
      type_3 id_20 (
          .id_0(id_19),
          .id_1(id_0),
          .id_2(id_11)
      );
    end
  endgenerate
endmodule
