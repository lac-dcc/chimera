// Seed: 3475220505
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
  wire id_6 = id_2;
  always #1 id_3 = 1;
  wire id_7;
endmodule
module module_1;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1
  );
  wire id_4;
  wire id_5 = 1;
endmodule
module module_2 (
    output logic   id_0,
    input  supply1 id_1,
    output logic   id_2
);
  id_4 :
  assert property (@(negedge id_1) id_4)
  else if (id_4 - id_1) begin : LABEL_0
    id_2 <= ~id_1;
    if (id_4 - 1) begin : LABEL_0
      id_0 <= 1'd0;
      id_0 = 1;
    end
  end else $display;
  not primCall (id_0, id_1);
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5
  );
endmodule
