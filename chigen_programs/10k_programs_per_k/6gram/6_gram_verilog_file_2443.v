// Seed: 3165515187
module module_0 (
    input id_0,
    output id_1
    , id_6,
    output logic id_2,
    input id_3,
    output reg id_4,
    output id_5
);
  logic id_7 = 1;
  logic id_8;
  logic id_9;
  always @(posedge id_0 or id_9) begin
    SystemTFIdentifier(id_6, 1'b0, 1, 1);
    casex ((id_8))
      id_7 & 1'b0: begin
        id_4 <= 1;
      end
      id_7: if (id_8) id_5 <= 1 <= id_0;
      1: id_1 <= #id_9  ~id_0;
      id_0: begin
        id_1 <= id_7 == 1;
      end
    endcase
  end
endmodule
