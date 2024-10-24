// Seed: 2666458456
module module_0 (
    output reg id_0,
    input  reg id_1
);
  always @(posedge id_1) begin
    if (id_1) begin
      SystemTFIdentifier(id_1, 1);
      #1;
    end else begin
      id_0 <= id_1;
    end
    id_0 <= #1 1;
  end
  always @(posedge ~(id_1) == 1) SystemTFIdentifier;
  assign id_0 = 1'd0;
  defparam id_2.id_3 = id_1 != 1;
endmodule
module module_1 (
    output logic id_0,
    input id_1,
    output logic id_2,
    output id_3,
    input id_4,
    input id_5,
    output id_6,
    input id_7
);
  reg id_8 = 1;
  assign id_8 = id_7 - id_5;
  always @(posedge id_1 or negedge 1) begin
    id_8 <= id_1;
  end
  initial SystemTFIdentifier(1, id_4 + id_1, id_1);
  logic id_9;
  type_15(
      id_6, 1
  );
  logic id_10;
endmodule
