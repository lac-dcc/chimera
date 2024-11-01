// Seed: 3829256256
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
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  id_9(
      .id_0(1)
  );
  always @(posedge 1'd0)
    if (id_2) id_6 = 1;
    else begin
      case (1'b0)
        1:
        if (id_2) id_3 = id_4;
        else {id_6} += (1'b0) == ~id_3;
        default: id_6 = id_6;
      endcase
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
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_3 = 1'b0;
  module_0(
      id_4, id_1, id_1, id_2, id_1, id_2, id_5, id_5
  );
endmodule
