// Seed: 4118055268
module module_0;
  logic [7:0] id_2;
  supply1 id_3 = 1'b0;
  always @(posedge 1'b0) begin
    wait (id_3 == id_2[1]);
  end
  wire id_4;
  always @* release module_0;
endmodule
module module_1 (
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_19;
  module_0();
  initial
    forever begin
      @(negedge id_18) id_4 <= 1'b0;
      id_15 = 1;
      #1
      for (id_16 = 1 | 1; 1; id_16 += id_16)
      for (id_18 = 1'b0; 1; module_1 = 1 | id_10 | id_8 | 1) #1;
      wait (id_15);
      cover (1);
    end
  assign id_7 = 1;
endmodule
