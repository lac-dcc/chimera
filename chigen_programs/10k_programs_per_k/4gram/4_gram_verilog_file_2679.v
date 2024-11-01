// Seed: 2108434554
module module_0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = !id_2;
  always @(posedge 1 or negedge 1) begin
    id_4 = id_3;
  end
  module_0();
  always_latch begin
    id_5 <= id_6++;
  end
endmodule
module module_2 (
    output supply1 id_0,
    input  supply0 id_1
);
  supply0 id_3;
  reg id_4;
  module_0();
  if (1) begin : id_5
    always_latch @(posedge id_3) begin
      id_4 <= 1;
    end
  end else begin : id_6
    wire id_7, id_8, id_9, id_10, id_11, id_12;
  end
  supply1 id_13;
  assign id_13 = 1;
endmodule
