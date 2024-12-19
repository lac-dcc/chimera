// Seed: 1532618704
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_5;
  wire id_6;
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
    id_10
);
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  function id_11();
    begin : LABEL_0
      assume #1  (id_7)
      else $display(id_6);
      id_1 = 1;
    end
  endfunction
  module_0 modCall_1 (
      id_2,
      id_3,
      id_2,
      id_9
  );
  assign id_2 = 1;
  wire id_12;
  initial begin : LABEL_0
    if (1)
      if (id_3 == 1'b0) begin : LABEL_0
        id_1 <= 1'b0;
      end else id_11 <= 0;
  end
  wire id_13;
endmodule
