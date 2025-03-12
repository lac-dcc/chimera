// Seed: 235310693
module module_0 (
    input wand id_0,
    input supply0 id_1,
    input tri0 id_2,
    input wire id_3,
    output logic id_4,
    input supply0 id_5
);
  genvar id_7;
  initial begin : LABEL_0
    id_4 <= -1;
    id_4 <= id_5;
  end
endmodule
module module_1 (
    output supply0 id_0,
    output uwire id_1,
    input wor id_2,
    input uwire id_3,
    output wire id_4,
    input wor id_5,
    output logic id_6,
    output tri0 id_7
);
  localparam id_9 = 1;
  parameter id_10 = 1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_6,
      id_5
  );
  assign modCall_1.id_4 = 0;
  assign id_6 = -1 || -1;
  assign id_0 = -1;
  always @(id_5, posedge -1'd0) begin : LABEL_0
    #1 id_6 = id_5;
  end
  always @(~id_9) #1;
endmodule
