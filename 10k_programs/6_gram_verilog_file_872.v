// Seed: 2614006848
module module_0 (
    input id_0,
    output id_1,
    output reg id_2
);
  always @(1 or 1'b0) begin
    id_1 <= id_0;
    id_2 <= #1 id_0;
  end
  always @(posedge 1 or posedge id_0 != 1'b0) begin
    SystemTFIdentifier(1 !== id_0);
    id_1 <= {1, 1, 1};
    id_2 <= ~id_0;
  end
endmodule
