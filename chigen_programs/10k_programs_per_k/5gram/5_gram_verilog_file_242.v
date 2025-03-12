// Seed: 2615647892
module module_0 (
    output tri0 id_0,
    input  tri  id_1
);
  wire id_3;
  ;
  module_2 modCall_1 (
      id_3,
      id_3
  );
endmodule
module module_1 (
    output tri1  id_0,
    input  tri0  id_1,
    input  uwire id_2,
    input  wand  id_3
);
  assign id_0 = id_2;
  module_0 modCall_1 (
      id_0,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  assign module_0.id_0 = 0;
  output wire id_1;
  logic id_3;
endmodule
module module_3 (
    input supply1 id_0,
    output supply1 id_1,
    output logic id_2,
    input wor id_3,
    input wand id_4
);
  parameter id_6 = 1;
  module_2 modCall_1 (
      id_6,
      id_6
  );
  wire [(  (  1  )  ) : 1 'd0] id_7;
  localparam id_8 = id_6.id_6 == 1;
  bit id_9;
  ;
  always_ff @(posedge 1 or negedge (1))
    if (id_6) begin : LABEL_0
      id_2 <= id_7;
    end else begin : LABEL_1
      begin : LABEL_2
        fork
          begin : LABEL_3
            wait (id_6);
            if (1) begin : LABEL_4
              id_9 <= id_8;
            end
          end
        join_none
      end
    end
endmodule
