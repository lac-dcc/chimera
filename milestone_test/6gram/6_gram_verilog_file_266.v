// Seed: 288650533
module module_0 (
    input  reg id_0,
    input  reg id_1,
    output reg id_2
);
  always @(negedge id_1) begin
    SystemTFIdentifier({id_1, id_0});
    SystemTFIdentifier;
  end
  initial begin
    SystemTFIdentifier(1, 1);
    case (id_0)
      1: id_2 = id_1;
      id_0: id_2 = 1;
      id_0: id_2 = id_1;
      id_0 - 1: id_2 <= 1'b0;
      default: id_2 = id_0;
    endcase
  end
endmodule
