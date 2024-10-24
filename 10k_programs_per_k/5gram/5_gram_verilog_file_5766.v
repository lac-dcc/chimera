// Seed: 3812692850
module module_0 (
    input reg id_0
    , id_7,
    input id_1,
    input id_2,
    output id_3,
    input id_4,
    input id_5,
    output id_6
);
  reg   id_8;
  logic id_9;
  assign id_6 = "" ? id_4 : 1;
  always @* begin
    id_6 <= #1 id_4;
    if ((id_0)) begin
      id_3 = 1'b0;
      if (id_8) id_6 <= id_2[1];
      else begin
        id_8 <= id_0;
      end
    end else begin
      SystemTFIdentifier(id_9);
    end
  end
  logic id_10 = 1'b0 - 1;
  always @(1 or negedge id_5) begin
    id_8 <= id_5;
  end
endmodule
