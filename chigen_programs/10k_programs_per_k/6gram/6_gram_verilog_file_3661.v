// Seed: 2828882654
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  always @(1'b0 - id_8 or posedge ~(1)) begin
    if (~id_10) disable id_12;
    else begin
      if (id_11) begin
        id_1 = 1;
        deassign id_6;
      end else begin
        assume #1  (1 < id_10) $display(id_5, id_9);
        else;
        $display;
      end
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_5 = 1;
  module_0(
      id_1, id_1, id_5, id_1, id_1, id_3, id_1, id_1, id_1, id_1, id_1
  );
  always @(id_4[1] or posedge 1) begin
    if (1'b0) begin
      id_2 = id_4;
    end
  end
endmodule
