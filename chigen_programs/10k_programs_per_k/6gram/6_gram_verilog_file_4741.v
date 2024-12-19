// Seed: 3910258559
module module_0;
  wire id_1;
  wire id_2;
  assign module_1.type_1 = 0;
  wire id_4;
endmodule
module module_1 (
    output wire  id_0,
    input  wire  id_1,
    output uwire id_2
);
  wire id_4;
  bufif0 primCall (id_0, id_1, id_4);
  module_0 modCall_1 ();
  assign id_0 = 1;
endmodule
module module_2 (
    input  logic id_0,
    input  logic id_1,
    input  wire  id_2,
    inout  logic id_3,
    output logic id_4
);
  always @(id_0 >> id_0) id_3 = #1 1;
  initial begin : LABEL_0
    case (id_1)
      id_0: begin : LABEL_0
        id_3 <= id_1;
      end
      1: id_4 = 1'b0;
      default: id_4 <= 1;
    endcase
    @(posedge id_0) id_4 = id_0;
    $display;
  end
  assign id_4 = 1;
  module_0 modCall_1 ();
endmodule
