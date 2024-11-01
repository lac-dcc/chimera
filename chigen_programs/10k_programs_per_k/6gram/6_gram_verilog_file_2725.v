// Seed: 2364211920
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  reg id_3;
  supply1 id_4;
  always @(posedge 1) begin
    disable id_5;
    $display(1);
    id_3 <= 1;
    for (id_3 = id_4; 1; id_3 = id_1) #1;
    id_3 <= id_1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2[1] = 1;
  wire id_7;
  always @(1'b0 or negedge id_6) begin
    id_5 <= id_6;
    if (1) begin
      if (id_6) begin
        wait (id_6);
      end else id_4 = id_1;
    end
  end
  module_0(
      id_1, id_3
  );
  initial begin
    $display(id_1, id_5);
    $display(1, 1 - 1'b0);
  end
endmodule
