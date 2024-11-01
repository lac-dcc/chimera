// Seed: 2958419735
module module_0 (
    module_0,
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_7 :
  assert property (@(posedge 1) id_1)
  else $display(1, id_7);
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    output wire  id_0,
    output logic id_1
    , id_6,
    output logic id_2,
    output wire  id_3,
    input  tri0  id_4
);
  id_7 :
  assert property (@(posedge id_4 > id_7) 1)
  else $display;
  module_0(
      id_7, id_7, id_7, id_7, id_7, id_7
  );
  reg id_8 = 1, id_9;
  wire id_10;
  always @(posedge 1) begin
    force id_0 = 1;
    $display;
    fork
      case (1)
        id_7: id_9 <= id_6;
        default: id_6 <= 1;
      endcase
      id_2 <= 1;
    join_any
    id_1 = #1 1;
    $display(1);
  end
endmodule
