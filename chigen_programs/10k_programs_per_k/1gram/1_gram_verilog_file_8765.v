// Seed: 3109355732
module module_0 (
    output tri1 id_0,
    input  wor  id_1,
    output wor  id_2
);
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input uwire id_0,
    inout wire id_1,
    input supply0 id_2,
    input tri0 id_3,
    output supply1 id_4,
    inout logic id_5
);
  wire id_7;
  ;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4
  );
  always id_5 <= id_2;
endmodule
module module_2;
  struct packed {
    logic id_1;
    logic id_2;
    logic id_3;
    logic id_4  = 1;
    logic id_5;
    logic id_6;
    logic id_7;
    logic id_8;
  } id_9 = id_9;
  assign module_3.id_7 = 0;
endmodule
module module_3 (
    input uwire id_0,
    output logic id_1,
    output logic id_2,
    input supply0 id_3,
    input tri0 id_4
);
  always_ff begin : LABEL_0
    id_1 <= ~(id_4);
  end
  localparam id_6 = 1;
  always id_2 = {id_3} - id_6;
  initial id_1 <= id_6;
  module_2 modCall_1 ();
  logic id_7 = -1;
  always if (id_6) id_1 <= id_7;
  assign id_2 = -1'b0;
  assign id_7 = id_0;
  assign id_7 = id_6;
  assign id_2 = -1'h0;
endmodule
