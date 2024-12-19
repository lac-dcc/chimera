// Seed: 2368251862
module module_0;
  wire id_2;
  assign id_2 = id_1;
  module_2 modCall_1 ();
endmodule
module module_1 (
    output logic id_0
);
  always @(posedge 1)
    if (id_2 * id_2)
      if (id_2) id_0 <= id_2;
      else $display(1);
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_3 = 32'd86
);
  assign id_1 = id_1;
  wire id_2;
  defparam id_3 = 1'h0;
  assign module_3.id_11 = 0;
  wire id_4;
  wire id_5;
endmodule
module module_3 (
    output logic id_0,
    input  logic id_1,
    output logic id_2,
    input  logic id_3,
    input  logic id_4,
    output logic id_5,
    output tri0  id_6,
    input  tri1  id_7
);
  assign id_0 = id_4;
  reg id_9;
  assign id_6 = 1;
  logic id_10, id_11;
  always
    case (id_10)
      (id_1):
      if (1'b0)
        @(posedge 1'b0)
          @(posedge id_4)
            @(id_3) begin : LABEL_0
              id_9 <= 1;
              id_5 <= id_10;
              $display;
            end
      1: begin : LABEL_0
        if (id_3) #1 id_11 <= id_1;
        else id_2 = id_10;
      end
      id_10: begin : LABEL_0
        id_5 = 1 ** 1;
      end
      1'b0:
      if (1) id_11 = ~1;
      else id_10 = id_4;
    endcase
  wire id_12, id_13;
  module_2 modCall_1 ();
  wire id_14;
endmodule
