// Seed: 214469521
module module_0;
  reg id_1;
  assign module_2.id_5 = 0;
  always_latch @(posedge 1, posedge 1'b0) begin : LABEL_0
    fork
      #(-1) begin : LABEL_1
        id_1 <= ~id_1;
      end
      id_1 = 1;
    join
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  logic [-1 : 1] id_4;
endmodule
module module_2 #(
    parameter id_10 = 32'd29
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout wire id_8;
  output logic [7:0] id_7;
  inout wire id_6;
  output uwire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  localparam id_10 = -1;
  assign id_5 = 1 - id_4;
  assign id_5 = (id_4);
  wire [{  (  1 'd0 )  ,  1  -  id_10  } : 1] id_11;
  assign id_7[""] = id_9 ? "" : id_6;
  wire id_12;
  module_0 modCall_1 ();
endmodule
