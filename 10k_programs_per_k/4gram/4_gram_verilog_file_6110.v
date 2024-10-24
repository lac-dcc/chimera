// Seed: 426555716
module module_0 (
    output id_0,
    input id_1,
    output id_2,
    input id_3,
    input id_4,
    input reg id_5,
    input reg id_6,
    input id_7,
    input logic id_8
);
  reg id_9;
  type_22(
      1, id_5, (1'b0 == id_4)
  );
  always @(id_5, posedge id_6)
    if (id_1) id_0 = SystemTFIdentifier(id_5);
    else if (id_8) begin
      id_9 <= id_5;
    end else id_2 <= 1;
  class id_10;
    logic id_11;
    logic id_12;
    logic id_13;
  endclass : id_14
  logic id_15;
  logic id_16 = 1;
  logic id_17;
  assign id_11 = id_14;
endmodule
