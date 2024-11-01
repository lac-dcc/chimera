// Seed: 3851593196
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_9;
  assign id_4 = 1;
  wire id_10;
  initial begin
    disable id_11;
    #1;
    if (1 === 1) disable id_12;
    else begin
      if (id_12) disable id_13;
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  supply0 id_5;
  assign id_5 = 1 ? id_5 : 1;
  module_0(
      id_5, id_5, id_5, id_5, id_5, id_2, id_2, id_5
  );
  always @(id_5 - id_2 or posedge 1'b0) begin
    wait (1);
  end
  always repeat (id_1) id_4 = #1 id_1;
endmodule
