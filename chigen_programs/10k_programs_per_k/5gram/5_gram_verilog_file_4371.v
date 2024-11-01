// Seed: 2858612538
module module_0 (
    input supply0 id_0,
    output tri id_1,
    input tri id_2
);
  assign id_1 = 1'b0;
endmodule
module module_1 (
    input  uwire id_0,
    output logic id_1,
    output logic id_2,
    input  logic id_3,
    input  logic id_4,
    input  uwire id_5,
    input  logic id_6,
    input  wor   id_7
);
  assign id_2 = 1 - 1;
  genvar id_9;
  always @(posedge id_5)
    if (id_3) begin
      id_1 <= 1;
      @(posedge id_0);
      assert (1);
      id_1 = 1 - id_4;
      id_9 = id_0;
    end else if (1'b0) begin
      id_1 <= id_3;
    end
  reg id_10;
  assign id_1 = 1;
  always_latch @("" + id_3) begin
    id_2 <= id_6;
  end
  initial
    #(1'd0) begin
      $display(1'b0, id_4, 1, 1, 1);
      id_1 = #1 id_4;
    end
  initial
    if (1'b0)
      if (id_10) begin
        id_2 <= 1;
      end else begin
        if (1'b0) id_10 <= 1'd0;
        else id_2 <= 1'b0;
      end
  module_0(
      id_5, id_9, id_7
  );
endmodule
