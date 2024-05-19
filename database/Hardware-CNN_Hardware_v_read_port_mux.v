// This program was cloned from: https://github.com/alan4186/Hardware-CNN
// License: MIT License

`include "../network_params.h"
module read_port_mux( // combinds several sram read ports into one address space
  input clock,
  input reset,
 
  input [`RAM_SELECT_BITWIDTH:0] ram_select,
  input [(`FFN_IN_WIDTH*`NUM_KERNELS)-1:0] buffer_data_vector,

  output reg [`FFN_IN_BITWIDTH:0] data_out
);

always@(*) begin
  if (reset == 1'b0) begin 
    data_out = `FFN_IN_WIDTH'd0;
  end else begin
    case(ram_select)
      8'd0: data_out = buffer_data_vector[23:0];
      8'd1: data_out = buffer_data_vector[47:24];
      8'd2: data_out = buffer_data_vector[71:48];
      8'd3: data_out = buffer_data_vector[95:72];
      8'd4: data_out = buffer_data_vector[119:96];
      8'd5: data_out = buffer_data_vector[143:120];
      8'd6: data_out = buffer_data_vector[167:144];
      8'd7: data_out = buffer_data_vector[191:168];
    endcase
  end //reset
end //always
endmodule